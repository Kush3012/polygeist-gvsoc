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
	lui	a0, 5
	addi	a0, a0, -1776
	sub	sp, sp, a0
	.cfi_def_cfa_offset 20736
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	lui	a0, 1
	addi	a0, a0, 248
	add	a2, sp, a0
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
	lui	a0, 2
	addi	a0, a0, 248
	add	t0, sp, a0
	j	.LBB0_11
.LBB0_10:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a0, a4, a3
	add	a6, a6, a0
	mv	a3, a4
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
	li	s0, 0
	li	a5, 0
	addi	a4, a3, 1
	beqz	a5, .LBB0_16
.LBB0_15:                               #   in Loop: Header=BB0_11 Depth=1
	sgtz	a0, a5
	beqz	a0, .LBB0_17
	j	.LBB0_10
.LBB0_16:                               #   in Loop: Header=BB0_11 Depth=1
	sltu	a0, a7, s0
	bnez	a0, .LBB0_10
.LBB0_17:                               #   in Loop: Header=BB0_11 Depth=1
	addi	a0, s0, 1
	mul	a1, a4, a0
	srai	a2, a1, 31
	srli	a2, a2, 27
	add	a2, a2, a1
	andi	a2, a2, -32
	sub	a1, a1, a2
	fcvt.s.w	ft1, a1
	fdiv.s	ft1, ft1, ft0
	slli	a1, a3, 5
	add	a1, a1, s0
	slli	a1, a1, 2
	add	a1, a1, t0
	fsw	ft1, 0(a1)
	sltu	a1, a0, s0
	add	a5, a5, a1
	mv	s0, a0
	beqz	a5, .LBB0_16
	j	.LBB0_15
.LBB0_18:
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	lui	a0, 3
	addi	a0, a0, 248
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
	addi	s0, a5, 3
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
	lui	a0, %hi(.LCPI0_0)
	flw	ft0, %lo(.LCPI0_0)(a0)
	li	a3, 0
	li	a6, 0
	li	a1, 31
	lui	a0, 4
	addi	a0, a0, 248
	add	a2, sp, a0
	j	.LBB0_29
.LBB0_28:                               #   in Loop: Header=BB0_29 Depth=1
	addi	a0, a3, 1
	sltu	a3, a0, a3
	add	a6, a6, a3
	mv	a3, a0
.LBB0_29:                               # =>This Inner Loop Header: Depth=1
	beqz	a6, .LBB0_31
# %bb.30:                               #   in Loop: Header=BB0_29 Depth=1
	sgtz	a4, a6
	beqz	a4, .LBB0_32
	j	.LBB0_36
.LBB0_31:                               #   in Loop: Header=BB0_29 Depth=1
	sltu	a4, a1, a3
	bnez	a4, .LBB0_36
.LBB0_32:                               #   in Loop: Header=BB0_29 Depth=1
	li	a5, 0
	beqz	a4, .LBB0_34
.LBB0_33:                               #   in Loop: Header=BB0_29 Depth=1
	sgtz	s0, a4
	beqz	s0, .LBB0_35
	j	.LBB0_28
.LBB0_34:                               #   in Loop: Header=BB0_29 Depth=1
	sltu	s0, a1, a5
	bnez	s0, .LBB0_28
.LBB0_35:                               #   in Loop: Header=BB0_29 Depth=1
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
	beqz	a4, .LBB0_34
	j	.LBB0_33
