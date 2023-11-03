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
	.type	sensor, %object
	.size	sensor, 1
sensor:
	.byte	34
	.comm	ult_reading,4,4
	.section	.text.delay,"ax",%progbits
	.align	1
	.global	delay
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	delay, %function
delay:
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
	.size	delay, .-delay
	.section	.text.pulseIn,"ax",%progbits
	.align	1
	.global	pulseIn
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	pulseIn, %function
pulseIn:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
.L4:
	ldr	r3, .L6
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #1000
	ble	.L4
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #246
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #4]
	mov	r5, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	sensor
	.size	pulseIn, .-pulseIn
	.section	.text.getUltrasonicReading,"ax",%progbits
	.align	1
	.global	getUltrasonicReading
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	getUltrasonicReading, %function
getUltrasonicReading:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, .L10
	strb	r2, [r3]
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	bic	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, .L10
	strb	r2, [r3]
	movs	r5, #2
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, .L10
	strb	r2, [r3]
	movs	r5, #5
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	bic	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, .L10
	strb	r2, [r3]
	ldr	r3, .L10
	ldrb	r3, [r3]	@ zero_extendqisi2
	bic	r3, r3, #2
	uxtb	r2, r3
	ldr	r3, .L10
	strb	r2, [r3]
	bl	pulseIn
	bl	SECURE_new_log_entry
	mov	r3, r5
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r5, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	sensor
	.size	getUltrasonicReading, .-getUltrasonicReading
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
	movs	r3, #0
	str	r3, [r7]
.L13:
	bl	getUltrasonicReading
	bl	SECURE_new_log_entry
	mov	r3, r5
	ldr	r2, .L14
	smull	r1, r2, r2, r3
	asrs	r2, r2, #4
	asrs	r3, r3, #31
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #49
	ble	.L13
	mov	r0, r3
	bl	SECURE_new_log_entry_ctr
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r5, [r7, #4]
	bl	SECURE_record_output_data
	bl	SECURE_new_log_entry
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1374389535
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
