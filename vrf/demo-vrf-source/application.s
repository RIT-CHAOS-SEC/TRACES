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
	.section	.text.compress1,"ax",%progbits
	.align	1
	.global	compress1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	compress1, %function
compress1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L2
.L5:
	ldr	r3, [r7]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
	ldr	r3, [r7, #4]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L4
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	orrs	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #1
	str	r3, [r7, #8]
	b	.L3
.L4:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #1
	str	r3, [r7, #8]
.L3:
	ldr	r3, [r7]
	lsrs	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	compress1, .-compress1
	.section	.text.compress2,"ax",%progbits
	.align	1
	.global	compress2
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	compress2, %function
compress2:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
.L8:
	ldr	r3, [r7]
	and	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	ands	r2, r2, r3
	ldr	r3, [r7, #16]
	lsl	r3, r2, r3
	ldr	r2, [r7, #20]
	orrs	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	lsrs	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [r7, #20]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	compress2, .-compress2
	.section	.text.compress3,"ax",%progbits
	.align	1
	.global	compress3
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	compress3, %function
compress3:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #52
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7]
	mvns	r3, r3
	str	r3, [r7, #44]
	ldr	r3, [r7]
	str	r3, [r7, #40]
	movs	r3, #0
	str	r3, [r7, #36]
	b	.L11
.L12:
	ldr	r3, [r7, #44]
	str	r3, [r7, #32]
	ldr	r3, [r7, #44]
	lsls	r3, r3, #1
	ldr	r2, [r7, #44]
	eors	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	lsls	r3, r3, #2
	ldr	r2, [r7, #44]
	eors	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	lsls	r3, r3, #4
	ldr	r2, [r7, #44]
	eors	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	lsls	r3, r3, #8
	ldr	r2, [r7, #44]
	eors	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	lsls	r3, r3, #16
	ldr	r2, [r7, #44]
	eors	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	lsls	r2, r3, #1
	ldr	r3, [r7, #40]
	ands	r2, r2, r3
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	add	r1, r7, #48
	add	r3, r3, r1
	str	r2, [r3, #-36]
	ldr	r3, [r7, #44]
	mvns	r2, r3
	ldr	r3, [r7, #32]
	ands	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	add	r2, r7, #48
	add	r3, r3, r2
	ldr	r2, [r3, #-36]
	ldr	r3, [r7, #40]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #40]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	movs	r1, #1
	ldr	r3, [r7, #36]
	lsl	r3, r1, r3
	ldr	r1, [r7, #32]
	lsr	r3, r1, r3
	eors	r3, r3, r2
	str	r3, [r7, #40]
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L11:
	ldr	r3, [r7, #36]
	cmp	r3, #4
	ble	.L12
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	ands	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #1
	eors	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #4]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #2
	eors	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #4
	eors	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #4]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #8
	eors	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	ands	r3, r3, r2
	str	r3, [r7, #32]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #32]
	eors	r2, r2, r3
	ldr	r3, [r7, #32]
	lsrs	r3, r3, #16
	eors	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #52
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	compress3, .-compress3
	.global	user_input
	.section	.data.user_input,"aw",%progbits
	.align	2
	.type	user_input, %object
	.size	user_input, 33
user_input:
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	-95
	.byte	-94
	.byte	-93
	.byte	-92
	.byte	-79
	.byte	-78
	.byte	-77
	.byte	-76
	.byte	-63
	.byte	-62
	.byte	-61
	.byte	-60
	.byte	-47
	.byte	-46
	.byte	-45
	.byte	-44
	.byte	-31
	.byte	-30
	.byte	-29
	.byte	-28
	.byte	-32
	.byte	-1
	.byte	3
	.byte	32
	.byte	37
	.byte	6
	.byte	4
	.byte	8
	.byte	1
	.section	.text.read_data,"ax",%progbits
	.align	1
	.global	read_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	read_data, %function
read_data:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L15
.L16:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r1, .L17
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L15:
	ldr	r2, .L17
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L16
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	user_input
	.size	read_data, .-read_data
	.section	.text.compress4,"ax",%progbits
	.align	1
	.global	compress4
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	compress4, %function
compress4:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	add	r3, r7, #8
	mov	r0, r3
	bl	read_data
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	ands	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7]
	mvns	r3, r3
	lsls	r3, r3, #1
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	b	.L20
.L21:
	ldr	r3, [r7, #28]
	lsls	r2, r3, #1
	ldr	r3, [r7, #28]
	eors	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #2
	ldr	r2, [r7, #20]
	eors	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	ldr	r2, [r7, #20]
	eors	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #8
	ldr	r2, [r7, #20]
	eors	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #16
	ldr	r2, [r7, #20]
	eors	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #20]
	ldr	r3, [r7]
	ands	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7]
	ldr	r3, [r7, #16]
	eors	r2, r2, r3
	movs	r1, #1
	ldr	r3, [r7, #24]
	lsl	r3, r1, r3
	ldr	r1, [r7, #16]
	lsr	r3, r1, r3
	orrs	r3, r3, r2
	str	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #16]
	ands	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	eors	r2, r2, r3
	movs	r1, #1
	ldr	r3, [r7, #24]
	lsl	r3, r1, r3
	ldr	r1, [r7, #12]
	lsr	r3, r1, r3
	orrs	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7, #20]
	mvns	r3, r3
	ldr	r2, [r7, #28]
	ands	r3, r3, r2
	str	r3, [r7, #28]
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
.L20:
	ldr	r3, [r7, #24]
	cmp	r3, #4
	ble	.L21
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #32
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	compress4, .-compress4
	.global	test
	.section	.rodata.test,"a",%progbits
	.align	2
	.type	test, %object
	.size	test, 12
test:
	.word	65535
	.word	32768
	.word	1
	.global	errors
	.section	.bss.errors,"aw",%nobits
	.align	2
	.type	errors, %object
	.size	errors, 4
errors:
	.space	4
	.section	.text.application,"ax",%progbits
	.align	1
	.global	application
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	application, %function
application:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r2, .L28
	ldr	r3, [r7, #8]
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldr	r2, .L28
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, r3
	bl	compress1
	str	r0, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	ldr	r2, .L28
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L24
	movs	r3, #1
	str	r3, [r7, #12]
.L24:
	ldr	r2, .L28
	ldr	r3, [r7, #8]
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldr	r2, .L28
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, r3
	bl	compress2
	str	r0, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	ldr	r2, .L28
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L25
	movs	r3, #1
	str	r3, [r7, #12]
.L25:
	ldr	r2, .L28
	ldr	r3, [r7, #8]
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldr	r2, .L28
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, r3
	bl	compress3
	str	r0, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	ldr	r2, .L28
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L26
	movs	r3, #1
	str	r3, [r7, #12]
.L26:
	ldr	r2, .L28
	ldr	r3, [r7, #8]
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldr	r2, .L28
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, r3
	bl	compress4
	str	r0, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r3, #2
	ldr	r2, .L28
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L27
	movs	r3, #1
	str	r3, [r7, #12]
.L27:
	ldr	r0, [r7, #12]
	bl	SECURE_record_output_data
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	test
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
