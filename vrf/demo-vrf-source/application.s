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
	.comm	data,256,4
	.global	user_input
	.section	.data.user_input,"aw",%progbits
	.align	2
	.type	user_input, %object
	.size	user_input, 89
user_input:
	.byte	18
	.byte	52
	.byte	18
	.byte	52
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	7
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	0
	.byte	0
	.byte	-1
	.byte	-88
	.byte	108
	.byte	-25
	.byte	5
	.byte	-80
	.byte	-1
	.byte	3
	.byte	32
	.byte	-36
	.byte	-1
	.byte	3
	.byte	32
	.byte	0
	.byte	0
	.byte	2
	.byte	66
	.byte	7
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	-1
	.byte	-1
	.byte	-9
	.byte	-85
	.byte	10
	.byte	0
	.byte	0
	.byte	0
	.byte	-48
	.byte	-1
	.byte	3
	.byte	32
	.byte	-48
	.byte	-1
	.byte	3
	.byte	32
	.byte	4
	.byte	-28
	.byte	68
	.byte	-77
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	56
	.byte	7
	.byte	4
	.byte	8
	.byte	-63
	.byte	34
	.byte	-95
	.byte	-82
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-16
	.byte	-1
	.byte	3
	.byte	32
	.byte	65
	.byte	7
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
	.section	.text.jpeg_fdct_islow,"ax",%progbits
	.align	1
	.global	jpeg_fdct_islow
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	jpeg_fdct_islow, %function
jpeg_fdct_islow:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #80
	add	r7, sp, #0
	mov	r3, r7
	mov	r0, r3
	bl	read_data
	ldr	r3, .L11
	str	r3, [r7, #76]
	movs	r3, #7
	str	r3, [r7, #72]
	b	.L7
.L8:
	ldr	r3, [r7, #76]
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #28
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #68]
	ldr	r3, [r7, #76]
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #28
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #64]
	ldr	r3, [r7, #76]
	adds	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #24
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #60]
	ldr	r3, [r7, #76]
	adds	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #24
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #56]
	ldr	r3, [r7, #76]
	adds	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #20
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #52]
	ldr	r3, [r7, #76]
	adds	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #20
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #48]
	ldr	r3, [r7, #76]
	adds	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #16
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #76]
	adds	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #16
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #40]
	ldr	r2, [r7, #68]
	ldr	r3, [r7, #44]
	add	r3, r3, r2
	str	r3, [r7, #36]
	ldr	r2, [r7, #68]
	ldr	r3, [r7, #44]
	subs	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r2, [r7, #60]
	ldr	r3, [r7, #52]
	add	r3, r3, r2
	str	r3, [r7, #28]
	ldr	r2, [r7, #60]
	ldr	r3, [r7, #52]
	subs	r3, r2, r3
	str	r3, [r7, #24]
	ldr	r2, [r7, #36]
	ldr	r3, [r7, #28]
	add	r3, r3, r2
	lsls	r2, r3, #2
	ldr	r3, [r7, #76]
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #16
	ldr	r1, [r7, #36]
	ldr	r2, [r7, #28]
	subs	r2, r1, r2
	lsls	r2, r2, #2
	str	r2, [r3]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #32]
	add	r3, r3, r2
	movw	r2, #4433
	mul	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #76]
	adds	r3, r3, #8
	ldr	r2, [r7, #32]
	movw	r1, #6270
	mul	r1, r1, r2
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #24
	ldr	r2, [r7, #24]
	ldr	r1, .L11+4
	mul	r1, r1, r2
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r2, [r7, #40]
	ldr	r3, [r7, #64]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #48]
	ldr	r3, [r7, #56]
	add	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7, #40]
	ldr	r3, [r7, #56]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #48]
	ldr	r3, [r7, #64]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	movw	r2, #9633
	mul	r3, r2, r3
	str	r3, [r7, #4]
	ldr	r3, [r7, #40]
	movw	r2, #2446
	mul	r3, r2, r3
	str	r3, [r7, #40]
	ldr	r3, [r7, #48]
	movw	r2, #16819
	mul	r3, r2, r3
	str	r3, [r7, #48]
	ldr	r3, [r7, #56]
	movw	r2, #25172
	mul	r3, r2, r3
	str	r3, [r7, #56]
	ldr	r3, [r7, #64]
	movw	r2, #12299
	mul	r3, r2, r3
	str	r3, [r7, #64]
	ldr	r3, [r7, #20]
	ldr	r2, .L11+8
	mul	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	ldr	r2, .L11+12
	mul	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, .L11+16
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldr	r2, .L11+20
	mul	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #76]
	adds	r3, r3, #28
	ldr	r1, [r7, #40]
	ldr	r2, [r7, #20]
	add	r1, r1, r2
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #20
	ldr	r1, [r7, #48]
	ldr	r2, [r7, #16]
	add	r1, r1, r2
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #12
	ldr	r1, [r7, #56]
	ldr	r2, [r7, #16]
	add	r1, r1, r2
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #4
	ldr	r1, [r7, #64]
	ldr	r2, [r7, #20]
	add	r1, r1, r2
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	add	r2, r2, #1024
	asrs	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #32
	str	r3, [r7, #76]
	ldr	r3, [r7, #72]
	subs	r3, r3, #1
	str	r3, [r7, #72]
.L7:
	ldr	r3, [r7, #72]
	cmp	r3, #0
	bge	.L8
	ldr	r3, .L11
	str	r3, [r7, #76]
	movs	r3, #7
	str	r3, [r7, #72]
	b	.L9
.L12:
	.align	2
.L11:
	.word	data
	.word	-15137
	.word	-7373
	.word	-20995
	.word	-16069
	.word	-3196
.L10:
	ldr	r3, [r7, #76]
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #224
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #68]
	ldr	r3, [r7, #76]
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #224
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #64]
	ldr	r3, [r7, #76]
	adds	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #192
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #60]
	ldr	r3, [r7, #76]
	adds	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #192
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #56]
	ldr	r3, [r7, #76]
	adds	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #160
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #52]
	ldr	r3, [r7, #76]
	adds	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #160
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #48]
	ldr	r3, [r7, #76]
	adds	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #128
	ldr	r3, [r3]
	add	r3, r3, r2
	str	r3, [r7, #44]
	ldr	r3, [r7, #76]
	adds	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #128
	ldr	r3, [r3]
	subs	r3, r2, r3
	str	r3, [r7, #40]
	ldr	r2, [r7, #68]
	ldr	r3, [r7, #44]
	add	r3, r3, r2
	str	r3, [r7, #36]
	ldr	r2, [r7, #68]
	ldr	r3, [r7, #44]
	subs	r3, r2, r3
	str	r3, [r7, #32]
	ldr	r2, [r7, #60]
	ldr	r3, [r7, #52]
	add	r3, r3, r2
	str	r3, [r7, #28]
	ldr	r2, [r7, #60]
	ldr	r3, [r7, #52]
	subs	r3, r2, r3
	str	r3, [r7, #24]
	ldr	r2, [r7, #36]
	ldr	r3, [r7, #28]
	add	r3, r3, r2
	adds	r3, r3, #2
	asrs	r2, r3, #2
	ldr	r3, [r7, #76]
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #128
	ldr	r1, [r7, #36]
	ldr	r2, [r7, #28]
	subs	r2, r1, r2
	adds	r2, r2, #2
	asrs	r2, r2, #2
	str	r2, [r3]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #32]
	add	r3, r3, r2
	movw	r2, #4433
	mul	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #76]
	adds	r3, r3, #64
	ldr	r2, [r7, #32]
	movw	r1, #6270
	mul	r1, r1, r2
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #192
	ldr	r2, [r7, #24]
	ldr	r1, .L13
	mul	r1, r1, r2
	ldr	r2, [r7, #20]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r2, [r7, #40]
	ldr	r3, [r7, #64]
	add	r3, r3, r2
	str	r3, [r7, #20]
	ldr	r2, [r7, #48]
	ldr	r3, [r7, #56]
	add	r3, r3, r2
	str	r3, [r7, #16]
	ldr	r2, [r7, #40]
	ldr	r3, [r7, #56]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #48]
	ldr	r3, [r7, #64]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	movw	r2, #9633
	mul	r3, r2, r3
	str	r3, [r7, #4]
	ldr	r3, [r7, #40]
	movw	r2, #2446
	mul	r3, r2, r3
	str	r3, [r7, #40]
	ldr	r3, [r7, #48]
	movw	r2, #16819
	mul	r3, r2, r3
	str	r3, [r7, #48]
	ldr	r3, [r7, #56]
	movw	r2, #25172
	mul	r3, r2, r3
	str	r3, [r7, #56]
	ldr	r3, [r7, #64]
	movw	r2, #12299
	mul	r3, r2, r3
	str	r3, [r7, #64]
	ldr	r3, [r7, #20]
	ldr	r2, .L13+4
	mul	r3, r2, r3
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	ldr	r2, .L13+8
	mul	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, .L13+12
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #8]
	ldr	r2, .L13+16
	mul	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #76]
	adds	r3, r3, #224
	ldr	r1, [r7, #40]
	ldr	r2, [r7, #20]
	add	r1, r1, r2
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #160
	ldr	r1, [r7, #48]
	ldr	r2, [r7, #16]
	add	r1, r1, r2
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #96
	ldr	r1, [r7, #56]
	ldr	r2, [r7, #16]
	add	r1, r1, r2
	ldr	r2, [r7, #12]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #32
	ldr	r1, [r7, #64]
	ldr	r2, [r7, #20]
	add	r1, r1, r2
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	add	r2, r2, #16384
	asrs	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [r7, #76]
	adds	r3, r3, #4
	str	r3, [r7, #76]
	ldr	r3, [r7, #72]
	subs	r3, r3, #1
	str	r3, [r7, #72]
.L9:
	ldr	r3, [r7, #72]
	cmp	r3, #0
	bge	.L10
	nop
	adds	r7, r7, #80
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	-15137
	.word	-7373
	.word	-20995
	.word	-16069
	.word	-3196
	.size	jpeg_fdct_islow, .-jpeg_fdct_islow
	.section	.text.initialise_benchmark,"ax",%progbits
	.align	1
	.global	initialise_benchmark
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	initialise_benchmark, %function
initialise_benchmark:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #1
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L16
.L17:
	ldr	r2, [r7]
	mov	r3, r2
	lsls	r3, r3, #5
	add	r3, r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #81
	str	r3, [r7]
	ldr	r1, .L18
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L16:
	ldr	r3, [r7, #4]
	cmp	r3, #63
	ble	.L17
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	data
	.size	initialise_benchmark, .-initialise_benchmark
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
	bl	initialise_benchmark
	bl	jpeg_fdct_islow
	movs	r0, #1
	bl	SECURE_record_output_data
	nop
	pop	{r7, pc}
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
