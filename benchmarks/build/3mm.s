	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function main
.LCPI0_0:
	.word	0x43200000                      # float 160
	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	lui	a0, 3
	addi	a0, a0, 16
	sub	sp, sp, a0
	.cfi_def_cfa_offset 12304
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	t3, 0
	li	a6, 0
	li	t2, 31
	addi	a7, sp, 16
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, t3, 1
	sltu	a1, a0, t3
	add	a6, a6, a1
	mv	t3, a0
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_7 Depth 2
	beqz	a6, .LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB0_5
	j	.LBB0_14
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a0, t2, t3
	bnez	a0, .LBB0_14
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	li	t1, 0
	li	t0, 0
	j	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_7 Depth=2
	sltu	a0, t4, t1
	add	t0, t0, a0
	mv	t1, t4
.LBB0_7:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t0, .LBB0_9
# %bb.8:                                #   in Loop: Header=BB0_7 Depth=2
	sgtz	a0, t0
	beqz	a0, .LBB0_10
	j	.LBB0_1
.LBB0_9:                                #   in Loop: Header=BB0_7 Depth=2
	sltu	a0, t2, t1
	bnez	a0, .LBB0_1
.LBB0_10:                               #   in Loop: Header=BB0_7 Depth=2
	li	a4, 0
	li	a2, 0
	slli	a0, t3, 5
	add	a0, a0, t1
	slli	a0, a0, 2
	add	a0, a0, a7
	sw	zero, 0(a0)
	addi	t4, t1, 1
	beqz	a2, .LBB0_12
.LBB0_11:                               #   in Loop: Header=BB0_7 Depth=2
	sgtz	a1, a2
	beqz	a1, .LBB0_13
	j	.LBB0_6
.LBB0_12:                               #   in Loop: Header=BB0_7 Depth=2
	sltu	a1, t2, a4
	bnez	a1, .LBB0_6
.LBB0_13:                               #   in Loop: Header=BB0_7 Depth=2
	mul	a1, t3, a4
	srai	a3, a1, 31
	srli	a3, a3, 27
	add	a3, a3, a1
	andi	a3, a3, -32
	sub	a1, a1, a3
	fcvt.s.w	ft1, a1
	fdiv.s	ft1, ft1, ft0
	addi	a1, a4, 1
	mul	a3, a1, t4
	srai	a5, a3, 31
	srli	a5, a5, 27
	add	a5, a5, a3
	andi	a5, a5, -32
	sub	a3, a3, a5
	flw	ft2, 0(a0)
	fcvt.s.w	ft3, a3
	fdiv.s	ft3, ft3, ft0
	fmul.s	ft1, ft1, ft3
	fadd.s	ft1, ft2, ft1
	fsw	ft1, 0(a0)
	sltu	a3, a1, a4
	add	a2, a2, a3
	mv	a4, a1
	beqz	a2, .LBB0_12
	j	.LBB0_11
.LBB0_14:
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	t3, 0
	li	a6, 0
	li	t2, 31
	lui	a0, 1
	addi	a0, a0, 16
	add	a7, sp, a0
	j	.LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_16 Depth=1
	addi	a0, t3, 1
	sltu	a1, a0, t3
	add	a6, a6, a1
	mv	t3, a0
.LBB0_16:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_21 Depth 2
	beqz	a6, .LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB0_19
	j	.LBB0_28
.LBB0_18:                               #   in Loop: Header=BB0_16 Depth=1
	sltu	a0, t2, t3
	bnez	a0, .LBB0_28
.LBB0_19:                               #   in Loop: Header=BB0_16 Depth=1
	li	t1, 0
	li	t0, 0
	j	.LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_21 Depth=2
	addi	a0, t1, 1
	sltu	a1, a0, t1
	add	t0, t0, a1
	mv	t1, a0
.LBB0_21:                               #   Parent Loop BB0_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t0, .LBB0_23
# %bb.22:                               #   in Loop: Header=BB0_21 Depth=2
	sgtz	a0, t0
	beqz	a0, .LBB0_24
	j	.LBB0_15
.LBB0_23:                               #   in Loop: Header=BB0_21 Depth=2
	sltu	a0, t2, t1
	bnez	a0, .LBB0_15
.LBB0_24:                               #   in Loop: Header=BB0_21 Depth=2
	li	a2, 0
	slli	a1, t3, 5
	add	a1, a1, t1
	slli	a1, a1, 2
	add	a4, a7, a1
	sw	zero, 0(a4)
	addi	a5, t1, 2
	beqz	a0, .LBB0_26
.LBB0_25:                               #   in Loop: Header=BB0_21 Depth=2
	sgtz	a1, a0
	beqz	a1, .LBB0_27
	j	.LBB0_20
.LBB0_26:                               #   in Loop: Header=BB0_21 Depth=2
	sltu	a1, t2, a2
	bnez	a1, .LBB0_20