.LBB0_36:
	sw	zero, 228(sp)
	li	a1, 1
	sw	a1, 224(sp)
	sw	zero, 220(sp)
	li	a0, 32
	sw	a0, 216(sp)
	sw	zero, 212(sp)
	sw	a0, 208(sp)
	sw	zero, 204(sp)
	sw	a0, 200(sp)
	sw	zero, 196(sp)
	sw	zero, 192(sp)
	lui	a2, 4
	addi	a2, a2, 248
	add	s0, sp, a2
	sw	s0, 188(sp)
	sw	s0, 184(sp)
	sw	zero, 180(sp)
	sw	a1, 176(sp)
	sw	zero, 172(sp)
	sw	a0, 168(sp)
	sw	zero, 164(sp)
	sw	a0, 160(sp)
	sw	zero, 156(sp)
	sw	a0, 152(sp)
	sw	zero, 148(sp)
	sw	zero, 144(sp)
	lui	a2, 3
	addi	a2, a2, 248
	add	a2, a2, sp
	sw	a2, 140(sp)
	sw	a2, 136(sp)
	sw	zero, 132(sp)
	sw	a1, 128(sp)
	sw	zero, 124(sp)
	sw	a0, 120(sp)
	sw	zero, 116(sp)
	sw	a0, 112(sp)
	sw	zero, 108(sp)
	sw	a0, 104(sp)
	sw	zero, 100(sp)
	sw	zero, 96(sp)
	lui	a2, 2
	addi	a2, a2, 248
	add	a2, a2, sp
	sw	a2, 92(sp)
	sw	a2, 88(sp)
	sw	zero, 84(sp)
	sw	a1, 80(sp)
	sw	zero, 76(sp)
	sw	a0, 72(sp)
	sw	zero, 68(sp)
	sw	a0, 64(sp)
	sw	zero, 60(sp)
	sw	a0, 56(sp)
	sw	zero, 52(sp)
	sw	zero, 48(sp)
	lui	a2, 1
	addi	a2, a2, 248
	add	a2, a2, sp
	sw	a2, 44(sp)
	sw	a2, 40(sp)
	sw	zero, 36(sp)
	sw	a1, 32(sp)
	sw	zero, 28(sp)
	sw	a0, 24(sp)
	sw	zero, 20(sp)
	sw	a0, 16(sp)
	sw	zero, 12(sp)
	sw	a0, 8(sp)
	sw	zero, 4(sp)
	lui	a0, 260506
	addi	a5, a0, -1638
	li	a0, 32
	li	a1, 32
	li	a2, 32
	li	a3, 32
	lui	a4, 261120
	addi	a6, sp, 248
	addi	a7, sp, 248
	sw	zero, 0(sp)
	call	kernel_2mm
	li	a2, 0
	li	a0, 0
	fmv.w.x	ft0, zero
	li	a1, 31
	j	.LBB0_38
.LBB0_37:                               #   in Loop: Header=BB0_38 Depth=1
	addi	a3, a2, 1
	sltu	a2, a3, a2
	add	a0, a0, a2
	mv	a2, a3
.LBB0_38:                               # =>This Inner Loop Header: Depth=1
	beqz	a0, .LBB0_40
# %bb.39:                               #   in Loop: Header=BB0_38 Depth=1
	sgtz	a3, a0
	beqz	a3, .LBB0_41
	j	.LBB0_45
.LBB0_40:                               #   in Loop: Header=BB0_38 Depth=1
	sltu	a3, a1, a2
	bnez	a3, .LBB0_45
.LBB0_41:                               #   in Loop: Header=BB0_38 Depth=1
	li	a4, 0
	beqz	a3, .LBB0_43
.LBB0_42:                               #   in Loop: Header=BB0_38 Depth=1
	sgtz	a5, a3
	beqz	a5, .LBB0_44
	j	.LBB0_37
.LBB0_43:                               #   in Loop: Header=BB0_38 Depth=1
	sltu	a5, a1, a4
	bnez	a5, .LBB0_37
.LBB0_44:                               #   in Loop: Header=BB0_38 Depth=1
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
	beqz	a3, .LBB0_43
	j	.LBB0_42
