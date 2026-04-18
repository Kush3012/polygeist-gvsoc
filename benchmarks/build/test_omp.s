	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_f2p0_c2p0"
	.file	"LLVMDialectModule"
	.globl	kernel_test                     # -- Begin function kernel_test
	.p2align	1
	.type	kernel_test,@function
kernel_test:                            # @kernel_test
	.cfi_startproc
# %bb.0:
	li	a3, 0
	li	a0, 0
	li	a1, 7
	lui	a2, %hi(.Lthread_seen)
	addi	a2, a2, %lo(.Lthread_seen)
	li	a4, 1
	beqz	a0, .LBB0_2
.LBB0_1:
	sgtz	a5, a0
	beqz	a5, .LBB0_3
	j	.LBB0_4
.LBB0_2:
	sltu	a5, a1, a3
	bnez	a5, .LBB0_4
.LBB0_3:
	slli	a5, a3, 2
	add	a5, a5, a2
	sw	a4, 0(a5)
	addi	a5, a3, 1
	sltu	a3, a5, a3
	add	a0, a0, a3
	mv	a3, a5
	beqz	a0, .LBB0_2
	j	.LBB0_1
.LBB0_4:
	ret
.Lfunc_end0:
	.size	kernel_test, .Lfunc_end0-kernel_test
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	li	a2, 0
	li	a0, 0
	li	a1, 7
	lui	a3, %hi(.Lthread_seen)
	addi	a3, a3, %lo(.Lthread_seen)
	beqz	a0, .LBB1_2
.LBB1_1:
	sgtz	a4, a0
	beqz	a4, .LBB1_3
	j	.LBB1_4
.LBB1_2:
	sltu	a4, a1, a2
	bnez	a4, .LBB1_4
.LBB1_3:
	slli	a4, a2, 2
	add	a4, a4, a3
	sw	zero, 0(a4)
	addi	a4, a2, 1
	sltu	a2, a4, a2
	add	a0, a0, a2
	mv	a2, a4
	beqz	a0, .LBB1_2
	j	.LBB1_1
.LBB1_4:
	li	a3, 0
	li	a0, 0
	li	a1, 7
	lui	a2, %hi(.Lthread_seen)
	addi	a2, a2, %lo(.Lthread_seen)
	li	a4, 1
	beqz	a0, .LBB1_6
.LBB1_5:
	sgtz	a5, a0
	beqz	a5, .LBB1_7
	j	.LBB1_8
.LBB1_6:
	sltu	a5, a1, a3
	bnez	a5, .LBB1_8
.LBB1_7:
	slli	a5, a3, 2
	add	a5, a5, a2
	sw	a4, 0(a5)
	addi	a5, a3, 1
	sltu	a3, a5, a3
	add	a0, a0, a3
	mv	a3, a5
	beqz	a0, .LBB1_6
	j	.LBB1_5
.LBB1_8:
	li	a2, 0
	li	a1, 0
	li	a0, 0
	li	a3, 7
	lui	a4, %hi(.Lthread_seen)
	addi	a4, a4, %lo(.Lthread_seen)
	beqz	a1, .LBB1_10
.LBB1_9:
	sgtz	a5, a1
	beqz	a5, .LBB1_11
	j	.LBB1_12
.LBB1_10:
	sltu	a5, a3, a2
	bnez	a5, .LBB1_12
.LBB1_11:
	slli	a5, a2, 2
	add	a5, a5, a4
	lw	a5, 0(a5)
	add	a0, a0, a5
	addi	a5, a2, 1
	sltu	a2, a5, a2
	add	a1, a1, a2
	mv	a2, a5
	beqz	a1, .LBB1_10
	j	.LBB1_9
.LBB1_12:
	addi	a0, a0, -8
	snez	a0, a0
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.Lthread_seen,@object           # @thread_seen
	.local	.Lthread_seen
	.comm	.Lthread_seen,32,16
	.section	".note.GNU-stack","",@progbits
