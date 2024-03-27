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
	.global	qHead
	.section	.bss.qHead,"aw",%nobits
	.align	2
	.type	qHead, %object
	.size	qHead, 4
qHead:
	.space	4
	.global	AdjMatrix
	.section	.data.AdjMatrix,"aw",%progbits
	.align	2
	.type	AdjMatrix, %object
	.size	AdjMatrix, 400
AdjMatrix:
	.word	32
	.word	32
	.word	54
	.word	12
	.word	52
	.word	56
	.word	8
	.word	30
	.word	44
	.word	94
	.word	76
	.word	54
	.word	65
	.word	14
	.word	89
	.word	69
	.word	4
	.word	16
	.word	24
	.word	47
	.word	38
	.word	31
	.word	75
	.word	40
	.word	61
	.word	21
	.word	84
	.word	51
	.word	86
	.word	41
	.word	80
	.word	16
	.word	53
	.word	14
	.word	94
	.word	29
	.word	77
	.word	99
	.word	16
	.word	29
	.word	59
	.word	7
	.word	14
	.word	78
	.word	79
	.word	45
	.word	54
	.word	83
	.word	8
	.word	94
	.word	94
	.word	41
	.word	3
	.word	61
	.word	27
	.word	19
	.word	33
	.word	35
	.word	78
	.word	38
	.word	3
	.word	55
	.word	41
	.word	76
	.word	49
	.word	68
	.word	83
	.word	23
	.word	67
	.word	15
	.word	68
	.word	28
	.word	47
	.word	12
	.word	82
	.word	6
	.word	26
	.word	96
	.word	98
	.word	75
	.word	7
	.word	1
	.word	46
	.word	39
	.word	12
	.word	68
	.word	41
	.word	28
	.word	31
	.word	0
	.word	82
	.word	97
	.word	72
	.word	61
	.word	39
	.word	48
	.word	11
	.word	99
	.word	38
	.word	49
	.global	g_qCount
	.section	.bss.g_qCount,"aw",%nobits
	.align	2
	.type	g_qCount, %object
	.size	g_qCount, 4
g_qCount:
	.space	4
	.comm	rgnNodes,80,4
	.comm	ch,4,4
	.comm	iPrev,4,4
	.comm	iNode,4,4
	.comm	i,4,4
	.comm	iCost,4,4
	.comm	iDist,4,4
	.section	.bss.qheap,"aw",%nobits
	.align	2
	.type	qheap, %object
	.size	qheap, 8192
qheap:
	.space	8192
	.section	.bss.qfree_list,"aw",%nobits
	.align	2
	.type	qfree_list, %object
	.size	qfree_list, 4
qfree_list:
	.space	4
	.section	.text.qinit_heap,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	qinit_heap, %function
qinit_heap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r3, .L4
	movs	r2, #0
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L3:
	ldr	r3, .L4
	ldr	r2, [r3]
	ldr	r1, .L4+4
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	add	r3, r3, r1
	adds	r3, r3, #12
	str	r2, [r3]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #4
	ldr	r2, .L4+4
	add	r3, r3, r2
	ldr	r2, .L4
	str	r3, [r2]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #512
	bcc	.L3
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	qfree_list
	.word	qheap
	.size	qinit_heap, .-qinit_heap
	.section	.text.qmalloc_beebs,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	qmalloc_beebs, %function
qmalloc_beebs:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #16
	bne	.L7
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L8
.L7:
	movs	r3, #0
	b	.L9
.L8:
	ldr	r3, .L11
	ldr	r3, [r3]
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #12]
	ldr	r2, .L11
	str	r3, [r2]
