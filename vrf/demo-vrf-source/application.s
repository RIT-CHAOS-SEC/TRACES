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
	.global	data
	.section	.data.data,"aw",%progbits
	.align	2
	.type	data, %object
	.size	data, 120
data:
	.word	1
	.word	100
	.word	5
	.word	200
	.word	6
	.word	300
	.word	7
	.word	700
	.word	8
	.word	900
	.word	9
	.word	250
	.word	10
	.word	400
	.word	11
	.word	600
	.word	12
	.word	800
	.word	13
	.word	1500
	.word	14
	.word	1200
	.word	15
	.word	110
	.word	16
	.word	140
	.word	17
	.word	133
	.word	18
	.word	10
	.global	user_input
	.section	.data.user_input,"aw",%progbits
	.align	2
	.type	user_input, %object
	.size	user_input, 37
user_input:
	.byte	17
	.byte	34
	.byte	51
	.byte	68
	.byte	4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	-24
	.byte	-1
	.byte	3
	.byte	32
	.byte	127
	.byte	3
	.byte	4
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	121
	.byte	3
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
	b	.L2
.L3:
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r1, .L4
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r2, .L4
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L3
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	user_input
	.size	read_data, .-read_data
	.section	.text.binary_search,"ax",%progbits
	.align	1
	.global	binary_search
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	binary_search, %function
binary_search:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #32
	add	r7, sp, #0
	str	r0, [r7, #4]
	add	r3, r7, #12
	mov	r0, r3
	bl	read_data
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #14
	str	r3, [r7, #24]
	mov	r3, #-1
	str	r3, [r7, #28]
	b	.L7
.L10:
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #24]
	add	r3, r3, r2
	asrs	r3, r3, #1
	str	r3, [r7, #16]
	ldr	r2, .L12
	ldr	r3, [r7, #16]
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L8
	ldr	r3, [r7, #20]
	subs	r3, r3, #1
	str	r3, [r7, #24]
	ldr	r2, .L12
	ldr	r3, [r7, #16]
	lsls	r3, r3, #3
	add	r3, r3, r2
	ldr	r3, [r3, #4]
	str	r3, [r7, #28]
	b	.L7
.L8:
	ldr	r2, .L12
	ldr	r3, [r7, #16]
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	.L9
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	str	r3, [r7, #24]
	b	.L7
.L9:
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L7:
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #24]
	cmp	r2, r3
	ble	.L10
	ldr	r3, [r7, #28]
	mov	r0, r3
	adds	r7, r7, #32
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	data
	.size	binary_search, .-binary_search
	.section	.text.verify_benchmark,"ax",%progbits
	.align	1
	.global	verify_benchmark
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	verify_benchmark, %function
verify_benchmark:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	mov	r3, #-1
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.initialise_benchmark,"ax",%progbits
	.align	1
	.global	initialise_benchmark
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	initialise_benchmark, %function
initialise_benchmark:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	initialise_benchmark, .-initialise_benchmark
	.global	decision
	.section	.bss.decision,"aw",%nobits
	.align	2
	.type	decision, %object
	.size	decision, 4
decision:
	.space	4
	.comm	result,4,4
	.section	.text.func1,"ax",%progbits
	.align	1
	.global	func1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	func1, %function
func1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L18
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L18
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	result
	.size	func1, .-func1
	.section	.text.func2,"ax",%progbits
	.align	1
	.global	func2
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	func2, %function
func2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L21
	ldr	r3, [r3]
	adds	r3, r3, #2
	ldr	r2, .L21
	str	r3, [r2]
	nop
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	result
	.size	func2, .-func2
	.section	.text.application,"ax",%progbits
	.align	1
	.global	application
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	application, %function
application:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L26
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L24
	ldr	r3, .L26+4
	str	r3, [r7, #4]
	b	.L25
.L24:
	ldr	r3, .L26+8
	str	r3, [r7, #4]
.L25:
	movs	r0, #8
	bl	binary_search
	mov	r2, r0
	ldr	r3, .L26+12
	str	r2, [r3]
	ldr	r3, [r7, #4]
	blx	r3
	ldr	r3, .L26+12
	ldr	r3, [r3]
	mov	r0, r3
	bl	SECURE_record_output_data
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L27:
	.align	2
.L26:
	.word	decision
	.word	func1
	.word	func2
	.word	result
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
