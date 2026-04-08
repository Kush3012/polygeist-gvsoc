	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function main
.LCPI0_0:
	.word	0x42000000                      # float 32
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
	lui	a0, 3
	addi	a0, a0, -1872
	sub	sp, sp, a0
	.cfi_def_cfa_offset 12448
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	addi	a2, sp, 152
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_5
	j	.LBB0_9
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB0_9
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	sgtz	s0, a4
	beqz	s0, .LBB0_8
	j	.LBB0_1
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	s0, a1, a5
	bnez	s0, .LBB0_1
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	mul	s0, a3, a5
	srai	a0, s0, 31
	srli	a0, a0, 27
	add	a0, a0, s0
	andi	a0, a0, -32
	sub	a0, s0, a0
	fcvt.s.w	ft1, a0
	fdiv.s	ft1, ft1, ft0
	slli	a0, a3, 5
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	fsw	ft1, 0(a0)
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a4, a4, a5
	mv	a5, a0
	beqz	a4, .LBB0_7
	j	.LBB0_6
.LBB0_9:
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a7, 31
	lui	a0, 1
	addi	a0, a0, 152
	add	a2, sp, a0
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a0, a3, 1
	sltu	a1, a0, a3
	add	a6, a6, a1
	mv	a3, a0
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_14
	j	.LBB0_18
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a4, a7, a3
	bnez	a4, .LBB0_18
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=1
	li	a0, 0
	beqz	a4, .LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_11 Depth=1
	sgtz	s0, a4
	beqz	s0, .LBB0_17
	j	.LBB0_10
.LBB0_16:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	s0, a7, a0
	bnez	s0, .LBB0_10
.LBB0_17:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a5, a0, 1
	mul	s0, a3, a5
	srai	a1, s0, 31
	srli	a1, a1, 27
	add	a1, a1, s0
	andi	a1, a1, -32
	sub	a1, s0, a1
	fcvt.s.w	ft1, a1
	fdiv.s	ft1, ft1, ft0
	slli	a1, a3, 5
	add	a1, a1, a0
	slli	a1, a1, 2
	add	a1, a1, a2
	fsw	ft1, 0(a1)
	sltu	a0, a5, a0
	add	a4, a4, a0
	mv	a0, a5
	beqz	a4, .LBB0_16
	j	.LBB0_15
.LBB0_18:
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	lui	a0, 2
	addi	a0, a0, 152
	add	a2, sp, a0
	j	.LBB0_20
.LBB0_19:                               #   in Loop: Header=BB0_20 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB0_20:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_22
# %bb.21:                               #   in Loop: Header=BB0_20 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_23
	j	.LBB0_27
.LBB0_22:                               #   in Loop: Header=BB0_20 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB0_27
.LBB0_23:                               #   in Loop: Header=BB0_20 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_25
.LBB0_24:                               #   in Loop: Header=BB0_20 Depth=1
	sgtz	s0, a4
	beqz	s0, .LBB0_26
	j	.LBB0_19
.LBB0_25:                               #   in Loop: Header=BB0_20 Depth=1
	sltu	s0, a1, a5
	bnez	s0, .LBB0_19
.LBB0_26:                               #   in Loop: Header=BB0_20 Depth=1
	addi	s0, a5, 2
	mul	s0, a3, s0
	srai	a0, s0, 31
	srli	a0, a0, 27
	add	a0, a0, s0
	andi	a0, a0, -32
	sub	a0, s0, a0
	fcvt.s.w	ft1, a0
	fdiv.s	ft1, ft1, ft0
	slli	a0, a3, 5
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	fsw	ft1, 0(a0)
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a4, a4, a5
	mv	a5, a0
	beqz	a4, .LBB0_25
	j	.LBB0_24
