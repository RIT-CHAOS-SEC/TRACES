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
	.global	sensor
	.section	.data.sensor,"aw",%progbits
	.align	1
	.type	sensor, %object
	.size	sensor, 2
sensor:
	.short	165
	.comm	steps,4,4
	.section	.text.delayMicroseconds,"ax",%progbits
	.align	1
	.global	delayMicroseconds
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	delayMicroseconds, %function
delayMicroseconds:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r5, [r7, #4]
	mov	r0, #240
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bls	.L2
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	delayMicroseconds, .-delayMicroseconds
	.section	.text.getserialinput,"ax",%progbits
	.align	1
	.global	getserialinput
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	getserialinput, %function
getserialinput:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	mov	r3, r5
	strb	r3, [r7, #7]
	movs	r3, #2
	strb	r3, [r7, #15]
	movw	r3, #2603
	strh	r3, [r7, #12]	@ movhi
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L4
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	add	r2, r7, #16
	add	r3, r3, r2
	ldrb	r3, [r3, #-4]	@ zero_extendqisi2
	b	.L6
.L4:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
.L6:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	mov	r5, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	getserialinput, .-getserialinput
	.section	.text.run_syringe,"ax",%progbits
	.align	1
	.global	run_syringe
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	run_syringe, %function
run_syringe:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #255
	strb	r3, [r7, #11]
	movs	r3, #0
	strh	r3, [r7, #38]	@ movhi
	movs	r3, #5
	strh	r3, [r7, #18]	@ movhi
	movs	r3, #8
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #32]
	movs	r3, #0
	str	r3, [r7, #28]
	ldr	r3, .L20
	movs	r2, #0
	str	r2, [r3]
	b	.L8
.L18:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #11]
	uxtb	r3, r3
	adds	r3, r3, #1
	uxtb	r3, r3
	mov	r2, r3
	strb	r2, [r7, #11]
	mov	r5, r3
	bl	getserialinput
	bl	SECURE_new_log_entry
	mov	r3, r5
	strb	r3, [r7, #27]
	b	.L9
.L13:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #27]	@ zero_extendqisi2
	cmp	r3, #10
	beq	.L19
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #27]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L12
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r3, #10
	str	r3, [r7, #28]
	b	.L11
.L12:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #38]
	adds	r2, r3, #1
	strh	r2, [r7, #38]	@ movhi
	add	r2, r7, #40
	add	r3, r3, r2
	ldrb	r2, [r7, #27]
	strb	r2, [r3, #-40]
	ldrb	r3, [r7, #11]
	uxtb	r3, r3
	adds	r3, r3, #1
	uxtb	r3, r3
	mov	r2, r3
	strb	r2, [r7, #11]
	mov	r5, r3
	bl	getserialinput
	bl	SECURE_new_log_entry
	mov	r3, r5
	strb	r3, [r7, #27]
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L9:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #32]
	cmp	r3, #9
	ble	.L13
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	b	.L11
.L19:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
.L11:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #38]
	adds	r2, r3, #1
	strh	r2, [r7, #38]	@ movhi
	add	r2, r7, #40
	add	r3, r3, r2
	movs	r2, #0
	strb	r2, [r3, #-40]
	ldrh	r3, [r7, #18]
	ldr	r2, [r7, #12]
	mul	r3, r2, r3
	ldr	r2, .L20
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L14
.L17:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #43
	beq	.L15
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #45
	bne	.L16
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
.L15:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L20+4
	movs	r2, #255
	strh	r2, [r3]	@ movhi
	movs	r5, #100
	bl	delayMicroseconds
	bl	SECURE_new_log_entry
.L16:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L20+4
	movs	r2, #0
	strh	r2, [r3]	@ movhi
	movs	r5, #100
	bl	delayMicroseconds
	bl	SECURE_new_log_entry
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L14:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L20
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L17
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r5, #100
	bl	delayMicroseconds
	bl	SECURE_new_log_entry
	movs	r3, #0
	strh	r3, [r7, #38]	@ movhi
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L8:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #28]
	cmp	r3, #0
	ble	.L18
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	steps
	.word	sensor
	.size	run_syringe, .-run_syringe
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L23
.L24:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	bl	run_syringe
	bl	SECURE_new_log_entry
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L23:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #4]
	cmp	r3, #2
	ble	.L24
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r5, #1
	bl	SECURE_record_output_data
	bl	SECURE_new_log_entry
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
