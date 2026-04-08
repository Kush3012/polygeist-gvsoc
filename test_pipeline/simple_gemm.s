	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	gemm                            # -- Begin function gemm
	.p2align	1
	.type	gemm,@function
gemm:                                   # @gemm
	.cfi_startproc
# %bb.0:
	li	a7, 0
	li	a6, 0
	lw	t1, 36(sp)
	lw	t2, 84(sp)
	fmv.w.x	ft0, a2
	fmv.w.x	ft1, a1
	srai	t4, a0, 31
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a1, a7, 1
	sltu	a2, a1, a7
	add	a6, a6, a2
	mv	a7, a1
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	beq	a6, t4, .LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	slt	a1, a6, t4
	xori	a1, a1, 1
	beqz	a1, .LBB0_5
	j	.LBB0_14
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a1, a7, a0
	xori	a1, a1, 1
	bnez	a1, .LBB0_14
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	li	t3, 0
	li	t0, 0
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	addi	a1, t3, 1
	sltu	a2, a1, t3
	add	t0, t0, a2
	mv	t3, a1
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beq	t0, t4, .LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	slt	a1, t0, t4
	xori	a1, a1, 1
	beqz	a1, .LBB0_10
	j	.LBB0_1
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=2
	sltu	a1, t3, a0
	xori	a1, a1, 1
	bnez	a1, .LBB0_1
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=2
	slli	t5, a7, 4
	add	a1, t5, t3
	slli	a1, a1, 2
	add	a3, a4, a1
	flw	ft2, 0(a3)
	li	a1, 0
	li	a2, 0
	fmul.s	ft2, ft2, ft0
	fsw	ft2, 0(a3)
	beq	a2, t4, .LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=2
	slt	a5, a2, t4
	xori	a5, a5, 1
	beqz	a5, .LBB0_13
	j	.LBB0_6
.LBB0_12:                               #   in Loop: Header=BB0_7 Depth=2
	sltu	a5, a1, a0
	xori	a5, a5, 1
	bnez	a5, .LBB0_6
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=2
	add	a5, t5, a1
	slli	a5, a5, 2
	add	a5, a5, t1
	flw	ft2, 0(a5)
	slli	a5, a1, 4
	add	a5, a5, t3
	slli	a5, a5, 2
	add	a5, a5, t2
	flw	ft3, 0(a5)
	flw	ft4, 0(a3)
	fmul.s	ft2, ft1, ft2
	fmul.s	ft2, ft2, ft3
	fadd.s	ft2, ft4, ft2
	fsw	ft2, 0(a3)
	addi	a5, a1, 1
	sltu	a1, a5, a1
	add	a2, a2, a1
	mv	a1, a5
	beq	a2, t4, .LBB0_12
	j	.LBB0_11
.LBB0_14:
	ret
.Lfunc_end0:
	.size	gemm, .Lfunc_end0-gemm
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -1040
	.cfi_def_cfa_offset 1040
	li	a3, 0
	li	a6, 0
	li	a1, 15
	addi	a2, sp, 16
	j	.LBB1_2
.LBB1_1:                                #   in Loop: Header=BB1_2 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB1_2:                                # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB1_5
	j	.LBB1_9
.LBB1_4:                                #   in Loop: Header=BB1_2 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB1_9
.LBB1_5:                                #   in Loop: Header=BB1_2 Depth=1
	li	a5, 0
	beqz	a4, .LBB1_7
.LBB1_6:                                #   in Loop: Header=BB1_2 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB1_8
	j	.LBB1_1
.LBB1_7:                                #   in Loop: Header=BB1_2 Depth=1
	sltu	a0, a1, a5
	bnez	a0, .LBB1_1
.LBB1_8:                                #   in Loop: Header=BB1_2 Depth=1
	slli	a0, a3, 4
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	sw	zero, 0(a0)
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a4, a4, a5
	mv	a5, a0
	beqz	a4, .LBB1_7
	j	.LBB1_6
.LBB1_9:
	li	a3, 0
	li	a6, 0
	li	t1, 15
	addi	a7, sp, 16
	fmv.w.x	ft0, zero
	j	.LBB1_11
.LBB1_10:                               #   in Loop: Header=BB1_11 Depth=1
	addi	a0, a3, 1
	sltu	a1, a0, a3
	add	a6, a6, a1
	mv	a3, a0
.LBB1_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_16 Depth 2
	beqz	a6, .LBB1_13
# %bb.12:                               #   in Loop: Header=BB1_11 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB1_14
	j	.LBB1_23
.LBB1_13:                               #   in Loop: Header=BB1_11 Depth=1
	sltu	a0, t1, a3
	bnez	a0, .LBB1_23
.LBB1_14:                               #   in Loop: Header=BB1_11 Depth=1
	li	a5, 0
	li	t0, 0
	j	.LBB1_16
.LBB1_15:                               #   in Loop: Header=BB1_16 Depth=2
	addi	a0, a5, 1
	sltu	a1, a0, a5
	add	t0, t0, a1
	mv	a5, a0
.LBB1_16:                               #   Parent Loop BB1_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t0, .LBB1_18
# %bb.17:                               #   in Loop: Header=BB1_16 Depth=2
	sgtz	a0, t0
	beqz	a0, .LBB1_19
	j	.LBB1_10
.LBB1_18:                               #   in Loop: Header=BB1_16 Depth=2
	sltu	a0, t1, a5
	bnez	a0, .LBB1_10
.LBB1_19:                               #   in Loop: Header=BB1_16 Depth=2
	slli	a0, a3, 4
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a7
	flw	ft1, 0(a0)
	li	a4, 0
	li	a2, 0
	fmul.s	ft1, ft1, ft0
	fsw	ft1, 0(a0)
	beqz	a2, .LBB1_21
.LBB1_20:                               #   in Loop: Header=BB1_16 Depth=2
	sgtz	a1, a2
	beqz	a1, .LBB1_22
	j	.LBB1_15
.LBB1_21:                               #   in Loop: Header=BB1_16 Depth=2
	sltu	a1, t1, a4
	bnez	a1, .LBB1_15
.LBB1_22:                               #   in Loop: Header=BB1_16 Depth=2
	add	a1, a3, a4
	fcvt.s.w	ft1, a1
	flw	ft2, 0(a0)
	mul	a1, a4, a5
	fcvt.s.w	ft3, a1
	fmul.s	ft1, ft1, ft3
	fadd.s	ft1, ft2, ft1
	fsw	ft1, 0(a0)
	addi	a1, a4, 1
	sltu	a4, a1, a4
	add	a2, a2, a4
	mv	a4, a1
	beqz	a2, .LBB1_21
	j	.LBB1_20
.LBB1_23:
	flw	ft0, 16(sp)
	fcvt.w.s	a0, ft0, rtz
	addi	sp, sp, 1040
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
