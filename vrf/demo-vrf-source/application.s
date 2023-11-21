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
	.text
	.global	input
	.section	.data.input,"aw"
	.align	2
	.type	input, %object
	.size	input, 512
input:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.comm	code,512,4
	.section	.text.ham_calc,"ax",%progbits
	.align	1
	.global	ham_calc
	.arch armv8-m.main
	.arch_extension dsp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	ham_calc, %function
ham_calc:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #16]
	b	.L2
.L6:
	ldr	r3, [r7, #16]
	str	r3, [r7, #12]
	b	.L3
.L5:
	ldr	r2, .L8
	ldr	r3, [r7, #12]
	ldr	r3, [r2, r3, lsl #2]
	cmp	r3, #1
	bne	.L4
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L4:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L3:
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [r7, #4]
	lsls	r3, r3, #1
	ldr	r2, [r7, #16]
	add	r3, r3, r2
	str	r3, [r7, #16]
.L2:
	ldr	r2, [r7, #16]
	ldr	r3, [r7]
	cmp	r2, r3
	blt	.L6
	ldr	r3, [r7, #20]
	and	r3, r3, #1
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	code
	.size	ham_calc, .-ham_calc
	.section	.text.solve,"ax",%progbits
	.align	1
	.global	solve
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	solve, %function
solve:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #32]
	movs	r3, #0
	str	r3, [r7, #36]
	b	.L11
.L12:
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L11:
	movs	r2, #1
	ldr	r3, [r7, #36]
	lsls	r2, r2, r3
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	subs	r3, r2, r3
	ldr	r2, [r7]
	cmp	r2, r3
	bgt	.L12
	ldr	r2, [r7, #32]
	ldr	r3, [r7]
	add	r3, r3, r2
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #24]
	ldr	r3, [r7, #24]
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #36]
	b	.L13
.L16:
	movs	r2, #1
	ldr	r3, [r7, #24]
	lsl	r3, r2, r3
	subs	r3, r3, #1
	ldr	r2, [r7, #36]
	cmp	r2, r3
	bne	.L14
	ldr	r2, .L19
	ldr	r3, [r7, #36]
	movs	r1, #0
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
	b	.L15
.L14:
	ldr	r3, [r7, #28]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r3]
	ldr	r1, .L19
	ldr	r3, [r7, #36]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L15:
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L13:
	ldr	r2, [r7, #36]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	.L16
	movs	r3, #0
	str	r3, [r7, #36]
	b	.L17
.L18:
	movs	r2, #1
	ldr	r3, [r7, #36]
	lsl	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r1, [r7, #20]
	ldr	r0, [r7, #16]
	bl	ham_calc
	str	r0, [r7, #12]
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	ldr	r1, .L19
	ldr	r2, [r7, #12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L17:
	ldr	r2, [r7, #36]
	ldr	r3, [r7, #32]
	cmp	r2, r3
	blt	.L18
	nop
	nop
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	code
	.size	solve, .-solve
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
	movs	r1, #128
	ldr	r0, .L22
	bl	solve
	nop
	pop	{r7, pc}
.L23:
	.align	2
.L22:
	.word	input
	.size	application, .-application
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