.LBB0_45:
	fmv.w.x	ft1, zero
	flt.s	a0, ft1, ft0
	xori	a0, a0, 1
	lui	a1, 5
	addi	a1, a1, -1776
	add	sp, sp, a1
	lw	ra, 2028(sp)                    # 4-byte Folded Reload
	lw	s0, 2024(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 2032
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_2mm
	.type	kernel_2mm,@function
kernel_2mm:                             # @kernel_2mm
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -192
	.cfi_def_cfa_offset 192
	sw	ra, 188(sp)                     # 4-byte Folded Spill
	sw	s0, 184(sp)                     # 4-byte Folded Spill
	sw	s1, 180(sp)                     # 4-byte Folded Spill
	sw	s2, 176(sp)                     # 4-byte Folded Spill
	sw	s3, 172(sp)                     # 4-byte Folded Spill
	sw	s4, 168(sp)                     # 4-byte Folded Spill
	sw	s5, 164(sp)                     # 4-byte Folded Spill
	sw	s6, 160(sp)                     # 4-byte Folded Spill
	sw	s7, 156(sp)                     # 4-byte Folded Spill
	sw	s8, 152(sp)                     # 4-byte Folded Spill
	sw	s9, 148(sp)                     # 4-byte Folded Spill
	sw	s10, 144(sp)                    # 4-byte Folded Spill
	sw	s11, 140(sp)                    # 4-byte Folded Spill
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
	.cfi_offset s11, -52
	lw	s1, 332(sp)
	sw	s1, 16(sp)                      # 4-byte Folded Spill
	lw	s1, 380(sp)
	sw	s1, 12(sp)                      # 4-byte Folded Spill
	lw	s10, 284(sp)
	lw	s11, 236(sp)
	mv	s3, a7
	mv	s2, a5
	mv	s5, a4
	mv	s4, a3
	mv	s1, a2
	mv	s6, a1
	mv	s7, a0
	srai	s8, a1, 31
	srai	s9, a2, 31
	lui	a0, %hi(.L__unnamed_1)
	addi	s0, a0, %lo(.L__unnamed_1)
	mv	a0, s0
	call	__kmpc_global_thread_num@plt
	sw	s7, 44(sp)
	sw	s8, 36(sp)
	sw	s6, 32(sp)
	sw	s9, 28(sp)
	sw	s1, 24(sp)
	sw	s5, 20(sp)
	addi	a0, sp, 44
	sw	a0, 80(sp)
	addi	a0, sp, 32
	sw	a0, 84(sp)
	addi	a0, sp, 24
	sw	a0, 88(sp)
	addi	a0, sp, 20
	sw	a0, 92(sp)
	sw	s3, 96(sp)
	sw	s11, 100(sp)
	sw	s10, 104(sp)
	lui	a0, %hi(kernel_2mm..omp_par)
	addi	a2, a0, %lo(kernel_2mm..omp_par)
	li	a1, 1
	addi	a3, sp, 80
	mv	a0, s0
	call	__kmpc_fork_call@plt
	srai	s1, s4, 31
	mv	a0, s0
	call	__kmpc_global_thread_num@plt
	sw	s7, 76(sp)
	sw	s1, 68(sp)
	sw	s4, 64(sp)
	sw	s2, 60(sp)
	sw	s8, 52(sp)
	sw	s6, 48(sp)
	addi	a0, sp, 76
	sw	a0, 112(sp)
	addi	a0, sp, 64
	sw	a0, 116(sp)
	addi	a0, sp, 60
	sw	a0, 120(sp)
	addi	a0, sp, 48
	sw	a0, 124(sp)
	lw	a0, 12(sp)                      # 4-byte Folded Reload
	sw	a0, 128(sp)
	sw	s3, 132(sp)
	lw	a0, 16(sp)                      # 4-byte Folded Reload
	sw	a0, 136(sp)
	lui	a0, %hi(kernel_2mm..omp_par.1)
	addi	a2, a0, %lo(kernel_2mm..omp_par.1)
	li	a1, 1
	addi	a3, sp, 112
	mv	a0, s0
	call	__kmpc_fork_call@plt
	lw	ra, 188(sp)                     # 4-byte Folded Reload
	lw	s0, 184(sp)                     # 4-byte Folded Reload
	lw	s1, 180(sp)                     # 4-byte Folded Reload
	lw	s2, 176(sp)                     # 4-byte Folded Reload
	lw	s3, 172(sp)                     # 4-byte Folded Reload
	lw	s4, 168(sp)                     # 4-byte Folded Reload
	lw	s5, 164(sp)                     # 4-byte Folded Reload
	lw	s6, 160(sp)                     # 4-byte Folded Reload
	lw	s7, 156(sp)                     # 4-byte Folded Reload
	lw	s8, 152(sp)                     # 4-byte Folded Reload
	lw	s9, 148(sp)                     # 4-byte Folded Reload
	lw	s10, 144(sp)                    # 4-byte Folded Reload
	lw	s11, 140(sp)                    # 4-byte Folded Reload
	addi	sp, sp, 192
	ret
.Lfunc_end1:
	.size	kernel_2mm, .Lfunc_end1-kernel_2mm
	.cfi_endproc
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_2mm..omp_par.1
	.type	kernel_2mm..omp_par.1,@function
kernel_2mm..omp_par.1:                  # @kernel_2mm..omp_par.1
# %bb.0:                                # %omp.par.entry17
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
	lw	a1, 0(a2)
	lw	a4, 4(a2)
	lw	a5, 8(a2)
	lw	a3, 12(a2)
	lw	a0, 0(a0)
	lw	s4, 16(a2)
	lw	s7, 20(a2)
	lw	s0, 24(a2)
	sw	a0, 52(sp)
	lw	s1, 0(a1)
	srai	a2, s1, 31
	beqz	a2, .LBB2_2
# %bb.1:                                # %omp.par.entry17
	li	a0, 0
	slti	a7, a2, 0
	j	.LBB2_3
.LBB2_2:
	seqz	a7, s1
	sltiu	a0, s1, 2
.LBB2_3:                                # %omp.par.entry17
	li	a6, 1
	li	a1, 1
	bnez	a0, .LBB2_5
# %bb.4:                                # %omp.par.entry17
	mv	a1, s1
.LBB2_5:                                # %omp.par.entry17
	lw	s5, 4(a4)
	lw	s6, 0(a4)
	flw	ft0, 0(a5)
	lw	s1, 4(a3)
	lw	s8, 0(a3)
	sw	zero, 40(sp)
	sw	zero, 44(sp)
	addi	a3, a1, -1
	sltu	a4, a3, a1
	bnez	a0, .LBB2_7
# %bb.6:                                # %omp.par.entry17
	add	a4, a4, a2
.LBB2_7:                                # %omp.par.entry17
	fsw	ft0, 20(sp)                     # 4-byte Folded Spill
	li	a0, -1
	li	a1, -1
	bnez	a7, .LBB2_9
# %bb.8:                                # %omp.par.entry17
	addi	a0, a4, -1
	mv	a1, a3
.LBB2_9:                                # %omp.par.entry17
	sw	a1, 32(sp)
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
	j	.LBB2_11
.LBB2_10:                               # %omp.wsloop.region44
                                        #   in Loop: Header=BB2_11 Depth=1
	addi	a0, t2, 1
	sltu	a1, a0, t2
	add	t1, t1, a1
	mv	t2, a0
.LBB2_11:                               # %omp_loop.header28
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_16 Depth 2
	beq	t1, t0, .LBB2_13
# %bb.12:                               # %omp_loop.header28
                                        #   in Loop: Header=BB2_11 Depth=1
	sltu	a0, t1, t0
	bnez	a0, .LBB2_14
	j	.LBB2_23
.LBB2_13:                               #   in Loop: Header=BB2_11 Depth=1
	sltu	a0, t2, a6
	beqz	a0, .LBB2_23
.LBB2_14:                               # %omp_loop.body30
                                        #   in Loop: Header=BB2_11 Depth=1
	li	a0, 0
	li	t4, 0
	add	t3, t2, a7
	j	.LBB2_16
.LBB2_15:                               # %omp.wsloop.region43
                                        #   in Loop: Header=BB2_16 Depth=2
	addi	a1, a0, 1
	sltu	a0, a1, a0
	add	t4, t4, a0
	mv	a0, a1
.LBB2_16:                               # %omp.wsloop.region39
                                        #   Parent Loop BB2_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beq	t4, s5, .LBB2_18
# %bb.17:                               # %omp.wsloop.region39
                                        #   in Loop: Header=BB2_16 Depth=2
	slt	a1, t4, s5
	bnez	a1, .LBB2_19
	j	.LBB2_10
.LBB2_18:                               #   in Loop: Header=BB2_16 Depth=2
	sltu	a1, a0, s6
	beqz	a1, .LBB2_10
.LBB2_19:                               # %omp.wsloop.region40
                                        #   in Loop: Header=BB2_16 Depth=2
	slli	a4, t3, 5
	add	a1, a4, a0
	slli	a1, a1, 2
	add	a1, a1, s4
	flw	ft0, 0(a1)
	li	a3, 0
	li	a2, 0
	fmul.s	ft0, ft0, ft3
	fsw	ft0, 0(a1)
	beq	a2, s1, .LBB2_21
.LBB2_20:                               # %omp.wsloop.region41
                                        #   in Loop: Header=BB2_16 Depth=2
	slt	a5, a2, s1
	bnez	a5, .LBB2_22
	j	.LBB2_15
.LBB2_21:                               #   in Loop: Header=BB2_16 Depth=2
	sltu	a5, a3, s8
	beqz	a5, .LBB2_15
.LBB2_22:                               # %omp.wsloop.region42
                                        #   in Loop: Header=BB2_16 Depth=2
	add	a5, a4, a3
	slli	a5, a5, 2
	add	a5, a5, s7
	flw	ft0, 0(a5)
	slli	a5, a3, 5
	add	a5, a5, a0
	slli	a5, a5, 2
	add	a5, a5, s0
	flw	ft1, 0(a5)
	flw	ft2, 0(a1)
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a1)
	addi	a5, a3, 1
	sltu	a3, a5, a3
	add	a2, a2, a3
	mv	a3, a5
	beq	a2, s1, .LBB2_21
	j	.LBB2_20
