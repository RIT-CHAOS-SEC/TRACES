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
	.comm	dist,100,4
	.comm	visited,100,4
	.comm	graph,10000,4
	.global	n
	.section	.data.n,"aw",%progbits
	.type	n, %object
	.size	n, 1
n:
	.byte	16
	.section	.text.my_memset,"ax",%progbits
	.align	1
	.global	my_memset
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	my_memset, %function
my_memset:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r5, [r7, #4]
	mov	r0, #240
	bl	SECURE_new_log_entry_offset
	mov	r3, r1
	strb	r3, [r7, #3]
	mov	r3, r2
	strb	r3, [r7, #2]
	movs	r3, #0
	str	r3, [r7, #12]
.L2:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	movs	r2, #255
	strb	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bhi	.L2
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	my_memset, .-my_memset
	.section	.text.dijkstra,"ax",%progbits
	.align	1
	.global	dijkstra
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	dijkstra, %function
dijkstra:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	mov	r3, r5
	mov	r2, r1
	strb	r3, [r7, #7]
	mov	r3, r2
	strb	r3, [r7, #6]
	movs	r2, #100
	movs	r1, #255
	ldr	r5, .L13
	bl	my_memset
	bl	SECURE_new_log_entry
	movs	r2, #100
	movs	r1, #0
	ldr	r5, .L13+4
	bl	my_memset
	bl	SECURE_new_log_entry
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	ldr	r2, .L13
	movs	r1, #0
	strb	r1, [r2, r3]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L4
.L11:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r3, #255
	strb	r3, [r7, #19]
	movs	r3, #0
	strb	r3, [r7, #18]
	b	.L5
.L7:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #18]	@ zero_extendqisi2
	ldr	r2, .L13+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L6
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #18]	@ zero_extendqisi2
	ldr	r2, .L13
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	ldrb	r3, [r7, #19]	@ zero_extendqisi2
	ldr	r1, .L13
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L6
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #18]
	strb	r3, [r7, #19]
.L6:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #18]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #18]
.L5:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L13+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [r7, #18]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L7
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #19]	@ zero_extendqisi2
	ldr	r2, .L13+4
	movs	r1, #1
	strb	r1, [r2, r3]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L8
.L10:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #19]	@ zero_extendqisi2
	ldr	r2, .L13
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	ldrb	r3, [r7, #19]	@ zero_extendqisi2
	ldr	r1, .L13+12
	movs	r5, #100
	mul	r3, r5, r3
	add	r1, r1, r3
	ldr	r3, [r7, #12]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, r2
	strb	r3, [r7, #11]
	ldr	r2, .L13
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L9
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r2, .L13
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldrb	r2, [r7, #11]
	strb	r2, [r3]
.L9:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L8:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L13+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bhi	.L10
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L4:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L13+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bhi	.L11
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	ldr	r2, .L13
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r5, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	dist
	.word	visited
	.word	n
	.word	graph
	.size	dijkstra, .-dijkstra
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #12]
.L17:
	movs	r3, #0
	str	r3, [r7, #8]
.L16:
	ldr	r3, [r7, #8]
	uxtb	r3, r3
	and	r3, r3, #3
	uxtb	r5, r3
	ldr	r2, .L18
	ldr	r3, [r7, #8]
	movs	r1, #100
	mul	r3, r1, r3
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	mov	r2, r5
	strb	r2, [r3]
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	cmp	r3, #99
	bls	.L16
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #99
	bls	.L17
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #2
	strb	r3, [r7, #7]
	movs	r3, #5
	strb	r3, [r7, #6]
	ldrb	r2, [r7, #6]	@ zero_extendqisi2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r1, r2
	mov	r5, r3
	bl	dijkstra
	bl	SECURE_new_log_entry
	mov	r3, r5
	strb	r3, [r7, #5]
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	mov	r5, r3
	bl	SECURE_record_output_data
	bl	SECURE_new_log_entry
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	graph
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
