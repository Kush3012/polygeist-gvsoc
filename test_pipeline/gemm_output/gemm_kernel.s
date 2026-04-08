	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	init_array                      # -- Begin function init_array
	.p2align	1
	.type	init_array,@function
init_array:                             # @init_array
	.cfi_startproc
# %bb.0:
	li	t3, 0
	li	t0, 0
	lw	t2, 52(sp)
	lw	t1, 100(sp)
	lw	a3, 20(sp)
	lui	a5, 290772
	addi	a5, a5, -2048
	sw	a5, 0(a4)
	lw	a6, 148(sp)
	lui	a4, 282699
	sw	a4, 0(a3)
	fcvt.s.w	ft0, a0
	srai	a7, a0, 31
	srai	t4, a1, 31
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a3, t3, 1
	sltu	a4, a3, t3
	add	t0, t0, a4
	mv	t3, a3
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	beq	t0, a7, .LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	slt	a3, t0, a7
	xori	a3, a3, 1
	beqz	a3, .LBB0_5
	j	.LBB0_9
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a3, t3, a0
	xori	a3, a3, 1
	bnez	a3, .LBB0_9
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	li	a5, 0
	fcvt.s.w	ft1, t3
	beq	a3, t4, .LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	slt	a4, a3, t4
	xori	a4, a4, 1
	beqz	a4, .LBB0_8
	j	.LBB0_1
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a4, a5, a1
	xori	a4, a4, 1
	bnez	a4, .LBB0_1
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	fcvt.s.w	ft2, a5
	fmul.s	ft2, ft1, ft2
	fdiv.s	ft2, ft2, ft0
	slli	a4, t3, 5
	add	a4, a4, a5
	slli	a4, a4, 2
	add	a4, a4, t2
	fsw	ft2, 0(a4)
	addi	a4, a5, 1
	sltu	a5, a4, a5
	add	a3, a3, a5
	mv	a5, a4
	beq	a3, t4, .LBB0_7
	j	.LBB0_6
.LBB0_9:
	li	t3, 0
	li	t0, 0
	srai	t2, a2, 31
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a3, t3, 1
	sltu	a4, a3, t3
	add	t0, t0, a4
	mv	t3, a3
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	beq	t0, a7, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	slt	a3, t0, a7
	j	.LBB0_14
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a3, t3, a0
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=1
	li	a5, 0
	xori	a3, a3, 1
	bnez	a3, .LBB0_19
# %bb.15:                               #   in Loop: Header=BB0_11 Depth=1
	fcvt.s.w	ft1, t3
	beq	a3, t2, .LBB0_17
.LBB0_16:                               #   in Loop: Header=BB0_11 Depth=1
	slt	a4, a3, t2
	xori	a4, a4, 1
	beqz	a4, .LBB0_18
	j	.LBB0_10
.LBB0_17:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a4, a5, a2
	xori	a4, a4, 1
	bnez	a4, .LBB0_10
.LBB0_18:                               #   in Loop: Header=BB0_11 Depth=1
	fcvt.s.w	ft2, a5
	fmul.s	ft2, ft1, ft2
	fdiv.s	ft2, ft2, ft0
	slli	a4, t3, 5
	add	a4, a4, a5
	slli	a4, a4, 2
	add	a4, a4, t1
	fsw	ft2, 0(a4)
	addi	a4, a5, 1
	sltu	a5, a4, a5
	add	a3, a3, a5
	mv	a5, a4
	beq	a3, t2, .LBB0_17
	j	.LBB0_16
.LBB0_19:
	li	a7, 0
	j	.LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_21 Depth=1
	addi	a0, a5, 1
	sltu	a3, a0, a5
	add	a7, a7, a3
	mv	a5, a0
.LBB0_21:                               # =>This Inner Loop Header: Depth=1
	beq	a7, t2, .LBB0_23
# %bb.22:                               #   in Loop: Header=BB0_21 Depth=1
	slt	a0, a7, t2
	xori	a0, a0, 1
	beqz	a0, .LBB0_24
	j	.LBB0_28
.LBB0_23:                               #   in Loop: Header=BB0_21 Depth=1
	sltu	a0, a5, a2
	xori	a0, a0, 1
	bnez	a0, .LBB0_28
.LBB0_24:                               #   in Loop: Header=BB0_21 Depth=1
	li	a3, 0
	fcvt.s.w	ft1, a5
	beq	a3, t4, .LBB0_26