.LBB0_27:
	sw	zero, 132(sp)
	li	a0, 1
	sw	a0, 128(sp)
	sw	zero, 124(sp)
	li	a1, 32
	sw	a1, 120(sp)
	sw	zero, 116(sp)
	sw	a1, 112(sp)
	sw	zero, 108(sp)
	sw	a1, 104(sp)
	sw	zero, 100(sp)
	sw	zero, 96(sp)
	lui	a2, 2
	addi	a2, a2, 152
	add	a2, a2, sp
	sw	a2, 92(sp)
	sw	a2, 88(sp)
	sw	zero, 84(sp)
	sw	a0, 80(sp)
	sw	zero, 76(sp)
	sw	a1, 72(sp)
	sw	zero, 68(sp)
	sw	a1, 64(sp)
	sw	zero, 60(sp)
	sw	a1, 56(sp)
	sw	zero, 52(sp)
	sw	zero, 48(sp)
	lui	a2, 1
	addi	a2, a2, 152
	add	a2, a2, sp
	sw	a2, 44(sp)
	sw	a2, 40(sp)
	sw	zero, 36(sp)
	sw	a0, 32(sp)
	sw	zero, 28(sp)
	sw	a1, 24(sp)
	sw	zero, 20(sp)
	sw	a1, 16(sp)
	sw	zero, 12(sp)
	sw	a1, 8(sp)
	sw	zero, 0(sp)
	lui	a0, 260506
	addi	a4, a0, -1638
	li	a0, 32
	li	a1, 32
	li	a2, 32
	lui	a3, 261120
	addi	a5, sp, 152
	addi	a6, sp, 152
	addi	s0, sp, 152
	li	a7, 0
	call	kernel_gemm
	li	a2, 0
	li	a0, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	j	.LBB0_29
.LBB0_28:                               #   in Loop: Header=BB0_29 Depth=1
	addi	a3, a2, 1
	sltu	a2, a3, a2
	add	a0, a0, a2
	mv	a2, a3
.LBB0_29:                               # =>This Inner Loop Header: Depth=1
	beqz	a0, .LBB0_31
# %bb.30:                               #   in Loop: Header=BB0_29 Depth=1
	sgtz	a3, a0
	beqz	a3, .LBB0_32
	j	.LBB0_36
.LBB0_31:                               #   in Loop: Header=BB0_29 Depth=1
	sltu	a3, a1, a2
	bnez	a3, .LBB0_36
.LBB0_32:                               #   in Loop: Header=BB0_29 Depth=1
	li	a4, 0
	beqz	a3, .LBB0_34
.LBB0_33:                               #   in Loop: Header=BB0_29 Depth=1
	sgtz	a5, a3
	beqz	a5, .LBB0_35
	j	.LBB0_28
.LBB0_34:                               #   in Loop: Header=BB0_29 Depth=1
	sltu	a5, a1, a4
	bnez	a5, .LBB0_28
.LBB0_35:                               #   in Loop: Header=BB0_29 Depth=1
	slli	a5, a2, 5
	add	a5, a5, a4
	slli	a5, a5, 2
	add	a5, a5, s0
	flw	ft1, 0(a5)
	fadd.s	ft0, ft0, ft1
	addi	a5, a4, 1
	sltu	a4, a5, a4
	add	a3, a3, a4
	mv	a4, a5
	beqz	a3, .LBB0_34
	j	.LBB0_33