.LBB2_23:                               # %omp_loop.exit32
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
	.size	kernel_2mm..omp_par.1, .Lfunc_end2-kernel_2mm..omp_par.1
                                        # -- End function
	.p2align	1                               # -- Begin function kernel_2mm..omp_par
	.type	kernel_2mm..omp_par,@function
kernel_2mm..omp_par:                    # @kernel_2mm..omp_par
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
	lw	a1, 0(a2)
	lw	a5, 4(a2)
	lw	a3, 8(a2)
	lw	a4, 12(a2)
	lw	a0, 0(a0)
	lw	s4, 16(a2)
	lw	s7, 20(a2)
	lw	s0, 24(a2)
	sw	a0, 52(sp)
	lw	s1, 0(a1)
	srai	a2, s1, 31
	beqz	a2, .LBB3_2
# %bb.1:                                # %omp.par.entry
	li	a0, 0
	slti	a7, a2, 0
	j	.LBB3_3
.LBB3_2:
	seqz	a7, s1
	sltiu	a0, s1, 2
.LBB3_3:                                # %omp.par.entry
	li	a6, 1
	li	a1, 1
	bnez	a0, .LBB3_5
# %bb.4:                                # %omp.par.entry
	mv	a1, s1
.LBB3_5:                                # %omp.par.entry
	lw	s5, 4(a5)
	lw	s6, 0(a5)
	lw	s1, 4(a3)
	lw	s8, 0(a3)
	flw	ft0, 0(a4)
	sw	zero, 40(sp)
	sw	zero, 44(sp)
	addi	a3, a1, -1
	sltu	a4, a3, a1
	bnez	a0, .LBB3_7
