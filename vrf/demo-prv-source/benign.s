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
	.size	input, 4
input:
	.ascii	"u\000\020:"
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
	.section	.text.delay,"ax",%progbits
	.align	1
	.global	delay
	.arch armv8-m.main
	.arch_extension dsp
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
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [r7, #12]
	nop
.L2:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L3
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	cmp	r2, r3
	bcs	.L2
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	strb	r3, [r7, #7]
	movs	r3, #0
	strh	r3, [r7, #4]	@ movhi
	ldr	r3, .L12
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r5, #250
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L12
	mov	r2, #256
	str	r2, [r3, #24]
	movs	r5, #20
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L12
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r5, #40
	bl	delay
	bl	SECURE_new_log_entry
	movs	r3, #0
	strh	r3, [r7, #2]	@ movhi
	b	.L6
.L9:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L12
	ldr	r3, [r3, #16]
	lsrs	r3, r3, #8
	and	r3, r3, #1
	uxtb	r2, r3
	ldrb	r3, [r7, #7]
	add	r3, r3, r2
	strb	r3, [r7, #7]
	ldrh	r3, [r7, #2]
	cmp	r3, #3
	bls	.L7
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L7
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L12+4
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldrh	r2, [r7, #4]
	lsrs	r2, r2, #3
	uxth	r2, r2
	lsls	r3, r3, #1
	uxtb	r1, r3
	ldr	r3, .L12+4
	strb	r1, [r3, r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #6
	bls	.L8
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	lsrs	r3, r3, #3
	uxth	r3, r3
	mov	r2, r3
	ldr	r3, .L12+8
	ldr	r3, [r3, r2, lsl #2]
	ldrh	r2, [r7, #4]
	lsrs	r2, r2, #3
	uxth	r2, r2
	mov	r1, r2
	orr	r3, r3, #1
	ldr	r2, .L12+8
	str	r3, [r2, r1, lsl #2]
.L8:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	adds	r3, r3, #1
	strh	r3, [r7, #4]	@ movhi
.L7:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	adds	r3, r3, #1
	strh	r3, [r7, #2]	@ movhi
.L6:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #2]
	cmp	r3, #82
	bls	.L9
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrh	r3, [r7, #4]
	cmp	r3, #39
	bls	.L10
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L12+4
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r3, .L12+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L12+4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L12+4
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	add	r3, r3, r2
	ldr	r2, .L12+4
	ldrb	r2, [r2, #3]	@ zero_extendqisi2
	add	r3, r3, r2
	uxtb	r3, r3
	cmp	r1, r3
	bne	.L10
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L12+12
	movs	r2, #1
	strb	r2, [r3]
	b	.L11
.L10:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L12+12
	movs	r2, #0
	strb	r2, [r3]
	nop
.L11:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	bl	read_data
	ldr	r3, .L16
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L16
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
.L17:
	.align	2
.L16:
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	bl	read_data
	ldr	r3, .L20
	ldrb	r3, [r3]	@ zero_extendqisi2
	strh	r3, [r7, #6]	@ movhi
	ldr	r3, .L20
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
.L21:
	.align	2
.L20:
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
.L23:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L25
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
	ble	.L23
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #4]
	mov	r5, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L26:
	.align	2
.L25:
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L29
	mov	r2, #256
	str	r2, [r3, #24]
	movs	r5, #2
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L29
	mov	r2, #256
	str	r2, [r3, #40]
	movs	r5, #5
	bl	delay
	bl	SECURE_new_log_entry
	ldr	r3, .L29
	mov	r2, #256
	str	r2, [r3, #24]
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
.L30:
	.align	2
.L29:
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
	str	r5, [r7, #4]
	mov	r0, #240
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L32
.L33:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	bl	getUltrasonicReading
	bl	SECURE_new_log_entry
	mov	r2, r5
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L32:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L33
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #8]
	mov	r5, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	str	r5, [r7, #4]
	mov	r0, #240
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L36
.L37:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	bl	get_temperature
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L36:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L37
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #8]
	mov	r5, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	str	r5, [r7, #4]
	mov	r0, #240
	bl	SECURE_new_log_entry_offset
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L40
.L41:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	bl	get_humidity
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, [r7, #4]
	sdiv	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L40:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L41
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7, #8]
	mov	r5, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	str	r5, [r7, #4]
	str	r1, [r7]
	mov	r0, #238
	bl	SECURE_new_log_entry_offset
	b	.L44
.L45:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldr	r3, [r7]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r5, r3
	bl	SECURE_record_output_data
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r5, r3
	bl	SECURE_record_output_data
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L44:
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #58
	bne	.L45
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	read_command, .-read_command
	.comm	cmd,1,1
	.section	.rodata
	.align	2
.LC0:
	.ascii	"aaaaaaaaaaaaaaaa"
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
	mov	r0, #242
	bl	SECURE_new_log_entry_offset
	ldr	r3, .L53
	mov	r4, r7
	ldm	r3, {r5, r1, r2, r3}
	stm	r4, {r5, r1, r2, r3}
	mov	r3, r7
	ldr	r1, .L53+4
	mov	r5, r3
	bl	read_command
	bl	SECURE_new_log_entry
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #117
	beq	.L47
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #117
	bgt	.L52
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #97
	beq	.L49
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #116
	beq	.L50
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	b	.L52
.L47:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+8
	str	r3, [r2]
	b	.L51
.L50:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+12
	str	r3, [r2]
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+16
	str	r3, [r2]
	b	.L51
.L49:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+20
	str	r3, [r2]
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #5]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+8
	str	r3, [r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #8]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+12
	str	r3, [r2]
	ldrb	r3, [r7, #10]	@ zero_extendqisi2
	lsls	r3, r3, #8
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	orrs	r3, r3, r2
	ldr	r2, .L53+16
	str	r3, [r2]
.L52:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
.L51:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	ldrb	r3, [r7]	@ zero_extendqisi2
	mov	r5, r3
	bl	SECURE_record_output_data
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldr	r3, .L53+24
	strb	r2, [r3]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L54:
	.align	2
.L53:
	.word	.LC0
	.word	input
	.word	ult_runs
	.word	temp_runs
	.word	hum_runs
	.word	seq_runs
	.word	cmd
	.size	process_command, .-process_command
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
	mov	r0, #244
	bl	SECURE_new_log_entry_offset
	bl	process_command
	bl	SECURE_new_log_entry
	ldr	r3, .L62
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #117
	beq	.L56
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #117
	bgt	.L61
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #97
	beq	.L58
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	cmp	r3, #116
	beq	.L59
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	b	.L61
.L56:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r5, #117
	bl	SECURE_record_output_data
	ldr	r3, .L62+4
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_ultrasonic
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3]
	b	.L60
.L59:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r5, #116
	bl	SECURE_record_output_data
	ldr	r3, .L62+12
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_temperature
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3, #4]
	ldr	r3, .L62+16
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_humidity
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3, #8]
	b	.L60
.L58:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	movs	r5, #97
	bl	SECURE_record_output_data
	ldr	r3, .L62+4
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_ultrasonic
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3]
	ldr	r3, .L62+12
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_temperature
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3, #4]
	ldr	r3, .L62+16
	ldr	r3, [r3]
	mov	r5, r3
	bl	run_humidity
	bl	SECURE_new_log_entry
	mov	r3, r5
	mov	r2, r3
	ldr	r3, .L62+8
	str	r2, [r3, #8]
	b	.L60
.L61:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
.L60:
	mov	r0, #248
	bl	SECURE_new_log_entry_offset
	nop
	pop	{r7, pc}
.L63:
	.align	2
.L62:
	.word	cmd
	.word	ult_runs
	.word	data
	.word	temp_runs
	.word	hum_runs
	.size	application, .-application
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
