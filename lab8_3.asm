.data
string:	.asciiz "ashutosh"
.text
main:
	la	$s0, string
	li	$t0, 7
	add	$s1, $t0, $s0
	
loop:
	bgt	$s0, $s1, exit
	lb	$t1, 0($s0)
	lb	$t2, 0($s1)
	sb	$t2, 0($s0)
	sb	$t1, 0($s1)
	addi	$s0, $s0, 1
	addi	$s1, $s1, -1
	j	loop

exit:
	la	$s0, string
	li	$t0, 1
print:
	lb	$a0, 0($s0)
	li	$v0, 11
	syscall
	addi	$s0, $s0, 1
	addi	$t0, $t0, 1
	bne	$t0, 9, print
	jr	$31
