	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function main
.LCPI0_0:
	.word	0x3f99999a                      # float 1.20000005
.LCPI0_1:
	.word	0x42000000                      # float 32
.LCPI0_2:
	.word	0x3fc00000                      # float 1.5
	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	lui	a0, 2
	addi	a0, a0, 16
	sub	sp, sp, a0
	.cfi_def_cfa_offset 8208
	lui	a0, %hi(.LCPI0_1)
	flw	ft0, %lo(.LCPI0_1)(a0)
	li	a3, 0
	li	a6, 0
	li	a7, 31
	lui	a0, 1
	addi	a0, a0, 16
	add	a2, sp, a0
	j	.LBB0_2
.LBB0_1:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, a3, 1
	sltu	a1, a0, a3
	add	a6, a6, a1
	mv	a3, a0
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_5
	j	.LBB0_9
.LBB0_4:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a4, a7, a3
	bnez	a4, .LBB0_9
.LBB0_5:                                #   in Loop: Header=BB0_2 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_2 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB0_8
	j	.LBB0_1
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	sltu	a0, a7, a5
	bnez	a0, .LBB0_1
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	addi	a0, a5, 2
	mul	a0, a3, a0
	srai	a1, a0, 31
	srli	a1, a1, 27
	add	a1, a1, a0
	andi	a1, a1, -32
	sub	a0, a0, a1
	fcvt.s.w	ft1, a0
	fdiv.s	ft1, ft1, ft0
	slli	a0, a3, 5
	add	a0, a0, a5
	slli	a0, a0, 2
	add	a0, a0, a2
	fsw	ft1, 0(a0)
	addi	a0, a5, 1
	sltu	a1, a0, a5
	add	a4, a4, a1
	mv	a5, a0
	beqz	a4, .LBB0_7
	j	.LBB0_6
.LBB0_9:
	lui	a0, %hi(.LCPI0_1)
	flw	ft0, %lo(.LCPI0_1)(a0)
	lui	a0, %hi(.LCPI0_2)
	flw	ft1, %lo(.LCPI0_2)(a0)
	li	t3, 0
	li	a6, 0
	li	t2, 31
	addi	a7, sp, 16
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a0, t3, 1
	sltu	a1, a0, t3
	add	a6, a6, a1
	mv	t3, a0
.LBB0_11:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_16 Depth 2
	beqz	a6, .LBB0_13
# %bb.12:                               #   in Loop: Header=BB0_11 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB0_14
	j	.LBB0_23
.LBB0_13:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a0, t2, t3
	bnez	a0, .LBB0_23
.LBB0_14:                               #   in Loop: Header=BB0_11 Depth=1
	li	t1, 0
	li	t0, 0
	j	.LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_16 Depth=2
	sltu	a0, t4, t1
	add	t0, t0, a0
	mv	t1, t4
.LBB0_16:                               #   Parent Loop BB0_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t0, .LBB0_18
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=2
	sgtz	a0, t0
	beqz	a0, .LBB0_19
	j	.LBB0_10
.LBB0_18:                               #   in Loop: Header=BB0_16 Depth=2
	sltu	a0, t2, t1
	bnez	a0, .LBB0_10
.LBB0_19:                               #   in Loop: Header=BB0_16 Depth=2
	li	a4, 0
	li	a2, 0
	slli	a0, t3, 5
	add	a0, a0, t1
	slli	a0, a0, 2
	add	a0, a0, a7
	sw	zero, 0(a0)
	addi	t4, t1, 1
	beqz	a2, .LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_16 Depth=2
	sgtz	a1, a2
	beqz	a1, .LBB0_22
	j	.LBB0_15
.LBB0_21:                               #   in Loop: Header=BB0_16 Depth=2
	sltu	a1, t2, a4
	bnez	a1, .LBB0_15
.LBB0_22:                               #   in Loop: Header=BB0_16 Depth=2
	mul	a1, t3, a4
	srai	a3, a1, 31
	srli	a3, a3, 27
	add	a3, a3, a1
	andi	a3, a3, -32
	sub	a1, a1, a3
	fcvt.s.w	ft2, a1
	fdiv.s	ft2, ft2, ft0
	fmul.s	ft2, ft2, ft1
	addi	a1, a4, 1
	mul	a3, a1, t4
	srai	a5, a3, 31
	srli	a5, a5, 27
	add	a5, a5, a3
	andi	a5, a5, -32
	sub	a3, a3, a5
	flw	ft3, 0(a0)
	fcvt.s.w	ft4, a3
	fdiv.s	ft4, ft4, ft0
	fmul.s	ft2, ft2, ft4
	fadd.s	ft2, ft3, ft2
	fsw	ft2, 0(a0)
	sltu	a3, a1, a4
	add	a2, a2, a3
	mv	a4, a1
	beqz	a2, .LBB0_21
	j	.LBB0_20
