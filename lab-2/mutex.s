	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW

	ldr r1, =locked			@ Load the 'locked taken' value, and put into r1
.L1:
	ldrex r2, [r0]			@ Load the lock value from r0 (Lock Address), and put into r2
	cmp r2, unlocked		@ Compare the 'unlocked taken' value
	strexeq r2, r1, [r0]		@ If R2 = unlocked, store r1 into r0.
	cmpeq r2, #0			@ If R2 = unlocked, compre the r2 (return value of strexeq) with zero
	bne .L1				@ If strexeq is failed or Lock Address is locked, goto .L1

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW

	ldr r1, =unlocked		@ Load the 'unlocked taken' value, and put into r1
	str r1, [r0]			@ Store r1 into r0 (Lock Address)
        
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
