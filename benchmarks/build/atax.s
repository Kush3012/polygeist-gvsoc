	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function main
.LCPI0_0:
	.word	0x42000000                      # float 32
.LCPI0_1:
	.word	0x3f800000                      # float 1
	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -2032
	.cfi_def_cfa_offset 2032
	sw	ra, 2028(sp)                    # 4-byte Folded Spill
	sw	s0, 2024(sp)                    # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	lui	a0, 1
	addi	a0, a0, -1504
	sub	sp, sp, a0
	.cfi_def_cfa_offset 4624
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	ft1, %lo(.LCPI0_1)(a0)
	li	a3, 0
	li	a0, 0
	li	a1, 31
	lui	a2, 1
	addi	a2, a2, 136
	add	a2, a2, sp
	beqz	a0, .LBB0_2
.LBB0_1:
	sgtz	a4, a0
	beqz	a4, .LBB0_3
	j	.LBB0_4
.LBB0_2:
	sltu	a4, a1, a3
	bnez	a4, .LBB0_4
.LBB0_3:
	fcvt.s.w	ft2, a3
	fdiv.s	ft2, ft2, ft0
	fadd.s	ft2, ft2, ft1
	slli	a4, a3, 2
	add	a4, a4, a2
	fsw	ft2, 0(a4)
	addi	a4, a3, 1
	sltu	a3, a4, a3
	add	a0, a0, a3
	mv	a3, a4
	beqz	a0, .LBB0_2
	j	.LBB0_1
.LBB0_4:
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	addi	a2, sp, 136
	j	.LBB0_6
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_8
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_9
	j	.LBB0_13
.LBB0_8:                                #   in Loop: Header=BB0_6 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB0_13
.LBB0_9:                                #   in Loop: Header=BB0_6 Depth=1
	li	a0, 0
	beqz	a4, .LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_6 Depth=1
	sgtz	s0, a4
	beqz	s0, .LBB0_12
	j	.LBB0_5
.LBB0_11:                               #   in Loop: Header=BB0_6 Depth=1
	sltu	s0, a1, a0
	bnez	s0, .LBB0_5
.LBB0_12:                               #   in Loop: Header=BB0_6 Depth=1
	addi	a5, a0, 1
	mul	s0, a3, a5
	fcvt.s.w	ft1, s0
	fdiv.s	ft1, ft1, ft0
	slli	s0, a3, 5
	add	s0, s0, a0
	slli	s0, s0, 2
	add	s0, s0, a2
	fsw	ft1, 0(s0)
	sltu	a0, a5, a0
	add	a4, a4, a0
	mv	a0, a5
	beqz	a4, .LBB0_11
	j	.LBB0_10
.LBB0_13:
	sw	zero, 116(sp)
	li	a0, 1
	sw	a0, 112(sp)
	sw	zero, 108(sp)
	li	a4, 32
	sw	a4, 104(sp)
	sw	zero, 100(sp)
	sw	zero, 96(sp)
	lui	a1, 1
	addi	a1, a1, 392
	add	a1, a1, sp
	sw	a1, 92(sp)
	sw	a1, 88(sp)
	sw	zero, 84(sp)
	sw	a0, 80(sp)
	sw	zero, 76(sp)
	sw	a4, 72(sp)
	sw	zero, 68(sp)
	sw	zero, 64(sp)
	lui	a1, 1
	addi	a1, a1, 264
	add	s0, sp, a1
	sw	s0, 60(sp)
	sw	s0, 56(sp)
	sw	zero, 52(sp)
	sw	a0, 48(sp)
	sw	zero, 44(sp)
	sw	a4, 40(sp)
	sw	zero, 36(sp)
	sw	zero, 32(sp)
	lui	a1, 1
	addi	a1, a1, 136
	add	a1, a1, sp
	sw	a1, 28(sp)
	sw	a1, 24(sp)
	sw	zero, 20(sp)
	sw	a0, 16(sp)
	sw	zero, 12(sp)
	sw	a4, 8(sp)
	sw	zero, 4(sp)
	li	a0, 32
	li	a1, 32
	addi	a2, sp, 136
	addi	a3, sp, 136
	li	a6, 32
	sw	a4, 0(sp)
	li	a4, 0
	li	a5, 0
	li	a7, 0
	call	kernel_atax
	li	a2, 0
	li	a0, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	beqz	a0, .LBB0_15
