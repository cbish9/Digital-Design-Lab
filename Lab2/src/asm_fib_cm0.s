 	.syntax unified
 	.cpu cortex-m0
 	.align	2
 	.global	fibonacci_asm
 	.thumb
 	.thumb_func


 fibonacci_asm:
 		adds 	r4, r4, #0 			// This is n1
 		adds 	r5, r4, #1			// This is n2
 		adds 	r6, r4, #0 			// This is n3

 		push 	{r7, lr}

 		# Allocate space for r0 and r3
 		sub		sp, sp, #8
		add		r7, sp, 0
		str 	r0, [r7, #4]
		ldr 	r3, [r7, #4]		// Initial parameter passed is r3

 		//Compare with base case
 		cmp 	r3, #1
 		ble 	base_one

 		//Continue if not a base case, pass r0 for recursion
		subs	r3, #1
		movs 	r0, r3
		bl fibonacci_asm

		//Compute result
		movs r2, r4				// Copy n1 to r2
		movs r3, r5				// Copy n2 to r3
		add r2, r3				// Add n1 and n2. Place in r2
		mov r4, r3				// Update n1 = n2
		mov r5, r2				// Update n2 = n3

		//return result and restore r7, pc
		mov r0, r2
		bl base_one

base_one:
 		mov sp, r7					// Move contents of r7 to the sp
 		add sp, sp, #8				// Move the stack pointer ahead 8 bytes
 		pop {r7, pc}				// Load r7 and pc from the stack, branch to pc