.L10:
	ldr	r3, [r7, #12]
.L9:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	qfree_list
	.size	qmalloc_beebs, .-qmalloc_beebs
	.section	.text.qfree_beebs,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	qfree_beebs, %function
qfree_beebs:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r3, .L14
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	str	r2, [r3, #12]
	ldr	r2, .L14
	ldr	r3, [r7, #12]
	str	r3, [r2]
	nop
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	qfree_list
	.size	qfree_beebs, .-qfree_beebs
	.section	.text.enqueue,"ax",%progbits
	.align	1
	.global	enqueue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	enqueue, %function
enqueue:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r0, #16
	bl	qmalloc_beebs
	str	r0, [r7, #16]
	ldr	r3, .L21
	ldr	r3, [r3]
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #8]
	str	r2, [r3, #4]
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	ldr	r3, [r7, #16]
	movs	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L19
	ldr	r2, .L21
	ldr	r3, [r7, #16]
	str	r3, [r2]
	b	.L18
.L20:
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #12]
	str	r3, [r7, #20]
.L19:
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L20
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #16]
	str	r2, [r3, #12]
.L18:
	ldr	r3, .L21+4
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L21+4
	str	r3, [r2]
	nop
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
	.word	qHead
	.word	g_qCount
	.size	enqueue, .-enqueue
	.section	.text.dequeue,"ax",%progbits
	.align	1
	.global	dequeue
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	dequeue, %function
dequeue:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	ldr	r3, .L26
	ldr	r3, [r3]
	str	r3, [r7, #20]
	ldr	r3, .L26
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L24
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, .L26
	str	r3, [r2]
	ldr	r3, .L26+4
	ldr	r3, [r3]
	subs	r3, r3, #1
	ldr	r2, .L26+4
	str	r3, [r2]
	ldr	r3, [r7, #20]
	b	.L25
.L24:
	movs	r3, #0
.L25:
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	qHead
	.word	g_qCount
	.size	dequeue, .-dequeue
	.section	.text.qcount,"ax",%progbits
	.align	1
	.global	qcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	qcount, %function
qcount:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L30
	ldr	r3, [r3]
	mov	r0, r3
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	g_qCount
	.size	qcount, .-qcount
	.section	.text.dijkstra,"ax",%progbits
	.align	1
	.global	dijkstra
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	dijkstra, %function
dijkstra:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r3, .L44
	movs	r2, #0
	str	r2, [r3]
	b	.L33
.L34:
	ldr	r3, .L44
	ldr	r3, [r3]
	ldr	r2, .L44+4
	movw	r1, #9999
	str	r1, [r2, r3, lsl #3]
	ldr	r3, .L44
	ldr	r3, [r3]
	ldr	r2, .L44+4
	lsls	r3, r3, #3
	add	r3, r3, r2
	movw	r2, #9999
	str	r2, [r3, #4]
	ldr	r3, .L44
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L44
	str	r3, [r2]
.L33:
	ldr	r3, .L44
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L34
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L35
	movs	r3, #0
	b	.L36
.L35:
	ldr	r2, .L44+4
	ldr	r3, [r7, #4]
	movs	r1, #0
	str	r1, [r2, r3, lsl #3]
	ldr	r2, .L44+4
	ldr	r3, [r7, #4]
	lsls	r3, r3, #3
	add	r3, r3, r2
	movw	r2, #9999
	str	r2, [r3, #4]
	movw	r2, #9999
	movs	r1, #0
	ldr	r0, [r7, #4]
	bl	enqueue
	b	.L37
.L43:
	ldr	r2, .L44+8
	ldr	r1, .L44+12
	ldr	r0, .L44+16
	bl	dequeue
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L38
	ldr	r0, [r7, #12]
	bl	qfree_beebs
.L38:
	ldr	r3, .L44+20
	movs	r2, #0
	str	r2, [r3]
	b	.L39
.L42:
	ldr	r3, .L44+16
	ldr	r2, [r3]
	ldr	r3, .L44+20
	ldr	r1, [r3]
	ldr	r0, .L44+24
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r1
	ldr	r3, [r0, r3, lsl #2]
	ldr	r2, .L44+28
	str	r3, [r2]
	ldr	r3, .L44+28
	ldr	r3, [r3]
	movw	r2, #9999
	cmp	r3, r2
	beq	.L40
	ldr	r3, .L44+20
	ldr	r3, [r3]
	ldr	r2, .L44+4
	ldr	r3, [r2, r3, lsl #3]
	movw	r2, #9999
	cmp	r3, r2
	beq	.L41
	ldr	r3, .L44+20
	ldr	r3, [r3]
	ldr	r2, .L44+4
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, .L44+28
	ldr	r1, [r3]
	ldr	r3, .L44+12
	ldr	r3, [r3]
	add	r3, r3, r1
	cmp	r2, r3
	ble	.L40
.L41:
	ldr	r3, .L44+20
	ldr	r3, [r3]
	ldr	r2, .L44+12
	ldr	r1, [r2]
	ldr	r2, .L44+28
	ldr	r2, [r2]
	add	r2, r2, r1
	ldr	r1, .L44+4
	str	r2, [r1, r3, lsl #3]
	ldr	r3, .L44+20
	ldr	r3, [r3]
	ldr	r2, .L44+16
	ldr	r2, [r2]
	ldr	r1, .L44+4
	lsls	r3, r3, #3
	add	r3, r3, r1
	str	r2, [r3, #4]
	ldr	r3, .L44+20
	ldr	r0, [r3]
	ldr	r3, .L44+12
	ldr	r2, [r3]
	ldr	r3, .L44+28
	ldr	r3, [r3]
	adds	r1, r2, r3
	ldr	r3, .L44+16
	ldr	r3, [r3]
	mov	r2, r3
	bl	enqueue
.L40:
	ldr	r3, .L44+20
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L44+20
	str	r3, [r2]
.L39:
	ldr	r3, .L44+20
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L42
.L37:
	bl	qcount
	mov	r3, r0
	cmp	r3, #0
	bgt	.L43
	ldr	r2, .L44+4
	ldr	r3, [r7]
	ldr	r3, [r2, r3, lsl #3]
.L36:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	ch
	.word	rgnNodes
	.word	iPrev
	.word	iDist
	.word	iNode
	.word	i
	.word	AdjMatrix
	.word	iCost
	.size	dijkstra, .-dijkstra
	.comm	output,400,4
	.global	output_count
	.section	.bss.output_count,"aw",%nobits
	.align	2
	.type	output_count, %object
	.size	output_count, 4
output_count:
	.space	4
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
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	bl	qinit_heap
	ldr	r3, .L51
	movs	r2, #0
	str	r2, [r3]
	movs	r3, #0
	str	r3, [r7]
	b	.L47
.L50:
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L48
.L49:
	ldr	r3, .L51
	ldr	r4, [r3]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	dijkstra
	mov	r2, r0
	ldr	r3, .L51+4
	str	r2, [r3, r4, lsl #2]
	ldr	r3, .L51
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L51
	str	r3, [r2]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L48:
	ldr	r3, [r7, #4]
	cmp	r3, #9
	ble	.L49
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L47:
	ldr	r3, [r7]
	cmp	r3, #9
	ble	.L50
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L52:
	.align	2
.L51:
	.word	output_count
	.word	output
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
