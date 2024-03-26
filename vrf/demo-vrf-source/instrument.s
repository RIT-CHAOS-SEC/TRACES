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
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L3:
	bl	SECURE_log_cond_br_taken
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L3
	bl	SECURE_log_cond_br_not_taken
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	delay, .-delay
	.global	counter
	.section	.bss.counter,"aw",%nobits
	.type	counter, %object
	.size	counter, 1
counter:
	.space	1
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
	ldr	r3, .L11
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r0, #250
	bl	delay
	ldr	r3, .L11
	mov	r2, #256
	str	r2, [r3, #24]
	movs	r0, #20
	bl	delay
	ldr	r3, .L11
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r0, #40
	bl	delay
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	b	.L5
.L8:
	bl	SECURE_log_cond_br_taken
	ldr	r3, .L11
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #8
	and	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L11+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L11+4
	strb	r2, [r3]
	ldr	r3, [r7]
	cmp	r3, #3
	ble	BT1
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7]
	and	r3, r3, #1
	cmp	r3, #0
	bne	BT1
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	asrs	r3, r3, #3
	ldr	r2, [r7, #4]
	asrs	r2, r2, #3
	ldr	r1, .L11+8
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	lsls	r2, r2, #1
	uxtb	r1, r2
	ldr	r2, .L11+8
	strb	r1, [r2, r3]
	ldr	r3, .L11+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #6
	bls	BT0
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	asrs	r3, r3, #3
	ldr	r2, [r7, #4]
	asrs	r2, r2, #3
	ldr	r1, .L11+8
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	orr	r2, r2, #1
	uxtb	r1, r2
	ldr	r2, .L11+8
	strb	r1, [r2, r3]
	b	.L7
BT0:
	bl	SECURE_log_cond_br_taken
.L7:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L6
BT1:
	bl	SECURE_log_cond_br_taken
.L6:
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L5:
	ldr	r3, [r7]
	cmp	r3, #82
	ble	.L8
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	cmp	r3, #39
	ble	BT2
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L11+8
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L11+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L11+8
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L11+8
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L11+8
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r3, r3, r2
	uxtb	r3, r3
	cmp	r1, r3
	bne	BT2
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L11+12
	movs	r2, #1
	strb	r2, [r3]
	b	.L10
BT2:
	bl	SECURE_log_cond_br_taken
.L9:
	ldr	r3, .L11+12
	movs	r2, #0
	strb	r2, [r3]
.L10:
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L12:
	.align	2
.L11:
	.word	1107427328
	.word	counter
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
	bl	read_data
	ldr	r3, .L15
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L15
	ldrb	r3, [r3, #3]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldrsh	r3, [r7, #6]
	orrs	r3, r3, r2
	sxth	r3, r3
	strh	r3, [r7, #6]	@ movhi
	ldrh	r3, [r7, #6]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L16:
	.align	2
.L15:
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
	bl	read_data
	ldr	r3, .L19
	ldrb	r3, [r3]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L19
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	sxth	r2, r3
	ldrsh	r3, [r7, #6]
	orrs	r3, r3, r2
	sxth	r3, r3
	strh	r3, [r7, #6]	@ movhi
	ldrh	r3, [r7, #6]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L20:
	.align	2
.L19:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	bl	get_temperature
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L22
	str	r2, [r3]
	pop	{r7, lr}
	b	SECURE_log_ret
.L23:
	.align	2
.L22:
	.word	temp
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
