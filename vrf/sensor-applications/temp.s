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
	.comm	temp,4,4
	.comm	humidity,4,4
	.global	data
	.section	.bss.data,"aw",%nobits
	.align	2
	.type	data, %object
	.size	data, 5
data:
	.space	5
	.global	valid_reading
	.section	.bss.valid_reading,"aw",%nobits
	.type	valid_reading, %object
	.size	valid_reading, 1
valid_reading:
	.space	1
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
	bcc	.L2
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
	.section	.text.read_data,"ax",%progbits
	.align	1
	.global	read_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	read_data, %function
read_data:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	strb	r3, [r7, #7]
	movs	r3, #0
	strh	r3, [r7, #4]	@ movhi
	ldr	r3, .L10
	ldrh	r3, [r3]
	orr	r3, r3, #2
	uxth	r2, r3
	ldr	r3, .L10
	strh	r2, [r3]	@ movhi
	movs	r5, #250
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L10
	ldrh	r3, [r3]
	bic	r3, r3, #2
	uxth	r2, r3
	ldr	r3, .L10
	strh	r2, [r3]	@ movhi
	movs	r5, #20
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L10
	ldrh	r3, [r3]
	bic	r3, r3, #2
	uxth	r2, r3
	ldr	r3, .L10
	strh	r2, [r3]	@ movhi
	movs	r5, #40
	bl	delay
	bl	SECURE_new_log_entry
	movs	r3, #0
	strh	r3, [r7, #2]	@ movhi
	b	.L4
.L7:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L10
	ldrh	r3, [r3]
	uxtb	r3, r3
	and	r3, r3, #2
	uxtb	r2, r3
	ldrb	r3, [r7, #7]
	add	r3, r3, r2
	strb	r3, [r7, #7]
	ldrh	r3, [r7, #2]
	cmp	r3, #3
	bls	.L5
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L5
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r1, r3
	ldr	r3, .L10+4
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	lsls	r3, r3, #1
	uxtb	r1, r3
	ldr	r3, .L10+4
	strb	r1, [r3, r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #6
	bls	.L6
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r1, r3
	ldr	r3, .L10+4
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	orr	r3, r3, #1
	uxtb	r1, r3
	ldr	r3, .L10+4
	strb	r1, [r3, r2]
.L6:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	adds	r3, r3, #1
	strh	r3, [r7, #4]	@ movhi
.L5:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	adds	r3, r3, #1
	strh	r3, [r7, #2]	@ movhi
.L4:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	cmp	r3, #82
	bls	.L7
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	cmp	r3, #39
	bls	.L8
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L10+4
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L10+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L10+4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L10+4
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L10+4
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r3, r3, r2
	uxtb	r3, r3
	cmp	r1, r3
	bne	.L8
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L10+8
	movs	r2, #1
	strb	r2, [r3]
	b	.L9
.L8:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L10+8
	movs	r2, #0
	strb	r2, [r3]
.L9:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	sensor
	.word	data
	.word	valid_reading
	.size	read_data, .-read_data
	.section	.text.get_temperature,"ax",%progbits
	.align	1
	.global	get_temperature
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	get_temperature, %function
get_temperature:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	bl	read_data
	ldr	r3, .L14
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L14
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldrsh	r3, [r7, #6]
	orrs	r3, r3, r2
	sxth	r3, r3
	strh	r3, [r7, #6]	@ movhi
	ldrh	r3, [r7, #6]
	mov	r5, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	data
	.size	get_temperature, .-get_temperature
	.section	.text.get_humidity,"ax",%progbits
	.align	1
	.global	get_humidity
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	get_humidity, %function
get_humidity:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	bl	read_data
	ldr	r3, .L18
	ldrb	r3, [r3]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L18
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldrsh	r3, [r7, #6]
	orrs	r3, r3, r2
	sxth	r3, r3
	strh	r3, [r7, #6]	@ movhi
	ldrh	r3, [r7, #6]
	mov	r5, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	data
	.size	get_humidity, .-get_humidity
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
	bl	get_temperature
	mov	r3, r5
	lsrs	r3, r3, #1
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L21
	str	r2, [r3]
	bl	get_temperature
	bl	SECURE_new_log_entry
	mov	r3, r5
	lsrs	r3, r3, #1
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L21
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L21
	str	r3, [r2]
	bl	get_humidity
	bl	SECURE_new_log_entry
	mov	r3, r5
	lsrs	r3, r3, #1
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L21+4
	str	r2, [r3]
	bl	get_humidity
	bl	SECURE_new_log_entry
	mov	r3, r5
	lsrs	r3, r3, #1
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L21+4
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L21+4
	str	r3, [r2]
	ldr	r3, .L21
	ldr	r3, [r3]
	movs	r2, #32
	lsl	r2, r3, r2
	ldr	r3, .L21+4
	ldr	r3, [r3]
	orrs	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r5, [r7, #4]
	bl	SECURE_record_output_data
	bl	SECURE_new_log_entry
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
	.word	temp
	.word	humidity
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
