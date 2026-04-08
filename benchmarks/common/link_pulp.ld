/*
 * link_pulp.ld - Linker script for GVSoC pulp-open target
 *
 * Memory layout:
 *   L2 memory:     0x1C000000 - 0x1C18FFFF (~1.5 MB, code + data)
 *   Cluster L1:    0x10000000 - 0x1000FFFF (64 KB, TCDM scratchpad)
 *   Cluster Ctrl:  0x10200000 (boot address, fetch enable)
 *   Event Unit:    0x10200800 (barriers, dispatch)
 *
 * Code and data are placed in L2. Each cluster core gets its own
 * stack region. Core 0 (master) stack is at top of L2.
 * Worker cores 1..7 get stacks within L2 as well.
 */

OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    /* L2 shared memory - skip first 64KB (private banks) */
    L2 : ORIGIN = 0x1C010000, LENGTH = 0x00180000
}

/* Per-core stack size: 4 KB per core, 8 cores = 32 KB total */
_core_stack_size = 0x1000;

SECTIONS
{
    .init :
    {
        . = ALIGN(4);
        KEEP(*(.init))
        . = ALIGN(4);
    } > L2

    .text :
    {
        . = ALIGN(4);
        _stext = .;
        *(.text)
        *(.text.*)
        *(.gnu.linkonce.t.*)
        _etext = .;
        . = ALIGN(4);
    } > L2

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata.*)
        *(.srodata)
        *(.srodata.*)
        . = ALIGN(4);
    } > L2

    .data :
    {
        . = ALIGN(4);
        __global_pointer$ = . + 0x800;
        _sdata = .;
        *(.data)
        *(.data.*)
        *(.sdata)
        *(.sdata.*)
        _edata = .;
        . = ALIGN(4);
    } > L2

    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss)
        *(.bss.*)
        *(.sbss)
        *(.sbss.*)
        *(COMMON)
        _bss_end = .;
        . = ALIGN(4);
    } > L2

    /*
     * Stack layout:
     *   8 cluster PEs × 4 KB each = 32 KB (PEs use _stack_base + (core_id+1)*4K)
     *   FC gets a separate 32 KB stack at the top (for large local arrays like 2mm/3mm)
     */
    .stack (NOLOAD) :
    {
        . = ALIGN(16);
        _stack_base = .;
        . = . + _core_stack_size * 8;  /* 8 PE stacks */
        . = . + 0x8000;               /* 32 KB FC stack */
        _stack_top = .;               /* FC stack top (used by crt0 _start) */
    } > L2

    _heap_start = .;
    _heap_end = ORIGIN(L2) + LENGTH(L2);
}
