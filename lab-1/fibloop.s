	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	mov r5, r0			@ record the number of sequence 
	mov r0, #0			@ initial basic value is zero
	mov r3, #1			@ initial second value is one
	mov r4, #1			@ initial count numver is one
.L1:
	add r0, r0, r3			@ r0 = r0 + r3
	mov r3, r0			@ r3 = r0
	add r4, r4, #1			@ r4 = r4 + 1 count++
	cmp r4, r5			@ Compare r4 with r5
	blt .L1				@ If r4 < r5 goto .L1

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