.LBB0_27:                               #   in Loop: Header=BB0_21 Depth=2
	addi	a1, a2, 3
	mul	a1, t3, a1
	srai	a3, a1, 31
	srli	a3, a3, 27
	add	a3, a3, a1
	andi	a3, a3, -32
	sub	a1, a1, a3
	fcvt.s.w	ft1, a1
	fdiv.s	ft1, ft1, ft0
	mul	a1, a2, a5
	srai	a3, a1, 31
	srli	a3, a3, 27
	add	a3, a3, a1
	andi	a3, a3, -32
	sub	a1, a1, a3
	flw	ft2, 0(a4)
	fcvt.s.w	ft3, a1
	fdiv.s	ft3, ft3, ft0
	fmul.s	ft1, ft1, ft3
	fadd.s	ft1, ft2, ft1
	fsw	ft1, 0(a4)
	addi	a1, a2, 1
	sltu	a2, a1, a2
	add	a0, a0, a2
	mv	a2, a1
	beqz	a0, .LBB0_26
	j	.LBB0_25
.LBB0_28:
	li	t0, 0
	li	a6, 0
	li	t2, 31
	lui	a0, 2
	addi	a0, a0, 16
	add	a7, sp, a0
	addi	t3, sp, 16
	lui	a0, 1
	addi	a0, a0, 16
	add	t4, sp, a0
	j	.LBB0_30
.LBB0_29:                               #   in Loop: Header=BB0_30 Depth=1
	addi	a0, t0, 1
	sltu	a1, a0, t0
	add	a6, a6, a1
	mv	t0, a0
.LBB0_30:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_35 Depth 2
	beqz	a6, .LBB0_32
# %bb.31:                               #   in Loop: Header=BB0_30 Depth=1
	sgtz	a0, a6
	li	a2, 0
	beqz	a0, .LBB0_33
	j	.LBB0_42
.LBB0_32:                               #   in Loop: Header=BB0_30 Depth=1
	sltu	a0, t2, t0
	li	a2, 0
	bnez	a0, .LBB0_42
.LBB0_33:                               #   in Loop: Header=BB0_30 Depth=1
	li	t1, 0
	j	.LBB0_35
.LBB0_34:                               #   in Loop: Header=BB0_35 Depth=2
	addi	a0, a2, 1
	sltu	a1, a0, a2
	add	t1, t1, a1
	mv	a2, a0
.LBB0_35:                               #   Parent Loop BB0_30 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t1, .LBB0_37
# %bb.36:                               #   in Loop: Header=BB0_35 Depth=2
	sgtz	a0, t1
	beqz	a0, .LBB0_38
	j	.LBB0_29
.LBB0_37:                               #   in Loop: Header=BB0_35 Depth=2
	sltu	a0, t2, a2
	bnez	a0, .LBB0_29
.LBB0_38:                               #   in Loop: Header=BB0_35 Depth=2
	li	a1, 0
	li	a4, 0
	slli	a0, t0, 5
	add	a3, a0, a2
	slli	a3, a3, 2
	add	a3, a3, a7
	sw	zero, 0(a3)
	beqz	a4, .LBB0_40
.LBB0_39:                               #   in Loop: Header=BB0_35 Depth=2
	sgtz	a5, a4
	beqz	a5, .LBB0_41
	j	.LBB0_34
.LBB0_40:                               #   in Loop: Header=BB0_35 Depth=2
	sltu	a5, t2, a1
	bnez	a5, .LBB0_34
.LBB0_41:                               #   in Loop: Header=BB0_35 Depth=2
	add	a5, a0, a1
	slli	a5, a5, 2
	add	a5, a5, t3
	flw	ft0, 0(a5)
	slli	a5, a1, 5
	add	a5, a5, a2
	slli	a5, a5, 2
	add	a5, a5, t4
	flw	ft1, 0(a5)
	flw	ft2, 0(a3)
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a3)
	addi	a5, a1, 1
	sltu	a1, a5, a1
	add	a4, a4, a1
	mv	a1, a5
	beqz	a4, .LBB0_40
	j	.LBB0_39
.LBB0_42:
	li	a6, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	lui	a0, 2
	addi	a0, a0, 16
	add	a3, sp, a0
	j	.LBB0_44
.LBB0_43:                               #   in Loop: Header=BB0_44 Depth=1
	addi	a0, a2, 1
	sltu	a2, a0, a2
	add	a6, a6, a2
	mv	a2, a0
.LBB0_44:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_46
# %bb.45:                               #   in Loop: Header=BB0_44 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_47
	j	.LBB0_51
.LBB0_46:                               #   in Loop: Header=BB0_44 Depth=1
	sltu	a4, a1, a2
	bnez	a4, .LBB0_51
.LBB0_47:                               #   in Loop: Header=BB0_44 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_49
.LBB0_48:                               #   in Loop: Header=BB0_44 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB0_50
	j	.LBB0_43
.LBB0_49:                               #   in Loop: Header=BB0_44 Depth=1
	sltu	a0, a1, a5
	bnez	a0, .LBB0_43
.LBB0_50:                               #   in Loop: Header=BB0_44 Depth=1
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
	beqz	a4, .LBB0_49
	j	.LBB0_48
.LBB0_51:
	fmv.w.x	ft1, zero
	flt.s	a0, ft1, ft0
	xori	a0, a0, 1
	lui	a1, 3
	addi	a1, a1, 16
	add	sp, sp, a1
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