# %bb.6:                                # %omp.par.entry
	add	a4, a4, a2
.LBB3_7:                                # %omp.par.entry
	fsw	ft0, 20(sp)                     # 4-byte Folded Spill
	li	a0, -1
	li	a1, -1
	bnez	a7, .LBB3_9
# %bb.8:                                # %omp.par.entry
	addi	a0, a4, -1
	mv	a1, a3
.LBB3_9:                                # %omp.par.entry
	sw	a1, 32(sp)
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
	j	.LBB3_11
.LBB3_10:                               # %omp.wsloop.region8
                                        #   in Loop: Header=BB3_11 Depth=1
	addi	a0, t2, 1
	sltu	a1, a0, t2
	add	t1, t1, a1
	mv	t2, a0
.LBB3_11:                               # %omp_loop.header
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_16 Depth 2
	beq	t1, t0, .LBB3_13
# %bb.12:                               # %omp_loop.header
                                        #   in Loop: Header=BB3_11 Depth=1
	sltu	a0, t1, t0
	bnez	a0, .LBB3_14
	j	.LBB3_23
.LBB3_13:                               #   in Loop: Header=BB3_11 Depth=1
	sltu	a0, t2, a6
	beqz	a0, .LBB3_23
.LBB3_14:                               # %omp_loop.body
                                        #   in Loop: Header=BB3_11 Depth=1
	li	a0, 0
	li	t4, 0
	add	t3, t2, a7
	j	.LBB3_16