.LBB0_23:
	li	t0, 0
	li	a6, 0
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	lui	a0, %hi(.LCPI0_1)
	flw	ft1, %lo(.LCPI0_1)(a0)
	li	t3, 31
	lui	a0, 1
	addi	a0, a0, 16
	add	a7, sp, a0
	addi	t4, sp, 16
	j	.LBB0_25
.LBB0_24:                               #   in Loop: Header=BB0_25 Depth=1
	addi	a0, t0, 1
	sltu	a1, a0, t0
	add	a6, a6, a1
	mv	t0, a0
.LBB0_25:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_30 Depth 2
	beqz	a6, .LBB0_27
# %bb.26:                               #   in Loop: Header=BB0_25 Depth=1
	sgtz	a0, a6
	beqz	a0, .LBB0_28
	j	.LBB0_37
.LBB0_27:                               #   in Loop: Header=BB0_25 Depth=1
	sltu	a0, t3, t0
	bnez	a0, .LBB0_37
.LBB0_28:                               #   in Loop: Header=BB0_25 Depth=1
	li	t2, 0
	li	t1, 0
	j	.LBB0_30
.LBB0_29:                               #   in Loop: Header=BB0_30 Depth=2
	addi	a0, t2, 1
	sltu	a1, a0, t2
	add	t1, t1, a1
	mv	t2, a0
.LBB0_30:                               #   Parent Loop BB0_25 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beqz	t1, .LBB0_32
# %bb.31:                               #   in Loop: Header=BB0_30 Depth=2
	sgtz	a0, t1
	beqz	a0, .LBB0_33
	j	.LBB0_24
.LBB0_32:                               #   in Loop: Header=BB0_30 Depth=2
	sltu	a0, t3, t2
	bnez	a0, .LBB0_24
.LBB0_33:                               #   in Loop: Header=BB0_30 Depth=2
	slli	t5, t0, 5
	add	a0, t5, t2
	slli	a0, a0, 2
	add	a1, a7, a0
	flw	ft2, 0(a1)
	li	a0, 0
	li	a5, 0
	fmul.s	ft2, ft2, ft0
	fsw	ft2, 0(a1)
	addi	a2, t2, 3
	beqz	a5, .LBB0_35
.LBB0_34:                               #   in Loop: Header=BB0_30 Depth=2
	sgtz	a4, a5
	beqz	a4, .LBB0_36
	j	.LBB0_29
.LBB0_35:                               #   in Loop: Header=BB0_30 Depth=2
	sltu	a4, t3, a0
	bnez	a4, .LBB0_29
.LBB0_36:                               #   in Loop: Header=BB0_30 Depth=2
	add	a4, t5, a0
	slli	a4, a4, 2
	add	a4, a4, t4
	flw	ft2, 0(a4)
	mul	a4, a0, a2
	srai	a3, a4, 31
	srli	a3, a3, 27
	add	a3, a3, a4
	andi	a3, a3, -32
	sub	a3, a4, a3
	flw	ft3, 0(a1)
	fcvt.s.w	ft4, a3
	fdiv.s	ft4, ft4, ft1
	fmul.s	ft2, ft2, ft4
	fadd.s	ft2, ft3, ft2
	fsw	ft2, 0(a1)
	addi	a3, a0, 1
	sltu	a0, a3, a0
	add	a5, a5, a0
	mv	a0, a3
	beqz	a5, .LBB0_35
	j	.LBB0_34
.LBB0_37:
	li	a2, 0
	li	a6, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	lui	a0, 1
	addi	a0, a0, 16
	add	a3, sp, a0
	j	.LBB0_39
.LBB0_38:                               #   in Loop: Header=BB0_39 Depth=1
	addi	a0, a2, 1
	sltu	a2, a0, a2
	add	a6, a6, a2
	mv	a2, a0
.LBB0_39:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_41
# %bb.40:                               #   in Loop: Header=BB0_39 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_42
	j	.LBB0_46
.LBB0_41:                               #   in Loop: Header=BB0_39 Depth=1
	sltu	a4, a1, a2
	bnez	a4, .LBB0_46
.LBB0_42:                               #   in Loop: Header=BB0_39 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_44
.LBB0_43:                               #   in Loop: Header=BB0_39 Depth=1
	sgtz	a0, a4
	beqz	a0, .LBB0_45
	j	.LBB0_38
.LBB0_44:                               #   in Loop: Header=BB0_39 Depth=1
	sltu	a0, a1, a5
	bnez	a0, .LBB0_38
.LBB0_45:                               #   in Loop: Header=BB0_39 Depth=1
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
	beqz	a4, .LBB0_44
	j	.LBB0_43
.LBB0_46:
	fmv.w.x	ft1, zero
	flt.s	a0, ft1, ft0
	xori	a0, a0, 1
	lui	a1, 2
	addi	a1, a1, 16
	add	sp, sp, a1
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
