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
	.global	input
	.section	.data.input,"aw",%progbits
	.align	2
	.type	input, %object
	.size	input, 13
input:
	.byte	97
	.byte	0
	.byte	1
	.byte	117
	.byte	0
	.byte	16
	.byte	116
	.byte	0
	.byte	2
	.byte	104
	.byte	0
	.byte	2
	.byte	58
	.global	data
	.section	.bss.data,"aw",%nobits
	.align	2
	.type	data, %object
	.size	data, 16
data:
	.space	16
	.global	temp_data
	.section	.bss.temp_data,"aw",%nobits
	.align	2
	.type	temp_data, %object
	.size	temp_data, 5
temp_data:
	.space	5
	.global	valid_reading
	.section	.bss.valid_reading,"aw",%nobits
	.type	valid_reading, %object
	.size	valid_reading, 1
valid_reading:
	.space	1
	.comm	ult_runs,4,4
	.comm	temp_runs,4,4
	.comm	hum_runs,4,4
	.comm	seq_runs,4,4
	.comm	runs,4,4
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
	str	r0, [r7, #4]
	ldr	r3, .L4
	ldr	r3, [r3]
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	str	r3, [r7, #12]
	b	.L2
.L3:
	bl	SECURE_log_cond_br
	ldr	r3, .L4
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L2:
	ldr	r3, .L4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r2, r2, r3
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L3
	bl	SECURE_log_cond_br
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L5:
	.align	2
.L4:
	.word	uwTick
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
	movs	r3, #0
	strb	r3, [r7, #7]
	movs	r3, #0
	strh	r3, [r7, #4]	@ movhi
	ldr	r3, .L13
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r0, #250
	bl	delay
	ldr	r3, .L13
	mov	r2, #256
	str	r2, [r3, #24]
	movs	r0, #20
	bl	delay
	ldr	r3, .L13
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r0, #40
	bl	delay
	movs	r3, #0
	strh	r3, [r7, #2]	@ movhi
	b	.L7
.L10:
	bl	SECURE_log_cond_br
	ldr	r3, .L13
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #8
	and	r3, r3, #1
	uxtb	r2, r3
	ldrb	r3, [r7, #7]
	add	r3, r3, r2
	strb	r3, [r7, #7]
	ldrh	r3, [r7, #2]
	cmp	r3, #3
	bls	.L8
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #2]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L8
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r1, r3
	ldr	r3, .L13+4
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	lsls	r3, r3, #1
	uxtb	r1, r3
	ldr	r3, .L13+4
	strb	r1, [r3, r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #6
	bls	.L9
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r1, r3
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L13+8
	ldr	r3, [r3, r2, lsl #2]
	orr	r3, r3, #1
	ldr	r2, .L13+8
	str	r3, [r2, r1, lsl #2]
.L9:
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #4]
	adds	r3, r3, #1
	strh	r3, [r7, #4]	@ movhi
.L8:
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #2]
	adds	r3, r3, #1
	strh	r3, [r7, #2]	@ movhi
.L7:
	ldrh	r3, [r7, #2]
	cmp	r3, #82
	bls	.L10
	bl	SECURE_log_cond_br
	ldrh	r3, [r7, #4]
	cmp	r3, #39
	bls	.L11
	bl	SECURE_log_cond_br
	ldr	r3, .L13+4
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L13+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L13+4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L13+4
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L13+4
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r3, r3, r2
	uxtb	r3, r3
	cmp	r1, r3
	bne	.L11
	bl	SECURE_log_cond_br
	ldr	r3, .L13+12
	movs	r2, #1
	strb	r2, [r3]
	b	.L12
.L11:
	bl	SECURE_log_cond_br
	ldr	r3, .L13+12
	movs	r2, #0
	strb	r2, [r3]
.L12:
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L14:
	.align	2
.L13:
	.word	1107427328
	.word	temp_data
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
	ldr	r3, .L17
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L17
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
.L18:
	.align	2
.L17:
	.word	temp_data
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
	ldr	r3, .L21
	ldrb	r3, [r3]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L21
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
.L22:
	.align	2
.L21:
	.word	temp_data
	.size	get_humidity, .-get_humidity
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
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
.L24:
	bl	SECURE_log_cond_br
	ldr	r3, .L26
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #8
	and	r3, r3, #1
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #1000
	ble	.L24
	bl	SECURE_log_cond_br
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L27:
	.align	2
.L26:
	.word	1107427328
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
	ldr	r3, .L30
	mov	r2, #512
	str	r2, [r3, #24]
	movs	r0, #2
	bl	delay
	ldr	r3, .L30
	mov	r2, #512
	str	r2, [r3, #40]
	movs	r0, #5
	bl	delay
	ldr	r3, .L30
	mov	r2, #512
	str	r2, [r3, #24]
	bl	pulseIn
	mov	r3, r0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L31:
	.align	2
.L30:
	.word	1107427328
	.size	getUltrasonicReading, .-getUltrasonicReading
	.section	.text.run_ultrasonic,"ax",%progbits
	.align	1
	.global	run_ultrasonic
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	run_ultrasonic, %function
run_ultrasonic:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L33
.L34:
	bl	SECURE_log_cond_br
	bl	getUltrasonicReading
	mov	r2, r0
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L33:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L34
	bl	SECURE_log_cond_br
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	run_ultrasonic, .-run_ultrasonic
	.section	.text.run_temperature,"ax",%progbits
	.align	1
	.global	run_temperature
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	run_temperature, %function
run_temperature:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L37
.L38:
	bl	SECURE_log_cond_br
	bl	get_temperature
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L37:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L38
	bl	SECURE_log_cond_br
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	run_temperature, .-run_temperature
	.section	.text.run_humidity,"ax",%progbits
	.align	1
	.global	run_humidity
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	run_humidity, %function
run_humidity:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L41
.L42:
	bl	SECURE_log_cond_br
	bl	get_humidity
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L41:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L42
	bl	SECURE_log_cond_br
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	run_humidity, .-run_humidity
	.comm	send_data,4,4
	.section	.text.read_command,"ax",%progbits
	.align	1
	.global	read_command
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	read_command, %function
read_command:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	b	.L45
.L46:
	bl	SECURE_log_cond_br
	ldr	r3, [r7]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	SECURE_record_output_data
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	SECURE_record_output_data
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L45:
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #58
	bne	.L46
	bl	SECURE_log_cond_br
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	read_command, .-read_command
	.comm	cmd,1,1
	.section	.rodata
	.align	2
.LC0:
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.byte	97
	.section	.text.process_command,"ax",%progbits
	.align	1
	.global	process_command
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	process_command, %function
process_command:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	ldr	r3, .L54
	mov	r4, r7
	ldm	r3, {r0, r1, r2, r3}
	stm	r4, {r0, r1, r2, r3}
	mov	r3, r7
	ldr	r1, .L54+4
	mov	r0, r3
	bl	read_command
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #116
	beq	.L49
	bl	SECURE_log_cond_br
	cmp	r3, #117
	beq	.L50
	bl	SECURE_log_cond_br
	cmp	r3, #97
	beq	.L51
	bl	SECURE_log_cond_br
	b	.L53
.L50:
	bl	SECURE_log_cond_br
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+8
	str	r3, [r2]
	b	.L52
.L49:
	bl	SECURE_log_cond_br
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+12
	str	r3, [r2]
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+16
	str	r3, [r2]
	b	.L52
.L51:
	bl	SECURE_log_cond_br
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+20
	str	r3, [r2]
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+8
	str	r3, [r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #8]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+12
	str	r3, [r2]
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L54+16
	str	r3, [r2]
.L53:
.L52:
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r0, r3
	bl	SECURE_record_output_data
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldr	r3, .L54+24
	strb	r2, [r3]
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, lr}
	b	SECURE_log_ret
.L55:
	.align	2
.L54:
	.word	.LC0
	.word	input
	.word	ult_runs
	.word	temp_runs
	.word	hum_runs
	.word	seq_runs
	.word	cmd
	.size	process_command, .-process_command
	.comm	sensor_action,4,4
	.section	.text.record_output_data,"ax",%progbits
	.align	1
	.global	record_output_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	record_output_data, %function
record_output_data:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]
	mvns	r3, r3
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	record_output_data, .-record_output_data
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
	bl	process_command
	ldr	r3, .L64
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #116
	beq	.L60
	bl	SECURE_log_cond_br
	cmp	r3, #117
	beq	.L61
	bl	SECURE_log_cond_br
	cmp	r3, #97
	beq	.L62
	bl	SECURE_log_cond_br
	b	.L63
.L61:
	bl	SECURE_log_cond_br
	movs	r0, #117
	bl	record_output_data
	mov	r2, r0
	ldr	r3, .L64+4
	str	r2, [r3]
	ldr	r3, .L64+8
	ldr	r2, .L64+12
	str	r2, [r3]
	ldr	r3, .L64+16
	ldr	r3, [r3]
	ldr	r2, .L64+4
	str	r3, [r2]
	b	.L63
.L60:
	bl	SECURE_log_cond_br
	movs	r0, #116
	bl	record_output_data
	mov	r2, r0
	ldr	r3, .L64+4
	str	r2, [r3]
	ldr	r3, .L64+8
	ldr	r2, .L64+20
	str	r2, [r3]
	ldr	r3, .L64+24
	ldr	r3, [r3]
	ldr	r2, .L64+4
	str	r3, [r2]
	b	.L63
.L62:
	bl	SECURE_log_cond_br
	movs	r0, #97
	bl	record_output_data
	mov	r2, r0
	ldr	r3, .L64+4
	str	r2, [r3]
	ldr	r3, .L64+8
	ldr	r2, .L64+28
	str	r2, [r3]
	ldr	r3, .L64+32
	ldr	r3, [r3]
	ldr	r2, .L64+4
	str	r3, [r2]
.L63:
	ldr	r3, .L64+8
	ldr	r3, [r3]
	ldr	r2, .L64+4
	ldr	r2, [r2]
	uxtb	r2, r2
	mov	r0, r2
	mov	r10, r3
	bl	SECURE_log_call
	pop	{r7, lr}
	b	SECURE_log_ret
.L65:
	.align	2
.L64:
	.word	cmd
	.word	runs
	.word	sensor_action
	.word	run_ultrasonic
	.word	ult_runs
	.word	run_temperature
	.word	temp_runs
	.word	run_humidity
	.word	hum_runs
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
