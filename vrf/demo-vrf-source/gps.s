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
	.section	.bss.GPS_INVALID_F_ANGLE,"aw",%nobits
	.align	2
	.type	GPS_INVALID_F_ANGLE, %object
	.size	GPS_INVALID_F_ANGLE, 4
GPS_INVALID_F_ANGLE:
	.space	4
	.section	.bss.GPS_INVALID_F_ALTITUDE,"aw",%nobits
	.align	2
	.type	GPS_INVALID_F_ALTITUDE, %object
	.size	GPS_INVALID_F_ALTITUDE, 4
GPS_INVALID_F_ALTITUDE:
	.space	4
	.section	.bss.GPS_INVALID_F_SPEED,"aw",%nobits
	.align	2
	.type	GPS_INVALID_F_SPEED, %object
	.size	GPS_INVALID_F_SPEED, 4
GPS_INVALID_F_SPEED:
	.space	4
	.global	encodedCharCount
	.section	.bss.encodedCharCount,"aw",%nobits
	.align	2
	.type	encodedCharCount, %object
	.size	encodedCharCount, 4
encodedCharCount:
	.space	4
	.global	parity
	.section	.bss.parity,"aw",%nobits
	.type	parity, %object
	.size	parity, 1
parity:
	.space	1
	.global	isChecksumTerm
	.section	.bss.isChecksumTerm,"aw",%nobits
	.align	2
	.type	isChecksumTerm, %object
	.size	isChecksumTerm, 4
isChecksumTerm:
	.space	4
	.global	curSentenceType
	.section	.data.curSentenceType,"aw",%progbits
	.type	curSentenceType, %object
	.size	curSentenceType, 1
curSentenceType:
	.byte	2
	.global	curTermNumber
	.section	.bss.curTermNumber,"aw",%nobits
	.type	curTermNumber, %object
	.size	curTermNumber, 1
curTermNumber:
	.space	1
	.global	curTermOffset
	.section	.bss.curTermOffset,"aw",%nobits
	.type	curTermOffset, %object
	.size	curTermOffset, 1
curTermOffset:
	.space	1
	.global	term
	.section	.bss.term,"aw",%nobits
	.align	2
	.type	term, %object
	.size	term, 15
term:
	.space	15
	.global	sentenceHasFix
	.section	.bss.sentenceHasFix,"aw",%nobits
	.align	2
	.type	sentenceHasFix, %object
	.size	sentenceHasFix, 4
sentenceHasFix:
	.space	4
	.global	passedChecksumCount
	.section	.bss.passedChecksumCount,"aw",%nobits
	.align	2
	.type	passedChecksumCount, %object
	.size	passedChecksumCount, 4
passedChecksumCount:
	.space	4
	.global	sentencesWithFixCount
	.section	.bss.sentencesWithFixCount,"aw",%nobits
	.align	2
	.type	sentencesWithFixCount, %object
	.size	sentencesWithFixCount, 4
sentencesWithFixCount:
	.space	4
	.global	failedChecksumCount
	.section	.bss.failedChecksumCount,"aw",%nobits
	.align	2
	.type	failedChecksumCount, %object
	.size	failedChecksumCount, 4
