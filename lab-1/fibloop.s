	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, lr}

	subs r5, r0, #1
	ble .L2			

	movs r0, #0
	movs r3, #0			
	movs r4, #1			
.L1:
	add r0, r3, r4			@ r0 = r3 + r3
	mov r3, r4			@ r3 = r4
	mov r4, r0			@ r4 = r0
	subs r5, r5, #1			@ r5 = r5 - 1
	bgt .L1				@ If r5 > 0 goto .L1

.L2:
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