.LBB0_36:
	fmv.w.x	ft1, zero
	flt.s	a0, ft1, ft0
	xori	a0, a0, 1
	lui	a1, 3
	addi	a1, a1, -1872
	add	sp, sp, a1
	lw	ra, 2028(sp)                    # 4-byte Folded Reload
	lw	s0, 2024(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_gemm
	.type	kernel_gemm,@function
kernel_gemm:                            # @kernel_gemm
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sw	ra, 108(sp)                     # 4-byte Folded Spill
	sw	s0, 104(sp)                     # 4-byte Folded Spill
	sw	s1, 100(sp)                     # 4-byte Folded Spill
	sw	s2, 96(sp)                      # 4-byte Folded Spill
	sw	s3, 92(sp)                      # 4-byte Folded Spill
	sw	s4, 88(sp)                      # 4-byte Folded Spill
	sw	s5, 84(sp)                      # 4-byte Folded Spill
	sw	s6, 80(sp)                      # 4-byte Folded Spill
	sw	s7, 76(sp)                      # 4-byte Folded Spill
	sw	s8, 72(sp)                      # 4-byte Folded Spill
	sw	s9, 68(sp)                      # 4-byte Folded Spill
	sw	s10, 64(sp)                     # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	.cfi_offset s5, -28
	.cfi_offset s6, -32
	.cfi_offset s7, -36
	.cfi_offset s8, -40
	.cfi_offset s9, -44
	.cfi_offset s10, -48
	lw	s7, 204(sp)
	lw	s8, 156(sp)
	mv	s2, a6
	mv	s3, a4
	mv	s4, a3
	mv	s1, a2
	mv	s0, a1
	mv	s5, a0
	srai	s9, a2, 31
	srai	s10, a1, 31
	lui	a0, %hi(.L__unnamed_1)
	addi	s6, a0, %lo(.L__unnamed_1)
	mv	a0, s6
	call	__kmpc_global_thread_num@plt
	sw	s5, 28(sp)
	sw	s10, 20(sp)
	sw	s0, 16(sp)
	sw	s9, 12(sp)
	sw	s1, 8(sp)
	sw	s4, 4(sp)
	sw	s3, 0(sp)
	addi	a0, sp, 28
	sw	a0, 32(sp)
	addi	a0, sp, 16
	sw	a0, 36(sp)
	addi	a0, sp, 8
	sw	a0, 40(sp)
	addi	a0, sp, 4
	sw	a0, 44(sp)
	mv	a0, sp
	sw	a0, 48(sp)
	sw	s8, 52(sp)
	sw	s7, 56(sp)
	sw	s2, 60(sp)
	lui	a0, %hi(kernel_gemm..omp_par)
	addi	a2, a0, %lo(kernel_gemm..omp_par)
	li	a1, 1
	addi	a3, sp, 32
	mv	a0, s6
	call	__kmpc_fork_call@plt
	lw	ra, 108(sp)                     # 4-byte Folded Reload
	lw	s0, 104(sp)                     # 4-byte Folded Reload
	lw	s1, 100(sp)                     # 4-byte Folded Reload
	lw	s2, 96(sp)                      # 4-byte Folded Reload
	lw	s3, 92(sp)                      # 4-byte Folded Reload
	lw	s4, 88(sp)                      # 4-byte Folded Reload
	lw	s5, 84(sp)                      # 4-byte Folded Reload
	lw	s6, 80(sp)                      # 4-byte Folded Reload
	lw	s7, 76(sp)                      # 4-byte Folded Reload
	lw	s8, 72(sp)                      # 4-byte Folded Reload
	lw	s9, 68(sp)                      # 4-byte Folded Reload
	lw	s10, 64(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end1:
	.size	kernel_gemm, .Lfunc_end1-kernel_gemm
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_gemm..omp_par
	.type	kernel_gemm..omp_par,@function
kernel_gemm..omp_par:                   # @kernel_gemm..omp_par
# %bb.0:                                # %omp.par.entry
	addi	sp, sp, -96
	sw	ra, 92(sp)                      # 4-byte Folded Spill
	sw	s0, 88(sp)                      # 4-byte Folded Spill
	sw	s1, 84(sp)                      # 4-byte Folded Spill
	sw	s2, 80(sp)                      # 4-byte Folded Spill
	sw	s3, 76(sp)                      # 4-byte Folded Spill
	sw	s4, 72(sp)                      # 4-byte Folded Spill
	sw	s5, 68(sp)                      # 4-byte Folded Spill
	sw	s6, 64(sp)                      # 4-byte Folded Spill
	sw	s7, 60(sp)                      # 4-byte Folded Spill
	sw	s8, 56(sp)                      # 4-byte Folded Spill
	lw	a4, 0(a2)
	lw	a1, 4(a2)
	lw	a3, 8(a2)
	lw	t0, 12(a2)
	lw	a5, 16(a2)
	lw	a0, 0(a0)
	lw	s4, 20(a2)
	lw	s5, 24(a2)
	lw	s0, 28(a2)
	sw	a0, 52(sp)
	lw	s1, 0(a4)
	srai	a2, s1, 31
	beqz	a2, .LBB2_2
# %bb.1:                                # %omp.par.entry
	li	a0, 0
	slti	a7, a2, 0
	j	.LBB2_3
.LBB2_2:
	seqz	a7, s1
	sltiu	a0, s1, 2
.LBB2_3:                                # %omp.par.entry
	li	a6, 1
	li	a4, 1
	bnez	a0, .LBB2_5
# %bb.4:                                # %omp.par.entry
	mv	a4, s1
.LBB2_5:                                # %omp.par.entry
	lw	s1, 4(a1)
	lw	s6, 0(a1)
	lw	s7, 4(a3)
	lw	s8, 0(a3)
	flw	ft0, 0(t0)
	flw	ft1, 0(a5)
	sw	zero, 40(sp)
	sw	zero, 44(sp)
	addi	a1, a4, -1
	sltu	a3, a1, a4
	bnez	a0, .LBB2_7
# %bb.6:                                # %omp.par.entry
	add	a3, a3, a2
.LBB2_7:                                # %omp.par.entry
	fsw	ft1, 16(sp)                     # 4-byte Folded Spill
	fsw	ft0, 20(sp)                     # 4-byte Folded Spill
	li	a0, -1
	li	a2, -1
	bnez	a7, .LBB2_9
# %bb.8:                                # %omp.par.entry
	addi	a0, a3, -1
	mv	a2, a1
.LBB2_9:                                # %omp.par.entry
	sw	a2, 32(sp)
	sw	a0, 36(sp)
	sw	a6, 24(sp)
	sw	zero, 28(sp)
	lui	a0, %hi(.L__unnamed_1)
	addi	s3, a0, %lo(.L__unnamed_1)
	mv	a0, s3
	call	__kmpc_global_thread_num@plt
	mv	s2, a0
	sw	zero, 12(sp)
	sw	zero, 8(sp)
	li	a2, 34
	addi	a3, sp, 48
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
	flw	ft3, 20(sp)                     # 4-byte Folded Reload
	flw	ft4, 16(sp)                     # 4-byte Folded Reload
	j	.LBB2_11
.LBB2_10:                               # %omp.wsloop.region11
                                        #   in Loop: Header=BB2_11 Depth=1
	addi	a0, t2, 1
	sltu	a1, a0, t2
	add	t1, t1, a1
	mv	t2, a0
.LBB2_11:                               # %omp_loop.header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_20 Depth 2
	beq	t1, t0, .LBB2_13
# %bb.12:                               # %omp_loop.header
                                        #   in Loop: Header=BB2_11 Depth=1
	sltu	a0, t1, t0
	bnez	a0, .LBB2_14
	j	.LBB2_27
.LBB2_13:                               #   in Loop: Header=BB2_11 Depth=1
	sltu	a0, t2, a6
	beqz	a0, .LBB2_27
.LBB2_14:                               # %omp_loop.body
                                        #   in Loop: Header=BB2_11 Depth=1
	li	a3, 0
	li	a0, 0
	add	a1, t2, a7
	beq	a0, s1, .LBB2_16
.LBB2_15:                               # %omp.wsloop.region3
                                        #   in Loop: Header=BB2_11 Depth=1
	slt	a4, a0, s1
	slli	a5, a1, 5
	bnez	a4, .LBB2_17
	j	.LBB2_18
.LBB2_16:                               #   in Loop: Header=BB2_11 Depth=1
	sltu	a4, a3, s6
	slli	a5, a1, 5
	beqz	a4, .LBB2_18
.LBB2_17:                               # %omp.wsloop.region4
                                        #   in Loop: Header=BB2_11 Depth=1
	add	a2, a5, a3
	slli	a2, a2, 2
	add	a2, a2, s0
	flw	ft0, 0(a2)
	fmul.s	ft0, ft0, ft4
	fsw	ft0, 0(a2)
	addi	a2, a3, 1
	sltu	a3, a2, a3
	add	a0, a0, a3
	mv	a3, a2
	beq	a0, s1, .LBB2_16
	j	.LBB2_15
.LBB2_18:                               # %omp.wsloop.region5
                                        #   in Loop: Header=BB2_11 Depth=1
	li	a0, 0
	li	a3, 0
	j	.LBB2_20
.LBB2_19:                               # %omp.wsloop.region10
                                        #   in Loop: Header=BB2_20 Depth=2
	addi	a1, a0, 1
	sltu	a0, a1, a0
	add	a3, a3, a0
	mv	a0, a1
.LBB2_20:                               # %omp.wsloop.region6
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beq	a3, s7, .LBB2_22
# %bb.21:                               # %omp.wsloop.region6
                                        #   in Loop: Header=BB2_20 Depth=2
	slt	a1, a3, s7
	bnez	a1, .LBB2_23
	j	.LBB2_10
.LBB2_22:                               #   in Loop: Header=BB2_20 Depth=2
	sltu	a1, a0, s8
	beqz	a1, .LBB2_10
.LBB2_23:                               # %omp.wsloop.region7
                                        #   in Loop: Header=BB2_20 Depth=2
	li	a1, 0
	li	a4, 0
	beq	a4, s1, .LBB2_25
.LBB2_24:                               # %omp.wsloop.region8
                                        #   in Loop: Header=BB2_20 Depth=2
	slt	a2, a4, s1
	bnez	a2, .LBB2_26
	j	.LBB2_19
.LBB2_25:                               #   in Loop: Header=BB2_20 Depth=2
	sltu	a2, a1, s6
	beqz	a2, .LBB2_19
.LBB2_26:                               # %omp.wsloop.region9
                                        #   in Loop: Header=BB2_20 Depth=2
	add	a2, a5, a0
	slli	a2, a2, 2
	add	a2, a2, s4
	flw	ft0, 0(a2)
	slli	a2, a0, 5
	add	a2, a2, a1
	slli	a2, a2, 2
	add	a2, a2, s5
	flw	ft1, 0(a2)
	add	a2, a5, a1
	slli	a2, a2, 2
	add	a2, a2, s0
	flw	ft2, 0(a2)
	fmul.s	ft0, ft3, ft0
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a2)
	addi	a2, a1, 1
	sltu	a1, a2, a1
	add	a4, a4, a1
	mv	a1, a2
	beq	a4, s1, .LBB2_25
	j	.LBB2_24
.LBB2_27:                               # %omp_loop.exit
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
	lw	ra, 92(sp)                      # 4-byte Folded Reload
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	lw	s1, 84(sp)                      # 4-byte Folded Reload
	lw	s2, 80(sp)                      # 4-byte Folded Reload
	lw	s3, 76(sp)                      # 4-byte Folded Reload
	lw	s4, 72(sp)                      # 4-byte Folded Reload
	lw	s5, 68(sp)                      # 4-byte Folded Reload
	lw	s6, 64(sp)                      # 4-byte Folded Reload
	lw	s7, 60(sp)                      # 4-byte Folded Reload
	lw	s8, 56(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end2:
	.size	kernel_gemm..omp_par, .Lfunc_end2-kernel_gemm..omp_par
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