.LBB0_25:                               #   in Loop: Header=BB0_21 Depth=1
	slt	a4, a3, t4
	xori	a4, a4, 1
	beqz	a4, .LBB0_27
	j	.LBB0_20
.LBB0_26:                               #   in Loop: Header=BB0_21 Depth=1
	sltu	a4, a0, a1
	xori	a4, a4, 1
	bnez	a4, .LBB0_20
.LBB0_27:                               #   in Loop: Header=BB0_21 Depth=1
	fcvt.s.w	ft2, a0
	fmul.s	ft2, ft1, ft2
	fdiv.s	ft2, ft2, ft0
	slli	a4, a5, 5
	add	a4, a4, a0
	slli	a4, a4, 2
	add	a4, a4, a6
	fsw	ft2, 0(a4)
	addi	a4, a0, 1
	sltu	a0, a4, a0
	add	a3, a3, a0
	mv	a0, a4
	beq	a3, t4, .LBB0_26
	j	.LBB0_25
.LBB0_28:
	ret
.Lfunc_end0:
	.size	init_array, .Lfunc_end0-init_array
	.cfi_endproc
                                        # -- End function
	.globl	kernel_gemm                     # -- Begin function kernel_gemm
	.p2align	1
	.type	kernel_gemm,@function
kernel_gemm:                            # @kernel_gemm
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	s0, 12(sp)                      # 4-byte Folded Spill
	sw	s1, 8(sp)                       # 4-byte Folded Spill
	.cfi_offset s0, -4
	.cfi_offset s1, -8
	li	t1, 0
	li	a7, 0
	fmv.w.x	ft0, a4
	fmv.w.x	ft1, a3
	lw	t3, 60(sp)
	lw	t5, 108(sp)
	srai	t0, a0, 31
	srai	t6, a1, 31
	srai	t2, a2, 31
	j	.LBB1_2
.LBB1_1:                                #   in Loop: Header=BB1_2 Depth=1
	addi	a3, t1, 1
	sltu	a4, a3, t1
	add	a7, a7, a4
	mv	t1, a3
.LBB1_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_12 Depth 2
	beq	a7, t0, .LBB1_4
# %bb.3:                                #   in Loop: Header=BB1_2 Depth=1
	slt	a3, a7, t0
	xori	a3, a3, 1
	beqz	a3, .LBB1_5
	j	.LBB1_19
.LBB1_4:                                #   in Loop: Header=BB1_2 Depth=1
	sltu	a3, t1, a0
	xori	a3, a3, 1
	bnez	a3, .LBB1_19
.LBB1_5:                                #   in Loop: Header=BB1_2 Depth=1
	li	a5, 0
	li	a4, 0
	beq	a4, t6, .LBB1_7
.LBB1_6:                                #   in Loop: Header=BB1_2 Depth=1
	slt	a3, a4, t6
	j	.LBB1_8
.LBB1_7:                                #   in Loop: Header=BB1_2 Depth=1
	sltu	a3, a5, a1
.LBB1_8:                                #   in Loop: Header=BB1_2 Depth=1
	xori	s0, a3, 1
	slli	a3, t1, 5
	bnez	s0, .LBB1_10
# %bb.9:                                #   in Loop: Header=BB1_2 Depth=1
	add	a3, a3, a5
	slli	a3, a3, 2
	add	a3, a3, a6
	flw	ft2, 0(a3)
	fmul.s	ft2, ft2, ft0
	fsw	ft2, 0(a3)
	addi	a3, a5, 1
	sltu	a5, a3, a5
	add	a4, a4, a5
	mv	a5, a3
	beq	a4, t6, .LBB1_7
	j	.LBB1_6
.LBB1_10:                               #   in Loop: Header=BB1_2 Depth=1
	li	a4, 0
	li	t4, 0
	j	.LBB1_12
.LBB1_11:                               #   in Loop: Header=BB1_12 Depth=2
	addi	a5, a4, 1
	sltu	a4, a5, a4
	add	t4, t4, a4
	mv	a4, a5
.LBB1_12:                               #   Parent Loop BB1_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beq	t4, t2, .LBB1_14
# %bb.13:                               #   in Loop: Header=BB1_12 Depth=2
	slt	a5, t4, t2
	xori	a5, a5, 1
	beqz	a5, .LBB1_15
	j	.LBB1_1
.LBB1_14:                               #   in Loop: Header=BB1_12 Depth=2
	sltu	a5, a4, a2
	xori	a5, a5, 1
	bnez	a5, .LBB1_1