failedChecksumCount:
	.space	4
	.section	.text.mystrcmp,"ax",%progbits
	.align	1
	.global	mystrcmp
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	mystrcmp, %function
mystrcmp:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #1
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L2
.L5:
	bl	SECURE_log_cond_br_taken
	ldr	r3, [r7, #16]
	cmp	r3, #1
	bne	.L186
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	ldr	r1, [r7]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L186
	bl	SECURE_log_cond_br_not_taken
	movs	r3, #1
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L4
.L186:
	bl	SECURE_log_cond_br_taken
.L3:
	ldr	r3, [r7, #16]
	cmp	r3, #1
	bne	.L187
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [r7, #12]
	ldr	r1, [r7]
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bcs	.L187
	bl	SECURE_log_cond_br_not_taken
	movs	r3, #1
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L4
.L187:
	bl	SECURE_log_cond_br_taken
.L4:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #14
	ble	.L5
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #20]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	mystrcmp, .-mystrcmp
	.section	.text.isdigit,"ax",%progbits
	.align	1
	.global	isdigit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	isdigit, %function
isdigit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, r3, #48
	cmp	r3, #9
	ite	ls
	movls	r3, #1
	movhi	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	isdigit, .-isdigit
	.section	.text.fromHex,"ax",%progbits
	.align	1
	.global	fromHex
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	fromHex, %function
fromHex:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L188
	bl	SECURE_log_cond_br_not_taken
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L188
	bl	SECURE_log_cond_br_not_taken
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	subs	r3, r3, #55
	b	.L11
.L188:
	bl	SECURE_log_cond_br_taken
.L10:
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L189
	bl	SECURE_log_cond_br_not_taken
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L189
	bl	SECURE_log_cond_br_not_taken
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	subs	r3, r3, #87
	b	.L11
.L189:
	bl	SECURE_log_cond_br_taken
.L12:
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	subs	r3, r3, #48
.L11:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	fromHex, .-fromHex
	.global	validDate
	.section	.bss.validDate,"aw",%nobits
	.align	2
	.type	validDate, %object
	.size	validDate, 4
validDate:
	.space	4
	.global	upDate
	.section	.bss.upDate,"aw",%nobits
	.align	2
	.type	upDate, %object
	.size	upDate, 4
upDate:
	.space	4
	.global	dateValue
	.section	.bss.dateValue,"aw",%nobits
	.align	2
	.type	dateValue, %object
	.size	dateValue, 4
dateValue:
	.space	4
	.section	.text.date_commit,"ax",%progbits
	.align	1
	.global	date_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	date_commit, %function
date_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L14
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L14+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L15:
	.align	2
.L14:
	.word	validDate
	.word	upDate
	.size	date_commit, .-date_commit
	.global	timeVal
	.section	.bss.timeVal,"aw",%nobits
	.align	2
	.type	timeVal, %object
	.size	timeVal, 4
timeVal:
	.space	4
	.global	validTime
	.section	.bss.validTime,"aw",%nobits
	.align	2
	.type	validTime, %object
	.size	validTime, 4
validTime:
	.space	4
	.global	updateTime
	.section	.bss.updateTime,"aw",%nobits
	.align	2
	.type	updateTime, %object
	.size	updateTime, 4
updateTime:
	.space	4
	.section	.text.time_commit,"ax",%progbits
	.align	1
	.global	time_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	time_commit, %function
time_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L17
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L17+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L18:
	.align	2
.L17:
	.word	validTime
	.word	updateTime
	.size	time_commit, .-time_commit
	.global	lat
	.section	.bss.lat,"aw",%nobits
	.align	2
	.type	lat, %object
	.size	lat, 4
lat:
	.space	4
	.global	lng
	.section	.bss.lng,"aw",%nobits
	.align	2
	.type	lng, %object
	.size	lng, 4
lng:
	.space	4
	.global	rawNewLatDataNegative
	.section	.bss.rawNewLatDataNegative,"aw",%nobits
	.align	2
	.type	rawNewLatDataNegative, %object
	.size	rawNewLatDataNegative, 4
rawNewLatDataNegative:
	.space	4
	.global	rawNewLongDataNegative
	.section	.bss.rawNewLongDataNegative,"aw",%nobits
	.align	2
	.type	rawNewLongDataNegative, %object
	.size	rawNewLongDataNegative, 4
rawNewLongDataNegative:
	.space	4
	.global	validLoc
	.section	.bss.validLoc,"aw",%nobits
	.align	2
	.type	validLoc, %object
	.size	validLoc, 4
validLoc:
	.space	4
	.global	updateLoc
	.section	.bss.updateLoc,"aw",%nobits
	.align	2
	.type	updateLoc, %object
	.size	updateLoc, 4
updateLoc:
	.space	4
	.section	.text.location_commit,"ax",%progbits
	.align	1
	.global	location_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	location_commit, %function
location_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L20
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, .L20+4
	movs	r2, #0
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L21:
	.align	2
.L20:
	.word	validLoc
	.word	updateLoc
	.size	location_commit, .-location_commit
	.global	speedVal
	.section	.bss.speedVal,"aw",%nobits
	.align	2
	.type	speedVal, %object
	.size	speedVal, 4
speedVal:
	.space	4
	.global	validSpeed
	.section	.bss.validSpeed,"aw",%nobits
	.align	2
	.type	validSpeed, %object
	.size	validSpeed, 4
validSpeed:
	.space	4
	.global	updateSpeed
	.section	.bss.updateSpeed,"aw",%nobits
	.align	2
	.type	updateSpeed, %object
	.size	updateSpeed, 4
updateSpeed:
	.space	4
	.section	.text.speed_commit,"ax",%progbits
	.align	1
	.global	speed_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	speed_commit, %function
speed_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L23
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L23+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L24:
	.align	2
.L23:
	.word	validSpeed
	.word	updateSpeed
	.size	speed_commit, .-speed_commit
	.global	degrees
	.section	.bss.degrees,"aw",%nobits
	.align	2
	.type	degrees, %object
	.size	degrees, 4
degrees:
	.space	4
	.global	validDeg
	.section	.bss.validDeg,"aw",%nobits
	.align	2
	.type	validDeg, %object
	.size	validDeg, 4
validDeg:
	.space	4
	.global	updateDeg
	.section	.bss.updateDeg,"aw",%nobits
	.align	2
	.type	updateDeg, %object
	.size	updateDeg, 4
updateDeg:
	.space	4
	.section	.text.course_commit,"ax",%progbits
	.align	1
	.global	course_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	course_commit, %function
course_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L26
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L26+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L27:
	.align	2
.L26:
	.word	validDeg
	.word	updateDeg
	.size	course_commit, .-course_commit
	.global	height
	.section	.bss.height,"aw",%nobits
	.align	2
	.type	height, %object
	.size	height, 4
height:
	.space	4
	.global	validAlt
	.section	.bss.validAlt,"aw",%nobits
	.align	2
	.type	validAlt, %object
	.size	validAlt, 4
validAlt:
	.space	4
	.global	updateAlt
	.section	.bss.updateAlt,"aw",%nobits
	.align	2
	.type	updateAlt, %object
	.size	updateAlt, 4
updateAlt:
	.space	4
	.section	.text.altitude_commit,"ax",%progbits
	.align	1
	.global	altitude_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	altitude_commit, %function
altitude_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L29
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L29+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L30:
	.align	2
.L29:
	.word	validAlt
	.word	updateAlt
	.size	altitude_commit, .-altitude_commit
	.global	validSat
	.section	.bss.validSat,"aw",%nobits
	.align	2
	.type	validSat, %object
	.size	validSat, 4
validSat:
	.space	4
	.global	updateSat
	.section	.bss.updateSat,"aw",%nobits
	.align	2
	.type	updateSat, %object
	.size	updateSat, 4
updateSat:
	.space	4
	.global	satCount
	.section	.bss.satCount,"aw",%nobits
	.align	2
	.type	satCount, %object
	.size	satCount, 4
satCount:
	.space	4
	.section	.text.satellites_commit,"ax",%progbits
	.align	1
	.global	satellites_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	satellites_commit, %function
satellites_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L32
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L32+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L33:
	.align	2
.L32:
	.word	validSat
	.word	updateSat
	.size	satellites_commit, .-satellites_commit
	.global	hdopVal
	.section	.bss.hdopVal,"aw",%nobits
	.align	2
	.type	hdopVal, %object
	.size	hdopVal, 4
hdopVal:
	.space	4
	.global	validHDop
	.section	.bss.validHDop,"aw",%nobits
	.align	2
	.type	validHDop, %object
	.size	validHDop, 4
validHDop:
	.space	4
	.global	updateHDop
	.section	.bss.updateHDop,"aw",%nobits
	.align	2
	.type	updateHDop, %object
	.size	updateHDop, 4
updateHDop:
	.space	4
	.section	.text.hdop_commit,"ax",%progbits
	.align	1
	.global	hdop_commit
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	hdop_commit, %function
hdop_commit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L35
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L35+4
	movs	r2, #1
	str	r2, [r3]
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L36:
	.align	2
.L35:
	.word	validHDop
	.word	updateHDop
	.size	hdop_commit, .-hdop_commit
	.section	.text.parseDegrees,"ax",%progbits
	.align	1
	.global	parseDegrees
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	parseDegrees, %function
parseDegrees:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	atol
	mov	r3, r0
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, .L44
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	strh	r3, [r7, #10]	@ movhi
	ldr	r3, .L44+4
	str	r3, [r7, #20]
	ldrh	r3, [r7, #10]
	ldr	r2, [r7, #20]
	mul	r3, r2, r3
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	ldr	r2, .L44
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #5
	adr	r10, .L39
	mov	r11, #9
	bl	SECURE_log_loop_cond
	adr	r10, .L42
	mov	r11, #9
	bl	SECURE_log_loop_cond
	strh	r3, [r7, #8]	@ movhi
	b	.L38
.L39:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L38:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #9
	bls	.L39
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L190
	bl	SECURE_log_cond_br_not_taken
	b	.L41
.L42:
	ldr	r3, [r7, #20]
	ldr	r2, .L44+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #3
	str	r3, [r7, #20]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	mov	r2, r3
	ldr	r3, [r7, #20]
	mul	r3, r3, r2
	ldr	r2, [r7, #16]
	add	r3, r3, r2
	str	r3, [r7, #16]
.L41:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #9
	bls	.L42
	bl	SECURE_log_cond_br_not_taken
	b	.L40
.L190:
	bl	SECURE_log_cond_br_taken
.L40:
	ldrsh	r3, [r7, #8]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	ldr	r2, [r7, #16]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	adds	r3, r3, #1
	ldr	r2, .L44+12
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #1
	vmov	s15, r3	@ int
	vcvt.f32.u32	s13, s15
	vldr.32	s12, .L44+16
	vdiv.f32	s15, s13, s12
	vadd.f32	s15, s14, s15
	vcvt.s32.f32	s15, s15
	vstr.32	s15, [r7]	@ int
	ldrh	r3, [r7]	@ movhi
	strh	r3, [r7, #8]	@ movhi
	ldrsh	r3, [r7, #8]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vmov.f32	s0, s15
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L45:
	.align	2
.L44:
	.word	1374389535
	.word	10000000
	.word	-858993459
	.word	-1431655765
	.word	1315859240
	.size	parseDegrees, .-parseDegrees
	.section	.text.parseDecimal,"ax",%progbits
	.align	1
	.global	parseDecimal
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	parseDecimal, %function
parseDecimal:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #45
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L191
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L47
.L191:
	bl	SECURE_log_cond_br_taken
.L47:
	ldr	r0, [r7, #4]
	bl	atol
	mov	r2, r0
	adr	r10, .L49
	mov	r11, #9
	bl	SECURE_log_loop_cond
	movs	r3, #100
	mul	r3, r3, r2
	str	r3, [r7, #12]
	b	.L48
.L49:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L48:
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #9
	bls	.L49
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L192
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #9
	bhi	.L192
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r2, r3, #48
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	cmp	r3, #9
	bhi	.L192
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	adds	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	subs	r3, r3, #48
	ldr	r2, [r7, #12]
	add	r3, r3, r2
	str	r3, [r7, #12]
	b	.L50
.L192:
	bl	SECURE_log_cond_br_taken
.L50:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L193
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #12]
	negs	r3, r3
	b	.L53
.L193:
	bl	SECURE_log_cond_br_taken
.L51:
	ldr	r3, [r7, #12]
.L53:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	parseDecimal, .-parseDecimal
	.section	.text.time_setTime,"ax",%progbits
	.align	1
	.global	time_setTime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	time_setTime, %function
time_setTime:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDecimal
	mov	r2, r0
	ldr	r3, .L55
	str	r2, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L56:
	.align	2
.L55:
	.word	timeVal
	.size	time_setTime, .-time_setTime
	.section	.text.location_setLatitude,"ax",%progbits
	.align	1
	.global	location_setLatitude
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	location_setLatitude, %function
location_setLatitude:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDegrees
	vmov.f32	s15, s0
	ldr	r3, .L58
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L59:
	.align	2
.L58:
	.word	lat
	.size	location_setLatitude, .-location_setLatitude
	.section	.text.location_setLongitude,"ax",%progbits
	.align	1
	.global	location_setLongitude
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	location_setLongitude, %function
location_setLongitude:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDegrees
	vmov.f32	s15, s0
	ldr	r3, .L61
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L62:
	.align	2
.L61:
	.word	lng
	.size	location_setLongitude, .-location_setLongitude
	.section	.text.speed_set,"ax",%progbits
	.align	1
	.global	speed_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	speed_set, %function
speed_set:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDecimal
	vmov	s15, r0	@ int
	vcvt.f32.s32	s15, s15
	ldr	r3, .L64
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L65:
	.align	2
.L64:
	.word	speedVal
	.size	speed_set, .-speed_set
	.section	.text.course_set,"ax",%progbits
	.align	1
	.global	course_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	course_set, %function
course_set:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDecimal
	vmov	s15, r0	@ int
	vcvt.f32.s32	s15, s15
	ldr	r3, .L67
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L68:
	.align	2
.L67:
	.word	degrees
	.size	course_set, .-course_set
	.section	.text.satellites_set,"ax",%progbits
	.align	1
	.global	satellites_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	satellites_set, %function
satellites_set:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L70
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L70
	str	r3, [r2]
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L71:
	.align	2
.L70:
	.word	satCount
	.size	satellites_set, .-satellites_set
	.section	.text.date_setDate,"ax",%progbits
	.align	1
	.global	date_setDate
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	date_setDate, %function
date_setDate:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	atol
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L73
	str	r2, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L74:
	.align	2
.L73:
	.word	dateValue
	.size	date_setDate, .-date_setDate
	.section	.text.hdop_set,"ax",%progbits
	.align	1
	.global	hdop_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	hdop_set, %function
hdop_set:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDecimal
	vmov	s15, r0	@ int
	vcvt.f32.s32	s15, s15
	ldr	r3, .L76
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L77:
	.align	2
.L76:
	.word	hdopVal
	.size	hdop_set, .-hdop_set
	.section	.text.altitude_set,"ax",%progbits
	.align	1
	.global	altitude_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	altitude_set, %function
altitude_set:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	parseDecimal
	vmov	s15, r0	@ int
	vcvt.f32.s32	s15, s15
	ldr	r3, .L79
	vstr.32	s15, [r3]
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L80:
	.align	2
.L79:
	.word	height
	.size	altitude_set, .-altitude_set
	.section	.rodata
	.align	2
.LC0:
	.ascii	"GPRMC\000"
	.align	2
.LC1:
	.ascii	"GNRMC\000"
	.align	2
.LC2:
	.ascii	"GPGGA\000"
	.align	2
.LC3:
	.ascii	"GNGGA\000"
	.section	.text.endOfTermHandler,"ax",%progbits
	.align	1
	.global	endOfTermHandler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	endOfTermHandler, %function
endOfTermHandler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L125
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L200
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	fromHex
	mov	r3, r0
	uxtb	r3, r3
	lsls	r3, r3, #4
	uxtb	r4, r3
	ldr	r3, .L125+4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	mov	r0, r3
	bl	fromHex
	mov	r3, r0
	uxtb	r3, r3
	add	r3, r3, r4
	strb	r3, [r7, #7]
	ldr	r3, .L125+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L199
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+12
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L125+12
	str	r3, [r2]
	ldr	r3, .L125+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L194
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+20
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L125+20
	str	r3, [r2]
	b	.L84
.L194:
	bl	SECURE_log_cond_br_taken
.L84:
	ldr	r3, .L125+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L195
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #1
	bne	.L198
	bl	SECURE_log_cond_br_not_taken
	bl	date_commit
	bl	time_commit
	ldr	r3, .L125+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L197
	bl	SECURE_log_cond_br_not_taken
	bl	location_commit
	bl	speed_commit
	bl	course_commit
	b	.L123
.L195:
	bl	SECURE_log_cond_br_taken
.L86:
	bl	time_commit
	ldr	r3, .L125+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L196
	bl	SECURE_log_cond_br_not_taken
	bl	location_commit
	bl	altitude_commit
	b	.L89
.L196:
	bl	SECURE_log_cond_br_taken
.L89:
	bl	satellites_commit
	bl	hdop_commit
	b	.L85
.L197:
	bl	SECURE_log_cond_br_taken
.L123:
.L198:
	bl	SECURE_log_cond_br_taken
.L85:
	movs	r3, #1
	b	.L90
.L199:
	bl	SECURE_log_cond_br_taken
.L83:
	ldr	r3, .L125+28
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L125+28
	str	r3, [r2]
	b	.L82
.L200:
	bl	SECURE_log_cond_br_taken
.L82:
	ldr	r3, .L125+32
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L205
	bl	SECURE_log_cond_br_not_taken
	ldr	r1, .L125+36
	ldr	r0, .L125+4
	bl	mystrcmp
	mov	r3, r0
	cmp	r3, #0
	beq	.L201
	bl	SECURE_log_cond_br_not_taken
	ldr	r1, .L125+40
	ldr	r0, .L125+4
	bl	mystrcmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L202
	bl	SECURE_log_cond_br_not_taken
	b	.L92
.L201:
	bl	SECURE_log_cond_br_taken
.L92:
	ldr	r3, .L125+24
	movs	r2, #1
	strb	r2, [r3]
	b	.L91
.L202:
	bl	SECURE_log_cond_br_taken
.L93:
	ldr	r1, .L125+44
	ldr	r0, .L125+4
	bl	mystrcmp
	mov	r3, r0
	cmp	r3, #0
	beq	.L203
	bl	SECURE_log_cond_br_not_taken
	ldr	r1, .L125+48
	ldr	r0, .L125+4
	bl	mystrcmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L204
	bl	SECURE_log_cond_br_not_taken
	b	.L94
.L203:
	bl	SECURE_log_cond_br_taken
.L94:
	ldr	r3, .L125+24
	movs	r2, #0
	strb	r2, [r3]
	b	.L91
.L204:
	bl	SECURE_log_cond_br_taken
.L95:
	ldr	r3, .L125+24
	movs	r2, #2
	strb	r2, [r3]
	b	.L91
.L205:
	bl	SECURE_log_cond_br_taken
.L91:
	ldr	r3, .L125+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L229
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L229
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L217
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #1
	bne	.L229
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L125+32
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L212
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #5
	bgt	.L207
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #2
	beq	.L209
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #2
	bgt	.L206
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #1
	beq	.L208
	bl	SECURE_log_cond_br_not_taken
	b	.L96
.L206:
	bl	SECURE_log_cond_br_taken
.L103:
	cmp	r3, #3
	beq	.L210
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #4
	beq	.L211
	bl	SECURE_log_cond_br_not_taken
	b	.L96
.L207:
	bl	SECURE_log_cond_br_taken
.L101:
	cmp	r3, #7
	beq	.L214
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #7
	blt	.L213
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #8
	beq	.L215
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #9
	beq	.L216
	bl	SECURE_log_cond_br_not_taken
	b	.L96
.L208:
	bl	SECURE_log_cond_br_taken
.L104:
	ldr	r0, .L125+4
	bl	time_setTime
	b	.L99
.L209:
	bl	SECURE_log_cond_br_taken
.L102:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #65
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+16
	str	r2, [r3]
	b	.L99
.L210:
	bl	SECURE_log_cond_br_taken
.L105:
	ldr	r0, .L125+4
	bl	location_setLatitude
	b	.L99
.L211:
	bl	SECURE_log_cond_br_taken
.L106:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #83
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+52
	str	r2, [r3]
	b	.L99
.L212:
	bl	SECURE_log_cond_br_taken
.L100:
	ldr	r0, .L125+4
	bl	location_setLongitude
	b	.L99
.L213:
	bl	SECURE_log_cond_br_taken
.L108:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #87
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+56
	str	r2, [r3]
	b	.L99
.L214:
	bl	SECURE_log_cond_br_taken
.L107:
	ldr	r0, .L125+4
	bl	speed_set
	b	.L99
.L215:
	bl	SECURE_log_cond_br_taken
.L109:
	ldr	r0, .L125+4
	bl	course_set
	b	.L99
.L216:
	bl	SECURE_log_cond_br_taken
.L110:
	ldr	r0, .L125+4
	bl	date_setDate
.L99:
	b	.L96
.L217:
	bl	SECURE_log_cond_br_taken
.L97:
	ldr	r3, .L125+32
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L224
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #5
	bgt	.L219
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #2
	beq	.L221
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #2
	bgt	.L218
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #1
	beq	.L220
	bl	SECURE_log_cond_br_not_taken
	b	.L124
.L218:
	bl	SECURE_log_cond_br_taken
.L115:
	cmp	r3, #3
	beq	.L222
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #4
	beq	.L223
	bl	SECURE_log_cond_br_not_taken
	b	.L124
.L219:
	bl	SECURE_log_cond_br_taken
.L113:
	cmp	r3, #7
	beq	.L226
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #7
	blt	.L225
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #8
	beq	.L227
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #9
	beq	.L228
	bl	SECURE_log_cond_br_not_taken
	b	.L124
.L220:
	bl	SECURE_log_cond_br_taken
.L116:
	ldr	r0, .L125+4
	bl	time_setTime
	b	.L111
.L221:
	bl	SECURE_log_cond_br_taken
.L114:
	ldr	r0, .L125+4
	bl	location_setLatitude
	b	.L111
.L222:
	bl	SECURE_log_cond_br_taken
.L117:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #83
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+52
	str	r2, [r3]
	b	.L111
.L223:
	bl	SECURE_log_cond_br_taken
.L118:
	ldr	r0, .L125+4
	bl	location_setLongitude
	b	.L111
.L224:
	bl	SECURE_log_cond_br_taken
.L112:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #87
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+56
	str	r2, [r3]
	b	.L111
.L225:
	bl	SECURE_log_cond_br_taken
.L120:
	ldr	r3, .L125+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	ite	ne
	movne	r3, #1
	moveq	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L125+16
	str	r2, [r3]
	b	.L111
.L226:
	bl	SECURE_log_cond_br_taken
.L119:
	ldr	r0, .L125+4
	bl	satellites_set
	b	.L111
.L227:
	bl	SECURE_log_cond_br_taken
.L121:
	ldr	r0, .L125+4
	bl	hdop_set
	b	.L111
.L228:
	bl	SECURE_log_cond_br_taken
.L122:
	ldr	r0, .L125+4
	bl	altitude_set
.L111:
.L124:
.L229:
	bl	SECURE_log_cond_br_taken
.L96:
	movs	r3, #0
.L90:
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, lr}
	b	SECURE_log_ret
.L126:
	.align	2
.L125:
	.word	isChecksumTerm
	.word	term
	.word	parity
	.word	passedChecksumCount
	.word	sentenceHasFix
	.word	sentencesWithFixCount
	.word	curSentenceType
	.word	failedChecksumCount
	.word	curTermNumber
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	rawNewLatDataNegative
	.word	rawNewLongDataNegative
	.size	endOfTermHandler, .-endOfTermHandler
	.section	.text.gps_encode,"ax",%progbits
	.align	1
	.global	gps_encode
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	gps_encode, %function
gps_encode:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	mov	r3, r0
	strb	r3, [r7, #7]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r0, r3
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	ldr	r3, .L139
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L139
	str	r3, [r2]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #36
	beq	.L235
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #36
	bgt	.L230
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #10
	beq	.L232
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #13
	beq	.L231
	bl	SECURE_log_cond_br_not_taken
	b	.L128
.L230:
	bl	SECURE_log_cond_br_taken
.L130:
	cmp	r3, #42
	beq	.L233
	bl	SECURE_log_cond_br_not_taken
	cmp	r3, #44
	bne	.L236
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L139+4
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [r7, #7]
	eors	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L139+4
	strb	r2, [r3]
	movs	r0, #49
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	b	.L132
.L231:
	bl	SECURE_log_cond_br_taken
.L132:
	movs	r0, #50
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	b	.L131
.L232:
	bl	SECURE_log_cond_br_taken
.L131:
	movs	r0, #51
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	b	.L133
.L233:
	bl	SECURE_log_cond_br_taken
.L133:
	movs	r0, #52
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	movs	r3, #0
	str	r3, [r7, #12]
	ldr	r3, .L139+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #14
	bhi	.L234
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L139+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L139+12
	movs	r1, #0
	strb	r1, [r3, r2]
	bl	endOfTermHandler
	str	r0, [r7, #12]
	b	.L135
.L234:
	bl	SECURE_log_cond_br_taken
.L135:
	ldr	r3, .L139+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L139+16
	strb	r2, [r3]
	ldr	r3, .L139+8
	movs	r2, #0
	strb	r2, [r3]
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #42
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, .L139+20
	str	r2, [r3]
	ldr	r3, [r7, #12]
	b	.L136
.L235:
	bl	SECURE_log_cond_br_taken
.L129:
	movs	r0, #53
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	ldr	r3, .L139+8
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, .L139+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, .L139+16
	strb	r2, [r3]
	ldr	r3, .L139+4
	movs	r2, #0
	strb	r2, [r3]
	ldr	r3, .L139+24
	movs	r2, #2
	strb	r2, [r3]
	ldr	r3, .L139+20
	movs	r2, #0
	str	r2, [r3]
	ldr	r3, .L139+28
	movs	r2, #0
	str	r2, [r3]
	movs	r3, #0
	b	.L136
.L236:
	bl	SECURE_log_cond_br_taken
.L128:
	movs	r0, #54
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	ldr	r3, .L139+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #13
	bhi	.L237
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L139+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r2, r3, #1
	uxtb	r1, r2
	ldr	r2, .L139+8
	strb	r1, [r2]
	mov	r1, r3
	ldr	r2, .L139+12
	ldrb	r3, [r7, #7]
	strb	r3, [r2, r1]
	b	.L137
.L237:
	bl	SECURE_log_cond_br_taken
.L137:
	ldr	r3, .L139+20
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L238
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L139+4
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [r7, #7]
	eors	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L139+4
	strb	r2, [r3]
	b	.L138
.L238:
	bl	SECURE_log_cond_br_taken
.L138:
	movs	r3, #0
.L136:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L140:
	.align	2
.L139:
	.word	encodedCharCount
	.word	parity
	.word	curTermOffset
	.word	term
	.word	curTermNumber
	.word	isChecksumTerm
	.word	curSentenceType
	.word	sentenceHasFix
	.size	gps_encode, .-gps_encode
	.section	.text.get_position,"ax",%progbits
	.align	1
	.global	get_position
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	get_position, %function
get_position:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L239
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L145
	vldr.32	s15, [r3]
	vcvt.s32.f32	s15, s15
	vmov	r2, s15	@ int
	ldr	r3, [r7, #4]
	str	r2, [r3]
	b	.L142
.L239:
	bl	SECURE_log_cond_br_taken
.L142:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L240
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L145+4
	vldr.32	s15, [r3]
	vcvt.s32.f32	s15, s15
	vmov	r2, s15	@ int
	ldr	r3, [r7]
	str	r2, [r3]
	b	.L144
.L240:
	bl	SECURE_log_cond_br_taken
.L144:
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L146:
	.align	2
.L145:
	.word	lat
	.word	lng
	.size	get_position, .-get_position
	.section	.text.f_get_position,"ax",%progbits
	.align	1
	.global	f_get_position
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	f_get_position, %function
f_get_position:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	add	r2, r7, #8
	add	r3, r7, #12
	mov	r1, r2
	mov	r0, r3
	bl	get_position
	ldr	r3, [r7, #12]
	ldr	r2, .L152
	cmp	r3, r2
	beq	.L241
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #12]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L152+4
	vdiv.f32	s15, s14, s13
	b	.L149
.L241:
	bl	SECURE_log_cond_br_taken
.L148:
	vldr.32	s15, .L152+8
.L149:
	ldr	r3, [r7, #4]
	vstr.32	s15, [r3]
	ldr	r3, [r7, #8]
	ldr	r2, .L152
	cmp	r3, r2
	beq	.L242
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #8]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s14, s15
	vldr.32	s13, .L152+4
	vdiv.f32	s15, s14, s13
	b	.L151
.L242:
	bl	SECURE_log_cond_br_taken
.L150:
	vldr.32	s15, .L152+8
.L151:
	ldr	r3, [r7]
	vstr.32	s15, [r3]
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L153:
	.align	2
.L152:
	.word	999999999
	.word	1232348160
	.word	0
	.size	f_get_position, .-f_get_position
	.section	.text.get_datetime,"ax",%progbits
	.align	1
	.global	get_datetime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	get_datetime, %function
get_datetime:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L243
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L158
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3]
	b	.L155
.L243:
	bl	SECURE_log_cond_br_taken
.L155:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L244
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L158+4
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7]
	str	r2, [r3]
	b	.L157
.L244:
	bl	SECURE_log_cond_br_taken
.L157:
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L159:
	.align	2
.L158:
	.word	dateValue
	.word	timeVal
	.size	get_datetime, .-get_datetime
	.section	.text.crack_datetime,"ax",%progbits
	.align	1
	.global	crack_datetime
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	crack_datetime, %function
crack_datetime:
	@ args = 12, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	add	r2, r7, #16
	add	r3, r7, #20
	mov	r1, r2
	mov	r0, r3
	bl	get_datetime
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L246
	bl	SECURE_log_cond_br_not_taken
	ldr	r2, [r7, #20]
	ldr	r3, .L171
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #80
	ble	.L245
	bl	SECURE_log_cond_br_not_taken
	movw	r3, #1900
	b	.L163
.L245:
	bl	SECURE_log_cond_br_taken
.L162:
	mov	r3, #2000
.L163:
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	b	.L161
.L246:
	bl	SECURE_log_cond_br_taken
.L161:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L247
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #20]
	ldr	r2, .L171
	umull	r2, r3, r2, r3
	lsrs	r2, r3, #5
	ldr	r3, .L171
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3]
	b	.L164
.L247:
	bl	SECURE_log_cond_br_taken
.L164:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L248
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #20]
	ldr	r2, .L171+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #13
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	b	.L165
.L248:
	bl	SECURE_log_cond_br_taken
.L165:
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L249
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #16]
	ldr	r2, .L171+8
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #18
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3]
	b	.L166
.L249:
	bl	SECURE_log_cond_br_taken
.L166:
	ldr	r3, [r7, #32]
	cmp	r3, #0
	beq	.L250
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #16]
	ldr	r2, .L171+4
	umull	r2, r3, r2, r3
	lsrs	r2, r3, #13
	ldr	r3, .L171
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [r7, #32]
	strb	r2, [r3]
	b	.L167
.L250:
	bl	SECURE_log_cond_br_taken
.L167:
	ldr	r3, [r7, #36]
	cmp	r3, #0
	beq	.L251
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #16]
	ldr	r2, .L171
	umull	r2, r3, r2, r3
	lsrs	r2, r3, #5
	ldr	r3, .L171
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [r7, #36]
	strb	r2, [r3]
	b	.L168
.L251:
	bl	SECURE_log_cond_br_taken
.L168:
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L252
	bl	SECURE_log_cond_br_not_taken
	ldr	r2, [r7, #16]
	ldr	r3, .L171
	umull	r1, r3, r3, r2
	lsrs	r3, r3, #5
	movs	r1, #100
	mul	r3, r1, r3
	subs	r3, r2, r3
	uxtb	r2, r3
	ldr	r3, [r7, #40]
	strb	r2, [r3]
	b	.L170
.L252:
	bl	SECURE_log_cond_br_taken
.L170:
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L172:
	.align	2
.L171:
	.word	1374389535
	.word	-776530087
	.word	1125899907
	.size	crack_datetime, .-crack_datetime
	.section	.text.stats,"ax",%progbits
	.align	1
	.global	stats
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	stats, %function
stats:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L253
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L178
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	b	.L174
.L253:
	bl	SECURE_log_cond_br_taken
.L174:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L254
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L178+4
	ldr	r3, [r3]
	uxth	r2, r3
	ldr	r3, [r7, #8]
	strh	r2, [r3]	@ movhi
	b	.L175
.L254:
	bl	SECURE_log_cond_br_taken
.L175:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L255
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, .L178+8
	ldr	r3, [r3]
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]	@ movhi
	b	.L177
.L255:
	bl	SECURE_log_cond_br_taken
.L177:
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L179:
	.align	2
.L178:
	.word	encodedCharCount
	.word	passedChecksumCount
	.word	failedChecksumCount
	.size	stats, .-stats
	.section	.text.gpsdump,"ax",%progbits
	.align	1
	.global	gpsdump
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	gpsdump, %function
gpsdump:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #68
	add	r7, sp, #16
	add	r2, r7, #40
	add	r3, r7, #44
	mov	r1, r2
	mov	r0, r3
	bl	get_position
	add	r2, r7, #32
	add	r3, r7, #36
	mov	r1, r2
	mov	r0, r3
	bl	f_get_position
	add	r2, r7, #24
	add	r3, r7, #28
	mov	r1, r2
	mov	r0, r3
	bl	get_datetime
	add	r4, r7, #13
	add	r2, r7, #14
	add	r1, r7, #15
	add	r0, r7, #16
	add	r3, r7, #10
	str	r3, [sp, #8]
	add	r3, r7, #11
	str	r3, [sp, #4]
	add	r3, r7, #12
	str	r3, [sp]
	mov	r3, r4
	bl	crack_datetime
	adds	r2, r7, #6
	add	r1, r7, #8
	add	r3, r7, #20
	mov	r0, r3
	bl	stats
	adds	r7, r7, #52
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, lr}
	b	SECURE_log_ret
	.size	gpsdump, .-gpsdump
	.global	input_buffer
	.section	.rodata.input_buffer,"a",%progbits
	.align	2
	.type	input_buffer, %object
	.size	input_buffer, 46
input_buffer:
	.byte	36
	.byte	71
	.byte	80
	.byte	82
	.byte	77
	.byte	67
	.byte	10
	.byte	49
	.byte	48
	.byte	46
	.byte	50
	.byte	51
	.byte	44
	.byte	65
	.byte	44
	.byte	45
	.byte	50
	.byte	52
	.byte	44
	.byte	78
	.byte	44
	.byte	53
	.byte	52
	.byte	44
	.byte	87
	.byte	44
	.byte	49
	.byte	53
	.byte	46
	.byte	52
	.byte	51
	.byte	44
	.byte	57
	.byte	57
	.byte	46
	.byte	57
	.byte	44
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	42
	.byte	51
	.byte	52
	.byte	10
	.space	1
	.comm	lt,4,4
	.comm	ln,4,4
	.comm	d,4,4
	.comm	t,4,4
	.comm	c,4,4
	.comm	y,4,4
	.comm	m,1,1
	.comm	da,1,1
	.comm	h,1,1
	.comm	mi,1,1
	.comm	s,1,1
	.comm	hu,1,1
	.comm	se,2,2
	.comm	f,2,2
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
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L182
.L183:
	bl	SECURE_log_cond_br_taken
	ldr	r2, .L184
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	gps_encode
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L182:
	ldr	r3, [r7, #4]
	cmp	r3, #45
	ble	.L183
	bl	SECURE_log_cond_br_not_taken
	bl	gpsdump
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L185:
	.align	2
.L184:
	.word	input_buffer
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
