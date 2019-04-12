.data
array: .word 1, 1, 0, 1, 0, 1, 0, 0, 0, 1
.text
main:
	la	$s0, array
	li	$t0, 0
	li	$t1, 36
	add	$s1, $s0, $t1

loop:
	bgt	$s0, $s1, exit
	lw	$t2, 0($s0)
	lw	$t3, 0($s1)
	li	$t4, 1
	li	$t5, 0
	beq	$t2, $t4, if
	beq	$t3, $zero, itr1
	j	itr
itr1:
	addi	$s0, $s0, 4
	j	loop
if:
	beq	$t3, $t5, andif
	addi	$s1, $s1, -4
	j	loop
andif:
	sw	$t5, 0($s0)
	sw	$t4, 0($s1)
	j	itr
itr:
	addi	$s0, $s0, 4
	addi	$s1, $s1, -4
	j	loop
exit:
	la	$s0, array
	li	$s1, 0
print:
	lw	$a0, 0($s0)
	addi	$s1, $s1, 1
	addi	$s0, $s0, 4
	li	$v0, 1
	syscall
	bne	$s1, 10, print
	jr	$31