.LBB1_15:                               #   in Loop: Header=BB1_12 Depth=2
	li	s0, 0
	beq	a5, t6, .LBB1_17
.LBB1_16:                               #   in Loop: Header=BB1_12 Depth=2
	slt	s1, a5, t6
	xori	s1, s1, 1
	beqz	s1, .LBB1_18
	j	.LBB1_11
.LBB1_17:                               #   in Loop: Header=BB1_12 Depth=2
	sltu	s1, s0, a1
	xori	s1, s1, 1
	bnez	s1, .LBB1_11
.LBB1_18:                               #   in Loop: Header=BB1_12 Depth=2
	add	s1, a3, a4
	slli	s1, s1, 2
	add	s1, s1, t3
	flw	ft2, 0(s1)
	slli	s1, a4, 5
	add	s1, s1, s0
	slli	s1, s1, 2
	add	s1, s1, t5
	flw	ft3, 0(s1)
	add	s1, a3, s0
	slli	s1, s1, 2
	add	s1, s1, a6
	flw	ft4, 0(s1)
	fmul.s	ft2, ft1, ft2
	fmul.s	ft2, ft2, ft3
	fadd.s	ft2, ft4, ft2
	fsw	ft2, 0(s1)
	addi	s1, s0, 1
	sltu	s0, s1, s0
	add	a5, a5, s0
	mv	s0, s1
	beq	a5, t6, .LBB1_17
	j	.LBB1_16
.LBB1_19:
	lw	s0, 12(sp)                      # 4-byte Folded Reload
	lw	s1, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	kernel_gemm, .Lfunc_end1-kernel_gemm
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function main
.LCPI2_0:
	.word	0x42000000                      # float 32
.LCPI2_1:
	.word	0x46fd3800                      # float 32412