.LBB3_15:                               # %omp.wsloop.region7
                                        #   in Loop: Header=BB3_16 Depth=2
	addi	a1, a0, 1
	sltu	a0, a1, a0
	add	t4, t4, a0
	mv	a0, a1
.LBB3_16:                               # %omp.wsloop.region3
                                        #   Parent Loop BB3_11 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	beq	t4, s5, .LBB3_18
# %bb.17:                               # %omp.wsloop.region3
                                        #   in Loop: Header=BB3_16 Depth=2
	slt	a1, t4, s5
	bnez	a1, .LBB3_19
	j	.LBB3_10
.LBB3_18:                               #   in Loop: Header=BB3_16 Depth=2
	sltu	a1, a0, s6
	beqz	a1, .LBB3_10
.LBB3_19:                               # %omp.wsloop.region4
                                        #   in Loop: Header=BB3_16 Depth=2
	li	a2, 0
	li	a4, 0
	slli	a1, t3, 5
	add	a3, a1, a0
	slli	a3, a3, 2
	add	a3, a3, s4
	sw	zero, 0(a3)
	beq	a4, s1, .LBB3_21
.LBB3_20:                               # %omp.wsloop.region5
                                        #   in Loop: Header=BB3_16 Depth=2
	slt	a5, a4, s1
	bnez	a5, .LBB3_22
	j	.LBB3_15
.LBB3_21:                               #   in Loop: Header=BB3_16 Depth=2
	sltu	a5, a2, s8
	beqz	a5, .LBB3_15
.LBB3_22:                               # %omp.wsloop.region6
                                        #   in Loop: Header=BB3_16 Depth=2
	add	a5, a1, a2
	slli	a5, a5, 2
	add	a5, a5, s7
	flw	ft0, 0(a5)
	slli	a5, a2, 5
	add	a5, a5, a0
	slli	a5, a5, 2
	add	a5, a5, s0
	flw	ft1, 0(a5)
	flw	ft2, 0(a3)
	fmul.s	ft0, ft3, ft0
	fmul.s	ft0, ft0, ft1
	fadd.s	ft0, ft2, ft0
	fsw	ft0, 0(a3)
	addi	a5, a2, 1
	sltu	a2, a5, a2
	add	a4, a4, a2
	mv	a2, a5
	beq	a4, s1, .LBB3_21
	j	.LBB3_20
.LBB3_23:                               # %omp_loop.exit
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
.Lfunc_end3:
	.size	kernel_2mm..omp_par, .Lfunc_end3-kernel_2mm..omp_par
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
