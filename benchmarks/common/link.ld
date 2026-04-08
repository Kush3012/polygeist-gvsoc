/*
 * link.ld - Linker script for GVSoC rv32 target
 * Memory at 0x80000000, 16MB
 */

OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    /* rv32 target: memory at 0x80000000 (16 MB) */
    MEM : ORIGIN = 0x80000000, LENGTH = 0x00800000
}

SECTIONS
{
    .init :
    {
        . = ALIGN(4);
        KEEP(*(.init))
        . = ALIGN(4);
    } > MEM

    .text :
    {
        . = ALIGN(4);
        _stext = .;
        *(.text)
        *(.text.*)
        *(.gnu.linkonce.t.*)
        _etext = .;
        . = ALIGN(4);
    } > MEM

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata.*)
        *(.srodata)
        *(.srodata.*)
        . = ALIGN(4);
    } > MEM

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
    } > MEM

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
    } > MEM

    .stack (NOLOAD) :
    {
        . = ALIGN(16);
        _stack_bottom = .;
        . = . + 0x10000;   /* 64 KB stack */
        _stack_top = .;
    } > MEM

    /* Heap starts after stack */
    _heap_start = .;
    _heap_end = ORIGIN(MEM) + LENGTH(MEM);
}
