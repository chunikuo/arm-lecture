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
	push {r4, r5, lr}

	subs r4, r0, #1		
	bgt .L3				@ if(R0 <= 0) goto .L3 (which returns 0)
	@movne r0, #0
	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, r4			
	bl  fibonacci

	mov r5, r0
	sub r0, r4, #1
	bl  fibonacci

	add r0, r5, r0
	pop {r4, r5, pc}		@ EPILOG


	.size fibonacci, .-fibonacci
	.end
