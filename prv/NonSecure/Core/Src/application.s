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
	.global	user_input
	.section	.data.user_input,"aw",%progbits
	.align	2
	.type	user_input, %object
	.size	user_input, 17
user_input:
	.byte	17
	.byte	34
	.byte	51
	.byte	68
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-32
	.byte	-1
	.byte	3
	.byte	32
	.byte	-107
	.byte	12
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
	bl	SECURE_log_cond_br_not_taken
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
.L5:
	.align	2
.L4:
	.word	user_input
	.size	read_data, .-read_data
	.section	.text.swi120,"ax",%progbits
	.align	1
	.global	swi120
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	swi120, %function
swi120:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	add	r3, r7, #8
	mov	r0, r3
	bl	read_data
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L7
.L131:
	bl	SECURE_log_cond_br_taken
	ldr	r3, [r7, #12]
	cmp	r3, #119
	bhi	.L225
	bl	SECURE_log_cond_br_not_taken
	adr	r2, .L10
	ldr	r10, [r2, r3, lsl #2]
	b	SECURE_log_indr_fwd
	.p2align 2
.L10:
	.word	.L9+1
	.word	.L11+1
	.word	.L12+1
	.word	.L13+1
	.word	.L14+1
	.word	.L15+1
	.word	.L16+1
	.word	.L17+1
	.word	.L18+1
	.word	.L19+1
	.word	.L20+1
	.word	.L21+1
	.word	.L22+1
	.word	.L23+1
	.word	.L24+1
	.word	.L25+1
	.word	.L26+1
	.word	.L27+1
	.word	.L28+1
	.word	.L29+1
	.word	.L30+1
	.word	.L31+1
	.word	.L32+1
	.word	.L33+1
	.word	.L34+1
	.word	.L35+1
	.word	.L36+1
	.word	.L37+1
	.word	.L38+1
	.word	.L39+1
	.word	.L40+1
	.word	.L41+1
	.word	.L42+1
	.word	.L43+1
	.word	.L44+1
	.word	.L45+1
	.word	.L46+1
	.word	.L47+1
	.word	.L48+1
	.word	.L49+1
	.word	.L50+1
	.word	.L51+1
	.word	.L52+1
	.word	.L53+1
	.word	.L54+1
	.word	.L55+1
	.word	.L56+1
	.word	.L57+1
	.word	.L58+1
	.word	.L59+1
	.word	.L60+1
	.word	.L61+1
	.word	.L62+1
	.word	.L63+1
	.word	.L64+1
	.word	.L65+1
	.word	.L66+1
	.word	.L67+1
	.word	.L68+1
	.word	.L69+1
	.word	.L70+1
	.word	.L71+1
	.word	.L72+1
	.word	.L73+1
	.word	.L74+1
	.word	.L75+1
	.word	.L76+1
	.word	.L77+1
	.word	.L78+1
	.word	.L79+1
	.word	.L80+1
	.word	.L81+1
	.word	.L82+1
	.word	.L83+1
	.word	.L84+1
	.word	.L85+1
	.word	.L86+1
	.word	.L87+1
	.word	.L88+1
	.word	.L89+1
	.word	.L90+1
	.word	.L91+1
	.word	.L92+1
	.word	.L93+1
	.word	.L94+1
	.word	.L95+1
	.word	.L96+1
	.word	.L97+1
	.word	.L98+1
	.word	.L99+1
	.word	.L100+1
	.word	.L101+1
	.word	.L102+1
	.word	.L103+1
	.word	.L104+1
	.word	.L105+1
	.word	.L106+1
	.word	.L107+1
	.word	.L108+1
	.word	.L109+1
	.word	.L110+1
	.word	.L111+1
	.word	.L112+1
	.word	.L113+1
	.word	.L114+1
	.word	.L115+1
	.word	.L116+1
	.word	.L117+1
	.word	.L118+1
	.word	.L119+1
	.word	.L120+1
	.word	.L121+1
	.word	.L122+1
	.word	.L123+1
	.word	.L124+1
	.word	.L125+1
	.word	.L126+1
	.word	.L127+1
	.word	.L128+1
	.word	.L129+1
	.p2align 1
.L9:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L11:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L12:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L13:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L14:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L15:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L16:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L17:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L18:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L19:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L20:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L21:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L22:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L23:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L24:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L25:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L26:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L27:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L28:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L29:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L30:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L31:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L32:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L33:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L34:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L35:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L36:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L37:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L38:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L39:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L40:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L41:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L42:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L43:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L44:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L45:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L46:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L47:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L48:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L49:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L50:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L51:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L52:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L53:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L54:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L55:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L56:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L57:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L58:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L59:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L60:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L61:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L62:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L63:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L64:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L65:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L66:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L67:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L68:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L69:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L70:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L71:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L72:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L73:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L74:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L75:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L76:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L77:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L78:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L79:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L80:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L81:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L82:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L83:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L84:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L85:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L86:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L87:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L88:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L89:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L90:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L91:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L92:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L93:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L94:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L95:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L96:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L97:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L98:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L99:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L100:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L101:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L102:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L103:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L104:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L105:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L106:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L107:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L108:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L109:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L110:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L111:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L112:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L113:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L114:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L115:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L116:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L117:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L118:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L119:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L120:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L121:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L122:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L123:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L124:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L125:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L126:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L127:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L128:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L129:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L130
.L225:
	bl	SECURE_log_cond_br_taken
.L8:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L130:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L7:
	ldr	r3, [r7, #12]
	cmp	r3, #119
	ble	.L131
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	swi120, .-swi120
	.section	.text.swi50,"ax",%progbits
	.align	1
	.global	swi50
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	swi50, %function
swi50:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L134
.L198:
	bl	SECURE_log_cond_br_taken
	ldr	r3, [r7, #12]
	cmp	r3, #59
	bhi	.L226
	bl	SECURE_log_cond_br_not_taken
	adr	r2, .L137
	ldr	r10, [r2, r3, lsl #2]
	b	SECURE_log_indr_fwd
	.p2align 2
.L137:
	.word	.L136+1
	.word	.L138+1
	.word	.L139+1
	.word	.L140+1
	.word	.L141+1
	.word	.L142+1
	.word	.L143+1
	.word	.L144+1
	.word	.L145+1
	.word	.L146+1
	.word	.L147+1
	.word	.L148+1
	.word	.L149+1
	.word	.L150+1
	.word	.L151+1
	.word	.L152+1
	.word	.L153+1
	.word	.L154+1
	.word	.L155+1
	.word	.L156+1
	.word	.L157+1
	.word	.L158+1
	.word	.L159+1
	.word	.L160+1
	.word	.L161+1
	.word	.L162+1
	.word	.L163+1
	.word	.L164+1
	.word	.L165+1
	.word	.L166+1
	.word	.L167+1
	.word	.L168+1
	.word	.L169+1
	.word	.L170+1
	.word	.L171+1
	.word	.L172+1
	.word	.L173+1
	.word	.L174+1
	.word	.L175+1
	.word	.L176+1
	.word	.L177+1
	.word	.L178+1
	.word	.L179+1
	.word	.L180+1
	.word	.L181+1
	.word	.L182+1
	.word	.L183+1
	.word	.L184+1
	.word	.L185+1
	.word	.L186+1
	.word	.L187+1
	.word	.L188+1
	.word	.L189+1
	.word	.L190+1
	.word	.L191+1
	.word	.L192+1
	.word	.L193+1
	.word	.L194+1
	.word	.L195+1
	.word	.L196+1
	.p2align 1
.L136:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L138:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L139:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L140:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L141:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L142:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L143:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L144:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L145:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L146:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L147:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L148:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L149:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L150:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L151:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L152:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L153:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L154:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L155:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L156:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L157:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L158:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L159:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L160:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L161:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L162:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L163:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L164:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L165:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L166:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L167:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L168:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L169:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L170:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L171:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L172:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L173:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L174:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L175:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L176:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L177:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L178:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L179:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L180:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L181:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L182:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L183:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L184:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L185:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L186:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L187:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L188:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L189:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L190:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L191:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L192:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L193:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L194:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L195:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L196:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L197
.L226:
	bl	SECURE_log_cond_br_taken
.L135:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L197:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L134:
	ldr	r3, [r7, #12]
	cmp	r3, #49
	ble	.L198
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	swi50, .-swi50
	.section	.text.swi10,"ax",%progbits
	.align	1
	.global	swi10
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	swi10, %function
swi10:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L201
.L215:
	bl	SECURE_log_cond_br_taken
	ldr	r3, [r7, #12]
	cmp	r3, #9
	bhi	.L227
	bl	SECURE_log_cond_br_not_taken
	adr	r2, .L204
	ldr	r10, [r2, r3, lsl #2]
	b	SECURE_log_indr_fwd
	.p2align 2
.L204:
	.word	.L203+1
	.word	.L205+1
	.word	.L206+1
	.word	.L207+1
	.word	.L208+1
	.word	.L209+1
	.word	.L210+1
	.word	.L211+1
	.word	.L212+1
	.word	.L213+1
	.p2align 1
.L203:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L205:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L206:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L207:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L208:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L209:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L210:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L211:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L212:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L213:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L214
.L227:
	bl	SECURE_log_cond_br_taken
.L202:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L214:
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L201:
	ldr	r3, [r7, #12]
	cmp	r3, #9
	ble	.L215
	bl	SECURE_log_cond_br_not_taken
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	swi10, .-swi10
	.section	.text.benchmark,"ax",%progbits
	.align	1
	.global	benchmark
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	benchmark, %function
benchmark:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	swi10
	mov	r3, r0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	swi50
	mov	r3, r0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	bl	swi120
	mov	r3, r0
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	benchmark, .-benchmark
	.section	.text.verify_benchmark,"ax",%progbits
	.align	1
	.global	verify_benchmark
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv5-sp-d16
	.type	verify_benchmark, %function
verify_benchmark:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7, lr}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #180
	str	r3, [r7, #12]
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	beq	.L228
	bl	SECURE_log_cond_br_not_taken
	movs	r3, #0
	b	.L221
.L228:
	bl	SECURE_log_cond_br_taken
.L220:
	movs	r3, #1
.L221:
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7, lr}
	b	SECURE_log_ret
	.size	verify_benchmark, .-verify_benchmark
	.comm	output,4,4
	.comm	result,4,4
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
	bl	benchmark
	mov	r2, r0
	ldr	r3, .L223
	str	r2, [r3]
	ldr	r3, .L223
	ldr	r3, [r3]
	mov	r0, r3
	bl	verify_benchmark
	mov	r2, r0
	ldr	r3, .L223+4
	str	r2, [r3]
	ldr	r3, .L223+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	SECURE_record_output_data
	bl	SECURE_record_output_data
	pop	{r7, lr}
	b	SECURE_log_ret
.L224:
	.align	2
.L223:
	.word	output
	.word	result
	.size	application, .-application
	.ident	"GCC: (15:6.3.1+svn253039-1build1) 6.3.1 20170620"