.LCPI2_2:
	.word	0x4504b000                      # float 2123
	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	lui	a0, 1
	addi	a0, a0, 16
	sub	sp, sp, a0
	.cfi_def_cfa_offset 4112
	lui	a0, %hi(.LCPI2_0)
	flw	ft0, %lo(.LCPI2_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	addi	a2, sp, 16
	j	.LBB2_2
.LBB2_1:                                #   in Loop: Header=BB2_2 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB2_2:                                # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB2_4
# %bb.3:                                #   in Loop: Header=BB2_2 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB2_5
	j	.LBB2_9
.LBB2_4:                                #   in Loop: Header=BB2_2 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB2_9
.LBB2_5:                                #   in Loop: Header=BB2_2 Depth=1
	li	a5, 0
	fcvt.s.w	ft1, a3
	beqz	a4, .LBB2_7
.LBB2_6:                                #   in Loop: Header=BB2_2 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB2_8
	j	.LBB2_1
.LBB2_7:                                #   in Loop: Header=BB2_2 Depth=1
	sltu	a0, a1, a5
	bnez	a0, .LBB2_1
.LBB2_8:                                #   in Loop: Header=BB2_2 Depth=1
	fcvt.s.w	ft2, a5
	fmul.s	ft2, ft1, ft2
	fdiv.s	ft2, ft2, ft0
	slli	a0, a3, 5
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	fsw	ft2, 0(a0)
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a4, a4, a5
	mv	a5, a0
	beqz	a4, .LBB2_7
	j	.LBB2_6
.LBB2_9:
	lui	a0, %hi(.LCPI2_2)
	flw	ft0, %lo(.LCPI2_2)(a0)
	lui	a0, %hi(.LCPI2_0)
	flw	ft1, %lo(.LCPI2_0)(a0)
	lui	a0, %hi(.LCPI2_1)
	flw	ft2, %lo(.LCPI2_1)(a0)
	li	a7, 0
	li	a6, 0
	li	a1, 31
	addi	a2, sp, 16
	j	.LBB2_11
.LBB2_10:                               #   in Loop: Header=BB2_11 Depth=1
	addi	a0, a7, 1
	sltu	a3, a0, a7
	add	a6, a6, a3
	mv	a7, a0
.LBB2_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_20 Depth 2
	beqz	a6, .LBB2_13
# %bb.12:                               #   in Loop: Header=BB2_11 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB2_14
	j	.LBB2_27
.LBB2_13:                               #   in Loop: Header=BB2_11 Depth=1
	sltu	a0, a1, a7
	bnez	a0, .LBB2_27
.LBB2_14:                               #   in Loop: Header=BB2_11 Depth=1
	li	a3, 0
	beqz	a0, .LBB2_16
.LBB2_15:                               #   in Loop: Header=BB2_11 Depth=1
	sgtz	a5, a0
	slli	a4, a7, 5
	beqz	a5, .LBB2_17
	j	.LBB2_18
.LBB2_16:                               #   in Loop: Header=BB2_11 Depth=1
	sltu	a5, a1, a3
	slli	a4, a7, 5
	bnez	a5, .LBB2_18
.LBB2_17:                               #   in Loop: Header=BB2_11 Depth=1
	add	a4, a4, a3
	slli	a4, a4, 2
	add	a4, a4, a2
	flw	ft3, 0(a4)
	fmul.s	ft3, ft3, ft0
	fsw	ft3, 0(a4)
	addi	a4, a3, 1
	sltu	a3, a4, a3
	add	a0, a0, a3
	mv	a3, a4
	beqz	a0, .LBB2_16
	j	.LBB2_15
.LBB2_18:                               #   in Loop: Header=BB2_11 Depth=1
	li	t1, 0
	li	t0, 0
	fcvt.s.w	ft3, a7
	j	.LBB2_20
.LBB2_19:                               #   in Loop: Header=BB2_20 Depth=2
	addi	a0, t1, 1
	sltu	a3, a0, t1
	add	t0, t0, a3
	mv	t1, a0
.LBB2_20:                               #   Parent Loop BB2_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t0, .LBB2_22
# %bb.21:                               #   in Loop: Header=BB2_20 Depth=2
	sgtz	a3, t0
	beqz	a3, .LBB2_23
	j	.LBB2_10
.LBB2_22:                               #   in Loop: Header=BB2_20 Depth=2
	sltu	a3, a1, t1
	bnez	a3, .LBB2_10
.LBB2_23:                               #   in Loop: Header=BB2_20 Depth=2
	li	a5, 0
	fcvt.s.w	ft4, t1
	fmul.s	ft5, ft3, ft4
	fdiv.s	ft5, ft5, ft1
	fmul.s	ft5, ft5, ft2
	beqz	a3, .LBB2_25
.LBB2_24:                               #   in Loop: Header=BB2_20 Depth=2
	sgtz	a0, a3
	beqz	a0, .LBB2_26
	j	.LBB2_19
.LBB2_25:                               #   in Loop: Header=BB2_20 Depth=2
	sltu	a0, a1, a5
	bnez	a0, .LBB2_19
.LBB2_26:                               #   in Loop: Header=BB2_20 Depth=2
	fcvt.s.w	ft6, a5
	add	a0, a4, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	flw	ft7, 0(a0)
	fmul.s	ft6, ft4, ft6
	fdiv.s	ft6, ft6, ft1
	fmul.s	ft6, ft5, ft6
	fadd.s	ft6, ft7, ft6
	fsw	ft6, 0(a0)
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a3, a3, a5
	mv	a5, a0
	beqz	a3, .LBB2_25
	j	.LBB2_24
.LBB2_27:
	li	a2, 0
	li	a6, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	addi	a3, sp, 16
	j	.LBB2_29
.LBB2_28:                               #   in Loop: Header=BB2_29 Depth=1
	addi	a0, a2, 1
	sltu	a2, a0, a2
	add	a6, a6, a2
	mv	a2, a0
.LBB2_29:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB2_31
# %bb.30:                               #   in Loop: Header=BB2_29 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB2_32
	j	.LBB2_36
.LBB2_31:                               #   in Loop: Header=BB2_29 Depth=1
	sltu	a4, a1, a2
	bnez	a4, .LBB2_36
.LBB2_32:                               #   in Loop: Header=BB2_29 Depth=1
	li	a5, 0
	beqz	a4, .LBB2_34
.LBB2_33:                               #   in Loop: Header=BB2_29 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB2_35
	j	.LBB2_28
.LBB2_34:                               #   in Loop: Header=BB2_29 Depth=1
	sltu	a0, a1, a5
	bnez	a0, .LBB2_28
.LBB2_35:                               #   in Loop: Header=BB2_29 Depth=1
	slli	a0, a2, 5
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a3
	flw	ft1, 0(a0)
	fadd.s	ft0, ft0, ft1
	addi	a0, a5, 1
	sltu	a5, a0, a5
	add	a4, a4, a5
	mv	a5, a0
	beqz	a4, .LBB2_34
	j	.LBB2_33
.LBB2_36:
	fcvt.w.s	a0, ft0, rtz
	lui	a1, 1
	addi	a1, a1, 16
	add	sp, sp, a1
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
