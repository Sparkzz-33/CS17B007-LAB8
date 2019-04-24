.data
array: .word 1, 1, 2, 1, 3, 5
.text
main:
	li	$s0, 6
	li	$s1, 0
	li	$s2, 1
	li	$t2, 0
	la	$t0, array
	j	loop
loop:
	bgt	$t2, $s0, exit
	lw	$t1, 0($t0)
	bne	$s2, $t1, continue
	addi	$s1, $s1, 1
continue:
	addi 	$t2, $t2, 1
	addi	$t0, $t0, 4
	j	loop
exit:
	jr	$31