.LBB0_14:
	sgtz	a3, a0
	beqz	a3, .LBB0_16
	j	.LBB0_17
.LBB0_15:
	sltu	a3, a1, a2
	bnez	a3, .LBB0_17
.LBB0_16:
	slli	a3, a2, 2
	add	a3, a3, s0
	flw	ft1, 0(a3)
	fadd.s	ft0, ft0, ft1
	addi	a3, a2, 1
	sltu	a2, a3, a2
	add	a0, a0, a2
	mv	a2, a3
	beqz	a0, .LBB0_15
	j	.LBB0_14
.LBB0_17:
	fmv.w.x	ft1, zero
	flt.s	a0, ft1, ft0
	xori	a0, a0, 1
	lui	a1, 1
	addi	a1, a1, -1504
	add	sp, sp, a1
	lw	ra, 2028(sp)                    # 4-byte Folded Reload
	lw	s0, 2024(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_atax
	.type	kernel_atax,@function
kernel_atax:                            # @kernel_atax
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	s0, 72(sp)                      # 4-byte Folded Spill
	sw	s1, 68(sp)                      # 4-byte Folded Spill
	sw	s2, 64(sp)                      # 4-byte Folded Spill
	sw	s3, 60(sp)                      # 4-byte Folded Spill
	sw	s4, 56(sp)                      # 4-byte Folded Spill
	sw	s5, 52(sp)                      # 4-byte Folded Spill
	sw	s6, 48(sp)                      # 4-byte Folded Spill
	sw	s7, 44(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	.cfi_offset s6, -32
	.cfi_offset s7, -36
	lw	s4, 108(sp)
	lw	s5, 140(sp)
	lw	s6, 172(sp)
	mv	s2, a3
	mv	s1, a1
	mv	s3, a0
	srai	s0, a1, 31
	lui	a0, %hi(.L__unnamed_1)
	addi	s7, a0, %lo(.L__unnamed_1)
	mv	a0, s7
	call	__kmpc_global_thread_num@plt
	sw	s0, 12(sp)
	sw	s1, 8(sp)
	sw	s3, 4(sp)
	addi	a0, sp, 8
	sw	a0, 16(sp)
	addi	a0, sp, 4
	sw	a0, 20(sp)
	sw	s6, 24(sp)
	sw	s2, 28(sp)
	sw	s5, 32(sp)
	sw	s4, 36(sp)
	lui	a0, %hi(kernel_atax..omp_par)
	addi	a2, a0, %lo(kernel_atax..omp_par)
	li	a1, 1
	addi	a3, sp, 16
	mv	a0, s7
	call	__kmpc_fork_call@plt
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	s0, 72(sp)                      # 4-byte Folded Reload
	lw	s1, 68(sp)                      # 4-byte Folded Reload
	lw	s2, 64(sp)                      # 4-byte Folded Reload
	lw	s3, 60(sp)                      # 4-byte Folded Reload
	lw	s4, 56(sp)                      # 4-byte Folded Reload
	lw	s5, 52(sp)                      # 4-byte Folded Reload
	lw	s6, 48(sp)                      # 4-byte Folded Reload
	lw	s7, 44(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end1:
	.size	kernel_atax, .Lfunc_end1-kernel_atax
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_atax..omp_par
	.type	kernel_atax..omp_par,@function
kernel_atax..omp_par:                   # @kernel_atax..omp_par
# %bb.0:                                # %omp.par.entry
	addi	sp, sp, -128
	sw	ra, 124(sp)                     # 4-byte Folded Spill
	sw	s0, 120(sp)                     # 4-byte Folded Spill
	sw	s1, 116(sp)                     # 4-byte Folded Spill
	sw	s2, 112(sp)                     # 4-byte Folded Spill
	sw	s3, 108(sp)                     # 4-byte Folded Spill
	sw	s4, 104(sp)                     # 4-byte Folded Spill
	sw	s5, 100(sp)                     # 4-byte Folded Spill
	sw	s6, 96(sp)                      # 4-byte Folded Spill
	sw	s7, 92(sp)                      # 4-byte Folded Spill
	sw	s8, 88(sp)                      # 4-byte Folded Spill
	lw	a1, 0(a2)
	lw	a3, 4(a2)
	lw	s4, 8(a2)
	lw	a0, 0(a0)
	lw	s1, 12(a2)
	lw	s6, 16(a2)
	lw	s5, 20(a2)
	sw	a0, 84(sp)
	lw	s0, 4(a1)
	lw	s7, 0(a1)
	beqz	s0, .LBB2_2
# %bb.1:                                # %omp.par.entry
	li	a2, 0
	slti	a1, s0, 0
	j	.LBB2_3
.LBB2_2:
	seqz	a1, s7
	sltiu	a2, s7, 2
.LBB2_3:                                # %omp.par.entry
	li	a0, 1
	li	a4, 1
	bnez	a2, .LBB2_5
# %bb.4:                                # %omp.par.entry
	mv	a4, s7
.LBB2_5:                                # %omp.par.entry
	lw	s8, 0(a3)
	sw	zero, 72(sp)
	sw	zero, 76(sp)
	addi	a3, a4, -1
	sltu	a4, a3, a4
	bnez	a2, .LBB2_7
# %bb.6:                                # %omp.par.entry
	add	a4, a4, s0
.LBB2_7:                                # %omp.par.entry
	li	a2, -1
	li	a5, -1
	bnez	a1, .LBB2_9
# %bb.8:                                # %omp.par.entry
	addi	a2, a4, -1
	mv	a5, a3
.LBB2_9:                                # %omp.par.entry
	sw	a5, 64(sp)
	sw	a2, 68(sp)
	sw	a0, 56(sp)
	sw	zero, 60(sp)
	lui	a0, %hi(.L__unnamed_1)
	addi	s3, a0, %lo(.L__unnamed_1)
	mv	a0, s3
	call	__kmpc_global_thread_num@plt
	mv	s2, a0
	sw	zero, 12(sp)
	sw	zero, 8(sp)
	li	a2, 34
	addi	a3, sp, 80
	addi	a4, sp, 72
	addi	a5, sp, 64
	addi	a6, sp, 56
	li	a7, 1
	sw	zero, 0(sp)
	mv	a0, s3
	mv	a1, s2
	call	__kmpc_for_static_init_8u@plt
	lw	a6, 76(sp)
	lw	a0, 72(sp)
	lw	a4, 64(sp)
	lw	a5, 68(sp)
	li	a2, 0
	li	a1, 0
	sltu	a3, a4, a0
	sub	a5, a5, a6
	sub	a5, a5, a3
	sub	a4, a4, a0
	addi	a3, a4, 1
	sltu	a4, a3, a4
	add	a4, a4, a5
	beq	a1, a4, .LBB2_11
.LBB2_10:                               # %omp_loop.header
	sltu	a5, a1, a4
	bnez	a5, .LBB2_12
	j	.LBB2_13
.LBB2_11:
	sltu	a5, a2, a3
	beqz	a5, .LBB2_13
.LBB2_12:                               # %omp_loop.body
	add	a5, a2, a0
	slli	a5, a5, 2
	add	a5, a5, s6
	sw	zero, 0(a5)
	addi	a5, a2, 1
	sltu	a2, a5, a2
	add	a1, a1, a2
	mv	a2, a5
	beq	a1, a4, .LBB2_11
	j	.LBB2_10
.LBB2_13:                               # %omp_loop.exit
	lui	a0, %hi(.L__unnamed_1)
	addi	s3, a0, %lo(.L__unnamed_1)
	mv	a0, s3
	mv	a1, s2
	call	__kmpc_for_static_fini@plt
	mv	a0, s3
	call	__kmpc_global_thread_num@plt
	mv	a1, a0
	lui	a0, %hi(.L__unnamed_2)
	addi	a0, a0, %lo(.L__unnamed_2)
	call	__kmpc_barrier@plt
	srai	a2, s8, 31
	beqz	a2, .LBB2_15
# %bb.14:                               # %omp_loop.exit
	li	a3, 0
	slti	a1, a2, 0
	j	.LBB2_16
.LBB2_15:
	seqz	a1, s8
	sltiu	a3, s8, 2
.LBB2_16:                               # %omp_loop.exit
	li	a0, 1
	li	a5, 1
	bnez	a3, .LBB2_18
# %bb.17:                               # %omp_loop.exit
	mv	a5, s8
.LBB2_18:                               # %omp_loop.exit
	sw	zero, 44(sp)
	sw	zero, 40(sp)
	addi	a4, a5, -1
	sltu	a5, a4, a5
	bnez	a3, .LBB2_20
# %bb.19:                               # %omp_loop.exit
	add	a5, a5, a2
.LBB2_20:                               # %omp_loop.exit
	li	a2, -1
	li	a3, -1
	bnez	a1, .LBB2_22
# %bb.21:                               # %omp_loop.exit
	addi	a2, a5, -1
	mv	a3, a4
.LBB2_22:                               # %omp_loop.exit
	sw	a3, 32(sp)
	sw	a2, 36(sp)
	sw	zero, 28(sp)
	sw	a0, 24(sp)
	mv	a0, s3
	call	__kmpc_global_thread_num@plt
	mv	s2, a0
	sw	zero, 12(sp)
	sw	zero, 8(sp)
	li	a2, 34
	addi	a3, sp, 52
	addi	a4, sp, 40
	addi	a5, sp, 32
	addi	a6, sp, 24
	li	a7, 1
	sw	zero, 0(sp)
	mv	a0, s3
	mv	a1, s2
	call	__kmpc_for_static_init_8u@plt
	lw	a0, 44(sp)
	lw	a7, 40(sp)
	lw	a1, 32(sp)
	lw	a2, 36(sp)
	li	t2, 0
	li	t1, 0
	sltu	a3, a1, a7
	sub	a0, a2, a0
	sub	a0, a0, a3
	sub	a1, a1, a7
	addi	a6, a1, 1
	sltu	a1, a6, a1
	add	t0, a0, a1
	j	.LBB2_24
.LBB2_23:                               # %omp.wsloop.region23
                                        #   in Loop: Header=BB2_24 Depth=1
	addi	a0, t2, 1
	sltu	a1, a0, t2
	add	t1, t1, a1
	mv	t2, a0
.LBB2_24:                               # %omp_loop.header7
                                        # =>This Inner Loop Header: Depth=1
	beq	t1, t0, .LBB2_26
# %bb.25:                               # %omp_loop.header7
                                        #   in Loop: Header=BB2_24 Depth=1
	sltu	a0, t1, t0
	bnez	a0, .LBB2_27
	j	.LBB2_35
.LBB2_26:                               #   in Loop: Header=BB2_24 Depth=1
	sltu	a0, t2, a6
	beqz	a0, .LBB2_35
.LBB2_27:                               # %omp_loop.body9
                                        #   in Loop: Header=BB2_24 Depth=1
	li	a1, 0
	li	a0, 0
	add	a4, t2, a7
	slli	a2, a4, 2
	add	a5, s4, a2
	sw	zero, 0(a5)
	beq	a0, s0, .LBB2_29
.LBB2_28:                               # %omp.wsloop.region18
                                        #   in Loop: Header=BB2_24 Depth=1
	slt	a2, a0, s0
	slli	a3, a4, 5
	bnez	a2, .LBB2_30
	j	.LBB2_31
.LBB2_29:                               #   in Loop: Header=BB2_24 Depth=1
	sltu	a2, a1, s7
	slli	a3, a4, 5
	beqz	a2, .LBB2_31
.LBB2_30:                               # %omp.wsloop.region19
                                        #   in Loop: Header=BB2_24 Depth=1
	add	a2, a3, a1
	slli	a2, a2, 2
	add	a2, a2, s1
	flw	ft0, 0(a2)
	slli	a2, a1, 2
	add	a2, a2, s5
	flw	ft1, 0(a2)
	flw	ft2, 0(a5)
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a5)
	addi	a2, a1, 1
	sltu	a1, a2, a1
	add	a0, a0, a1
	mv	a1, a2
	beq	a0, s0, .LBB2_29
	j	.LBB2_28
.LBB2_31:                               # %omp.wsloop.region20
                                        #   in Loop: Header=BB2_24 Depth=1
	li	a1, 0
	li	a0, 0
	beq	a0, s0, .LBB2_33
.LBB2_32:                               # %omp.wsloop.region21
                                        #   in Loop: Header=BB2_24 Depth=1
	slt	a2, a0, s0
	bnez	a2, .LBB2_34
	j	.LBB2_23
.LBB2_33:                               #   in Loop: Header=BB2_24 Depth=1
	sltu	a2, a1, s7
	beqz	a2, .LBB2_23
.LBB2_34:                               # %omp.wsloop.region22
                                        #   in Loop: Header=BB2_24 Depth=1
	add	a2, a3, a1
	slli	a2, a2, 2
	add	a2, a2, s1
	flw	ft0, 0(a2)
	flw	ft1, 0(a5)
	slli	a2, a1, 2
	add	a2, a2, s6
	flw	ft2, 0(a2)
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a2)
	addi	a2, a1, 1
	sltu	a1, a2, a1
	add	a0, a0, a1
	mv	a1, a2
	beq	a0, s0, .LBB2_33
	j	.LBB2_32
.LBB2_35:                               # %omp_loop.exit11
	lui	a0, %hi(.L__unnamed_1)
	addi	s1, a0, %lo(.L__unnamed_1)
	mv	a0, s1
	mv	a1, s2
	call	__kmpc_for_static_fini@plt
	mv	a0, s1
	call	__kmpc_global_thread_num@plt
	mv	a1, a0
	lui	a0, %hi(.L__unnamed_2)
	addi	a0, a0, %lo(.L__unnamed_2)
	call	__kmpc_barrier@plt
	lw	ra, 124(sp)                     # 4-byte Folded Reload
	lw	s0, 120(sp)                     # 4-byte Folded Reload
	lw	s1, 116(sp)                     # 4-byte Folded Reload
	lw	s2, 112(sp)                     # 4-byte Folded Reload
	lw	s3, 108(sp)                     # 4-byte Folded Reload
	lw	s4, 104(sp)                     # 4-byte Folded Reload
	lw	s5, 100(sp)                     # 4-byte Folded Reload
	lw	s6, 96(sp)                      # 4-byte Folded Reload
	lw	s7, 92(sp)                      # 4-byte Folded Reload
	lw	s8, 88(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 128
	ret
.Lfunc_end2:
	.size	kernel_atax..omp_par, .Lfunc_end2-kernel_atax..omp_par
                                        # -- End function
	.type	.L__unnamed_3,@object           # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_3:
	.asciz	";unknown;unknown;0;0;;"
	.size	.L__unnamed_3, 23

	.type	.L__unnamed_1,@object           # @1
	.section	.rodata,"a",@progbits
	.p2align	3
.L__unnamed_1:
	.word	0                               # 0x0
	.word	2                               # 0x2
	.word	0                               # 0x0
	.word	22                              # 0x16
	.word	.L__unnamed_3
	.size	.L__unnamed_1, 20

	.type	.L__unnamed_2,@object           # @2
	.p2align	3
.L__unnamed_2:
	.word	0                               # 0x0
	.word	66                              # 0x42
	.word	0                               # 0x0
	.word	22                              # 0x16
	.word	.L__unnamed_3
	.size	.L__unnamed_2, 20

	.section	".note.GNU-stack","",@progbits
