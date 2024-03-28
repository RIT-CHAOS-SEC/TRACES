	.cpu cortex-m33
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"application.c"
	.section	.text.divides,"ax",%progbits
	.align	1
	.global	divides
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	divides, %function
divides:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	udiv	r2, r3, r2
	ldr	r1, [r7, #4]
	mul	r2, r1, r2
	subs	r3, r3, r2
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	divides, .-divides
	.section	.text.even,"ax",%progbits
	.align	1
	.global	even
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	even, %function
even:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r1, [r7, #4]
	movs	r0, #2
	bl	divides
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	even, .-even
	.section	.text.prime,"ax",%progbits
	.align	1
	.global	prime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	prime, %function
prime:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	even
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	ldr	r3, [r7, #4]
	cmp	r3, #2
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	b	.L7
.L6:
	movs	r3, #3
	str	r3, [r7, #12]
	b	.L8
.L10:
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #12]
	bl	divides
	mov	r3, r0
	cmp	r3, #0
	beq	.L9
	movs	r3, #0
	b	.L7
.L9:
	ldr	r3, [r7, #12]
	adds	r3, r3, #2
	str	r3, [r7, #12]
.L8:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	mul	r2, r2, r3
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bls	.L10
	ldr	r3, [r7, #4]
	cmp	r3, #1
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	uxtb	r3, r3
.L7:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	prime, .-prime
	.section	.text.swap,"ax",%progbits
	.align	1
	.global	swap
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	swap, %function
swap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	swap, .-swap
	.global	result
	.section	.bss.result,"aw",%nobits
	.align	2
	.type	result, %object
	.size	result, 4
result:
	.space	4
	.comm	x,4,4
	.comm	y,4,4
	.section	.text.application,"ax",%progbits
	.align	1
	.global	application
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	application, %function
application:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L16
	movw	r2, #21649
	str	r2, [r3]
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	str	r2, [r3]
	ldr	r1, .L16+4
	ldr	r0, .L16
	bl	swap
	ldr	r3, .L16
	ldr	r3, [r3]
	mov	r0, r3
	bl	prime
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	ldr	r3, .L16+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	prime
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
.L13:
	movs	r3, #1
	b	.L15
.L14:
	movs	r3, #0
.L15:
	ldr	r2, .L16+12
	str	r3, [r2]
	movs	r0, #0
	bl	SECURE_record_output_data
	nop
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	x
	.word	y
	.word	513239
	.word	result
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
