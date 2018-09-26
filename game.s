	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L4
	mov	r2, #117440512
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.align	2
	.global	initMainPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMainPlayer, %function
initMainPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	ldr	r2, [r3]
	cmp	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #2
	movne	fp, #8192
	moveq	fp, #4096
	movne	r10, #2
	moveq	r10, #1
	mov	r1, #0
	mov	r9, #64
	mov	r8, #18
	mov	r7, #16
	mov	r6, #32
	mov	r4, #1
	mov	lr, #180
	mov	ip, #3
	mov	r0, #30
	ldr	r3, .L10+4
	orr	fp, fp, r2, lsl r5
	strh	fp, [r3, #4]	@ movhi
	ldr	fp, .L10+8
	strh	fp, [r3]	@ movhi
	sub	fp, fp, #46
	strh	fp, [r3, #2]	@ movhi
	ldr	r3, .L10+12
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	add	r2, r2, #14
	str	r10, [r3, #48]
	str	r10, [r3, #52]
	str	r9, [r3]
	str	r8, [r3, #4]
	str	r7, [r3, #12]
	str	r6, [r3, #16]
	str	r5, [r3, #8]
	str	r4, [r3, #20]
	str	lr, [r3, #64]
	str	r2, [r3, #60]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #56]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	characterSelected
	.word	shadowOAM
	.word	-32704
	.word	player
	.size	initMainPlayer, .-initMainPlayer
	.align	2
	.global	updateMainPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMainPlayer, %function
updateMainPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L61
	ldr	r3, [r4, #64]
	cmp	r3, #0
	moveq	r1, #180
	ldreq	r2, [r4, #48]
	streq	r3, [r4, #56]
	ldr	r3, [r4, #44]
	streq	r2, [r4, #52]
	streq	r1, [r4, #64]
	cmp	r3, #0
	sub	sp, sp, #16
	ldr	r2, [r4, #40]
	ldr	ip, [r4]
	bne	.L14
	ldr	r0, .L61+4
	ldr	r1, [r0]
	cmp	r2, #0
	add	r2, r1, #1
	str	r2, [r0]
	bne	.L15
	ldr	r2, [r4, #32]
	ldr	r1, [r4, #36]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r4, #32]
	blt	.L15
.L28:
	mov	r2, #0
	str	r2, [r4, #32]
.L15:
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r1, .L61+8
	ldrh	r2, [r1, #48]
	eor	r2, r2, #64
	ands	r2, r3, r2, lsr #6
	bne	.L60
.L16:
	ldr	r2, .L61+8
	ldrh	r2, [r2, #48]
	eor	r2, r2, #128
	ands	r3, r3, r2, lsr #7
	ldr	lr, [r4, #16]
	bne	.L17
.L18:
	mov	r6, #0
	mov	r9, #1
	ldr	r5, .L61+12
	ldr	r7, .L61+16
	ldr	r8, .L61+20
	ldr	r10, .L61+24
.L20:
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldm	r5, {r0, r1}
	str	lr, [sp, #8]
	str	ip, [sp]
	ldr	lr, [r4, #12]
	ldr	ip, [r4, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L19
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [r5, #56]
	cmp	r3, #0
	bne	.L19
	ldr	r3, [r8]
	cmp	r3, #0
	bne	.L19
	ldr	r3, [r5, #64]
	cmp	r3, #0
	bne	.L19
	ldr	r3, [r4, #56]
	cmp	r3, #0
	streq	r9, [r5, #48]
	streq	r9, [r4, #44]
	streq	r6, [r10]
	streq	r9, [r8]
.L19:
	add	r6, r6, #1
	cmp	r6, #7
	add	r5, r5, #76
	ldr	ip, [r4]
	ldr	lr, [r4, #16]
	bne	.L20
	mov	r9, #0
	mov	r8, #1
	ldr	r5, .L61+28
	add	r6, r5, #280
.L23:
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldm	r5, {r0, r1}
	ldr	r10, [r4, #12]
	str	lr, [sp, #8]
	ldr	lr, [r4, #4]
	str	ip, [sp]
	str	r10, [sp, #12]
	str	lr, [sp, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L21
	ldr	r3, [r5, #20]
	cmp	r3, #0
	ldrne	r3, [r4, #60]
	strne	r9, [r5, #20]
	strne	r8, [r4, #56]
	strne	r3, [r4, #52]
.L21:
	add	r5, r5, #56
	cmp	r6, r5
	ldr	ip, [r4]
	beq	.L22
	ldr	lr, [r4, #16]
	b	.L23
.L14:
	cmp	r2, #0
	bne	.L58
	ldr	r2, [r4, #32]
	ldr	r1, [r4, #36]
	add	r2, r2, #1
	cmp	r1, r2
	str	r2, [r4, #32]
	ble	.L28
.L58:
	ldr	r3, .L61+8
	ldr	lr, [r4, #16]
	ldrh	r2, [r3, #48]
	ldrh	r3, [r3, #48]
	b	.L18
.L60:
	ldr	r3, .L61+32
	ldr	r3, [r3]
	cmp	r3, ip
	bge	.L30
	ldr	r3, [r4, #8]
	sub	ip, ip, r3
	ldrh	r3, [r1, #48]
	tst	r3, #128
	str	ip, [r4]
	ldr	lr, [r4, #16]
	bne	.L18
.L17:
	ldr	r3, .L61+36
	ldr	r3, [r3]
	sub	r3, r3, lr
	cmp	r3, ip
	ldrgt	r3, [r4, #8]
	addgt	ip, ip, r3
	strgt	ip, [r4]
	b	.L18
.L22:
	ldr	r0, [r4, #24]
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #32]
	ldr	r3, [r4, #52]
	add	r2, r2, r0, lsl #1
	add	r2, r2, r1, lsl #6
	lsl	r3, r3, #12
	orr	r3, r3, r2, lsl #1
	ldr	r2, [r4, #40]
	cmp	r2, #0
	moveq	r2, #29
	ldr	r1, .L61+40
	ldr	lr, .L61+44
	ldr	r0, [r4, #4]
	strh	r3, [r1, #4]	@ movhi
	ldr	r3, [r4, #56]
	subne	r2, r2, #1
	orr	ip, ip, lr
	orr	r0, r0, lr
	cmp	r3, #0
	strh	ip, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	str	r2, [r4, #40]
	ldrne	r3, [r4, #64]
	subne	r3, r3, #1
	strne	r3, [r4, #64]
.L12:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L30:
	mov	r3, r2
	b	.L16
.L62:
	.align	2
.L61:
	.word	player
	.word	distanceCounter
	.word	67109120
	.word	friends
	.word	collision
	.word	currTalking
	.word	currActiveChar
	.word	invis
	.word	walkBegin
	.word	walkEnd
	.word	shadowOAM
	.word	-32768
	.size	updateMainPlayer, .-updateMainPlayer
	.align	2
	.global	initOtherPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOtherPlayer, %function
initOtherPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L72
	sub	sp, sp, #8
	mov	lr, pc
	bx	r7
	mov	r9, #0
	ldr	r1, .L72+4
	smull	r2, r3, r0, r1
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r1, .L72+8
	ldr	r2, .L72+12
	sub	r3, r0, r3
	mov	r5, r9
	mov	r6, #2
	str	r3, [r1]
	str	r3, [r2]
	ldr	r4, .L72+16
	ldr	r10, .L72+20
	ldr	r8, .L72+24
	b	.L67
.L71:
	mov	r3, #5
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r3, [r4, #44]
.L65:
	ldr	r3, [r4, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r1, #30
	mov	ip, #3
	mvn	r3, r3, lsr #17
	ldr	r2, [r4, #24]
	ldr	lr, [r4, #44]
	ldr	r0, [r4]
	add	r9, r9, #1
	add	r2, r2, #8
	orr	r2, r2, lr, lsl #12
	orr	r0, r0, #512
	cmp	r9, #7
	str	r5, [r4, #32]
	str	r6, [r4, #36]
	str	r5, [r4, #48]
	str	r5, [r4, #56]
	str	r5, [r4, #64]
	str	r5, [r4, #68]
	str	r5, [r4, #72]
	strh	r3, [r10, #10]	@ movhi
	strh	r2, [r10, #12]	@ movhi
	strh	r0, [r10, #8]	@ movhi
	str	r1, [r4, #40]
	str	ip, [r4, #52]
	add	r10, r10, #8
	add	r4, r4, #76
	beq	.L70
.L67:
	mov	r3, #32
	str	r5, [r4, #60]
	str	r3, [r4, #16]
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r7
	mov	r1, #1
	mov	ip, #240
	cmp	r9, #4
	cmpne	r9, #1
	smull	r2, r3, r0, r8
	stm	sp, {r2-r3}
	ldr	r3, [sp, #4]
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #5
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl r1
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #36
	bic	lr, r9, #2
	str	r5, [r4, #20]
	stm	r4, {r0, ip}
	str	r1, [r4, #8]
	beq	.L71
	cmp	lr, #0
	cmpne	r9, #5
	moveq	r3, #4
	movne	r2, #8
	movne	r3, #3
	streq	r1, [r4, #28]
	streq	r3, [r4, #24]
	strne	r6, [r4, #28]
	strne	r2, [r4, #24]
	str	r3, [r4, #44]
	b	.L65
.L70:
	ldr	r3, .L72+28
	str	ip, [r3]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	rand
	.word	1431655766
	.word	makeMeActive
	.word	currActiveChar
	.word	friends
	.word	shadowOAM
	.word	1808407283
	.word	numActiveFriends
	.size	initOtherPlayer, .-initOtherPlayer
	.align	2
	.global	updateOtherPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateOtherPlayer, %function
updateOtherPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L103
	mov	r5, #0
	mov	r4, r7
	ldr	r6, .L103+4
	ldr	r9, .L103+8
	ldr	r8, .L103+12
	sub	sp, sp, #12
.L88:
	mov	r3, #0
	ldr	r2, [r4, #20]
	cmp	r2, r3
	str	r3, [r4, #56]
	beq	.L76
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L77
	ldr	r10, [r4, #68]
	cmp	r10, #0
	bne	.L76
	ldmib	r4, {r2, r3}
	sub	r3, r2, r3
	ldr	r1, .L103+16
	ldr	ip, [r4, #12]
	and	r0, r3, r1
	ldr	r2, .L103+20
	str	r3, [r4, #4]
	add	r3, r3, ip
	cmp	r3, #1
	ldr	r3, [r4]
	add	fp, r5, r6
	orr	r0, r0, r2
	strh	r0, [fp, #10]	@ movhi
	strh	r3, [fp, #8]	@ movhi
	ble	.L100
	ldr	r3, [r4, #40]
	cmp	r3, #0
	subne	r2, r3, #1
	beq	.L101
.L82:
	str	r2, [r4, #40]
.L76:
	add	r5, r5, #8
	cmp	r5, #56
	add	r4, r4, #76
	bne	.L88
	ldr	r4, .L103+24
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L89
	mov	ip, #1
	ldr	r1, .L103+28
	ldr	r3, [r1]
	add	r2, r3, r3, lsl #3
	cmp	r3, #6
	add	r2, r3, r2, lsl ip
	add	r7, r7, r2, lsl #2
	addne	r3, r3, #1
	str	ip, [r7, #20]
	strne	r3, [r1]
	ldr	r3, .L103+32
	streq	r0, [r1]
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+36
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #76
.L89:
	sub	r0, r0, #1
	str	r0, [r4]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L77:
	mov	lr, #3
	ldr	r3, [r4, #44]
	ldr	r0, [r4, #32]
	ldr	ip, [r4, #72]
	ldrh	r1, [r4, #24]
	ldr	r10, [r4, #40]
	add	fp, ip, r0, lsl #2
	lsl	r3, r3, #28
	add	r2, r1, #20
	add	r2, r2, fp, lsl #5
	sub	r10, r10, #1
	asr	r3, r3, #16
	orr	r2, r3, r2
	add	fp, r5, r6
	cmp	r10, #0
	strh	r2, [fp, #12]	@ movhi
	str	r10, [r4, #40]
	str	lr, [r4, #36]
	bne	.L102
	cmp	r0, #2
	moveq	r0, r10
	mov	lr, #30
	ldr	r2, [r4, #52]
	addne	r0, r0, #1
	sub	r2, r2, #1
	str	r0, [r4, #32]
	str	r2, [r4, #52]
	str	lr, [r4, #40]
.L93:
	cmp	r2, #0
	bne	.L76
	mov	r0, #1
	str	r2, [r4, #48]
	str	r2, [r4, #32]
	ldr	r2, [r4, #28]
	cmp	r2, r0
	moveq	r2, #8
	moveq	ip, r2
	mov	r10, #3
	mov	lr, #2
	str	r0, [r4, #56]
	streq	r2, [r4, #72]
	mov	r0, #1
	mov	r2, #0
	add	r1, r1, #8
	add	ip, r1, ip, lsl #5
	orr	r3, r3, ip
	str	r10, [r4, #52]
	str	lr, [r4, #36]
	strh	r3, [fp, #12]	@ movhi
	str	r2, [r9]
	str	r2, [r8, #44]
	str	r0, [r4, #64]
	b	.L76
.L102:
	ldr	r2, [r4, #52]
	b	.L93
.L101:
	ldr	r1, [r4, #32]
	cmp	r1, #1
	moveq	r1, r3
	ldr	r0, [r4, #72]
	ldr	r3, [r4, #24]
	addne	r1, r1, #1
	add	r0, r0, r1, lsl #2
	add	r3, r3, #8
	add	r3, r3, r0, lsl #5
	ldr	r0, [r4, #44]
	orr	r3, r3, r0, lsl #12
	mov	r2, #29
	str	r1, [r4, #32]
	strh	r3, [fp, #12]	@ movhi
	b	.L82
.L100:
	rsb	r3, ip, #239
	str	r3, [r4, #4]
	ldr	r3, .L103+32
	stm	sp, {r1, r2}
	mov	lr, pc
	bx	r3
	ldr	r1, .L103+40
	smull	r2, r3, r0, r1
	mov	r2, r3
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	ip, r3, r3, lsl #3
	add	r3, r3, ip, lsl #1
	ldr	r1, [sp]
	ldr	ip, [r4, #4]
	sub	r0, r0, r3, lsl #2
	ldr	r2, [sp, #4]
	ldr	r3, .L103+44
	add	r0, r0, #36
	and	r1, r1, ip
	ldr	lr, [r3]
	orr	r2, r1, r2
	orr	r3, r0, #512
	ldr	r1, [r4, #64]
	strh	r3, [fp, #8]	@ movhi
	ldr	r3, .L103+44
	sub	lr, lr, #1
	cmp	r1, #0
	str	r10, [r4, #20]
	str	r0, [r4]
	strh	r2, [fp, #10]	@ movhi
	str	lr, [r3]
	bne	.L80
	ldr	r3, [r8, #56]
	cmp	r3, #0
	bne	.L80
	ldr	r3, .L103+48
	ldr	r3, [r3]
	cmp	r3, #0
	ldrne	r2, .L103+52
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
.L80:
	mov	r3, #0
	str	r3, [r4, #64]
	str	r3, [r4, #72]
	b	.L76
.L104:
	.align	2
.L103:
	.word	friends
	.word	shadowOAM
	.word	currTalking
	.word	player
	.word	511
	.word	-32768
	.word	randTime
	.word	friendMarker
	.word	rand
	.word	1374389535
	.word	1808407283
	.word	numActiveFriends
	.word	playerOn
	.word	friendlyCurrCount
	.size	updateOtherPlayer, .-updateOtherPlayer
	.align	2
	.global	initDistance
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDistance, %function
initDistance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r10, .L109
	mov	r9, r2
	mov	r1, r10
	mov	lr, #16
	mov	r8, #32
	mov	ip, #135
	mov	r7, #21
	mov	r0, #0
	mov	r6, #2
	ldr	r3, .L109+4
	ldr	r5, .L109+8
.L106:
	str	r2, [r3, #4]
	orr	r4, r2, #16384
	add	r2, r2, #16
	cmp	r2, #168
	str	lr, [r3, #12]
	str	r8, [r3, #16]
	str	ip, [r3]
	str	lr, [r3, #24]
	str	r7, [r3, #28]
	str	r0, [r3, #40]
	str	r6, [r3, #44]
	str	r9, [r3, #56]
	str	r0, [r3, #20]
	strh	ip, [r1, #64]	@ movhi
	strh	r5, [r1, #68]	@ movhi
	strh	r4, [r1, #66]	@ movhi
	add	r3, r3, #60
	add	r1, r1, #8
	bne	.L106
	mov	r1, #119
	ldr	r2, .L109+12
	ldr	r3, .L109+16
	strh	r1, [r10, #144]	@ movhi
	strh	r2, [r10, #146]	@ movhi
	strh	r3, [r10, #148]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	shadowOAM
	.word	distance
	.word	-32235
	.word	-32601
	.word	-32233
	.size	initDistance, .-initDistance
	.align	2
	.global	updateDistance
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDistance, %function
updateDistance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L124
	ldr	r2, [r3, #564]
	cmp	r2, #18
	push	{r4, r5, lr}
	bne	.L113
	ldr	r1, .L124+4
	ldr	r2, [r1]
	add	r2, r2, #1
	cmp	r2, #30
	str	r2, [r1]
	moveq	r1, #1
	ldreq	r2, .L124+8
	streq	r1, [r2]
.L113:
	ldr	r2, .L124+12
	ldr	r1, [r2]
	cmp	r1, #180
	beq	.L123
.L115:
	ldr	r1, .L124+16
	ldr	r4, .L124+20
.L117:
	ldr	ip, [r3, #24]
	ldr	r2, [r3, #28]
	ldr	lr, [r3, #56]
	ldr	r0, [r3, #4]
	add	r2, r2, ip, lsl #5
	add	r3, r3, #60
	ldr	ip, [r3, #-60]
	orr	r2, r2, lr, lsl #12
	orr	r0, r0, #16384
	cmp	r3, r4
	strh	r2, [r1, #68]	@ movhi
	strh	r0, [r1, #66]	@ movhi
	strh	ip, [r1, #64]	@ movhi
	add	r1, r1, #8
	bne	.L117
	pop	{r4, r5, lr}
	bx	lr
.L123:
	mov	r4, #1
	mov	lr, #18
	mov	ip, #0
	ldr	r0, .L124+24
	ldr	r1, [r0]
	add	r5, r1, r4
	rsb	r1, r1, r1, lsl #4
	add	r1, r3, r1, lsl #2
	str	r5, [r0]
	str	r4, [r1, #20]
	str	lr, [r1, #24]
	str	ip, [r2]
	b	.L115
.L125:
	.align	2
.L124:
	.word	distance
	.word	distanceTracker
	.word	winGame
	.word	distanceCounter
	.word	shadowOAM
	.word	distance+600
	.word	distanceFull
	.size	updateDistance, .-updateDistance
	.align	2
	.global	initFriendBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFriendBar, %function
initFriendBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #15
	mov	r1, #5
	push	{r4, r5, r6, lr}
	mov	ip, r2
	mov	r0, #16
	mov	r5, #1
	ldr	lr, .L130
	mov	r6, r1
	str	r1, [lr]
	ldr	r3, .L130+4
	ldr	r1, .L130+8
	ldr	r4, .L130+12
.L127:
	str	r2, [r3, #4]
	orr	lr, r2, #16384
	add	r2, r2, #16
	cmp	r2, #95
	str	ip, [r3]
	str	r0, [r3, #8]
	str	r0, [r3, #12]
	str	r5, [r3, #16]
	str	r6, [r3, #24]
	str	r0, [r3, #20]
	strh	ip, [r1, #160]	@ movhi
	strh	r4, [r1, #164]	@ movhi
	strh	lr, [r1, #162]	@ movhi
	add	r3, r3, #28
	add	r1, r1, #8
	bne	.L127
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	friendlyCurrCount
	.word	friendly
	.word	shadowOAM
	.word	21009
	.size	initFriendBar, .-initFriendBar
	.align	2
	.global	updateFriendBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFriendBar, %function
updateFriendBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L140
	push	{r4, r5, lr}
	ldr	r5, [r3]
	cmp	r5, #0
	rsb	r5, r5, #5
	bne	.L133
	mov	r2, #1
	ldr	r3, .L140+4
	str	r2, [r3]
.L134:
	mov	lr, #0
	ldr	r2, .L140+8
	ldr	r1, .L140+12
.L136:
	add	r3, r2, #20
	ldm	r3, {r3, r4}
	ldr	ip, [r2]
	ldr	r0, [r2, #4]
	lsl	r3, r3, #5
	add	lr, lr, #1
	add	r3, r3, #17
	orr	r3, r3, r4, lsl #12
	orr	ip, ip, #512
	orr	r0, r0, #16384
	cmp	lr, r5
	strh	r3, [r1, #196]	@ movhi
	strh	ip, [r1, #192]	@ movhi
	strh	r0, [r1, #194]	@ movhi
	add	r2, r2, #28
	sub	r1, r1, #8
	blt	.L136
	pop	{r4, r5, lr}
	bx	lr
.L133:
	cmp	r5, #0
	bgt	.L134
	pop	{r4, r5, lr}
	bx	lr
.L141:
	.align	2
.L140:
	.word	friendlyCurrCount
	.word	endGame
	.word	friendly
	.word	shadowOAM
	.size	updateFriendBar, .-updateFriendBar
	.align	2
	.global	initTrolley
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTrolley, %function
initTrolley:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L144
	ldr	ip, [r2, #4]
	mvn	r3, ip, lsl #18
	mvn	r3, r3, lsr #18
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r1, #0
	mov	r8, #64
	mov	r7, #32
	mov	r6, #16
	mov	r5, #2
	mov	r4, #30
	mov	lr, #9
	mov	r9, #37376
	ldr	r0, .L144+4
	strh	r3, [r0, #202]	@ movhi
	ldr	r3, .L144+8
	str	ip, [r3, #4]
	ldr	ip, [r2, #8]
	ldr	r2, [r2]
	str	r2, [r3]
	orr	r2, r2, #16896
	strh	r9, [r0, #204]	@ movhi
	str	r8, [r3, #12]
	str	r7, [r3, #16]
	str	r6, [r3, #24]
	str	r5, [r3, #36]
	str	r4, [r3, #40]
	str	lr, [r3, #44]
	str	ip, [r3, #8]
	strh	r2, [r0, #200]	@ movhi
	str	r1, [r3, #20]
	str	r1, [r3, #28]
	str	r1, [r3, #32]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	player
	.word	shadowOAM
	.word	trolley
	.size	initTrolley, .-initTrolley
	.align	2
	.global	updateTrolley
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTrolley, %function
updateTrolley:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L189
	ldr	r3, [r2]
	cmp	r3, #20
	sub	sp, sp, #20
	bgt	.L147
	add	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L189+4
	ldrh	r2, [r2, #48]
	tst	r2, #1
	bne	.L148
	cmp	r3, #21
	beq	.L166
.L148:
	ldr	r5, .L189+8
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L186
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L147:
	ldr	r3, .L189+4
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bne	.L148
.L166:
	mov	r2, #1
	mov	r1, #0
	ldr	r5, .L189+8
	ldr	r3, .L189+12
	ldr	ip, [r5]
	ldr	r9, .L189+16
	ldr	r3, [r3]
	str	r2, [r5, #20]
	orr	r2, ip, #16384
	strh	r2, [r9, #200]	@ movhi
	ldr	r2, .L189+20
	orr	r3, r3, #33280
	strh	r3, [r9]	@ movhi
	str	r1, [r2]
	b	.L149
.L186:
	ldr	ip, [r5]
	ldr	r9, .L189+16
.L149:
	ldr	r4, .L189+24
	mov	r7, #0
	ldr	lr, [r5, #4]
	ldr	r8, .L189+28
	ldr	r10, .L189+32
	ldr	fp, .L189+36
	add	r6, r4, #532
	b	.L156
.L151:
	str	r7, [r4, #68]
.L153:
	cmp	r3, #0
	bne	.L187
	add	r4, r4, #76
	cmp	r6, r4
	beq	.L188
.L156:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L151
	str	lr, [sp, #4]
	str	ip, [sp]
	ldr	lr, [r5, #12]
	ldr	ip, [r5, #16]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L152
	ldm	r5, {ip, lr}
	ldr	r3, [r4, #20]
	b	.L151
.L187:
	str	lr, [sp, #4]
	str	ip, [sp]
	ldr	lr, [r5, #12]
	ldr	ip, [r5, #16]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	ldm	r4, {r0, r1}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, .L189+40
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [r8]
	strne	r7, [r4, #68]
	subne	r3, r3, #1
	add	r4, r4, #76
	strne	r3, [r8]
	strne	r2, [r10]
	cmp	r6, r4
	ldm	r5, {ip, lr}
	bne	.L156
.L188:
	ldr	r3, .L189+4
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L157
	ldr	r2, [r10]
	cmp	r2, #0
	bne	.L158
	ldr	r3, .L189+44
	ldr	r3, [r3]
	cmp	r3, ip
	ldrlt	r3, [r5, #8]
	sublt	ip, ip, r3
	strlt	ip, [r5]
.L159:
	ldr	r3, .L189+4
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L160
.L167:
	ldr	r3, .L189+48
	ldr	r2, [r5, #16]
	ldr	r3, [r3]
	sub	r3, r3, r2
	cmp	r3, ip
	ldrgt	r3, [r5, #8]
	addgt	ip, ip, r3
	strgt	ip, [r5]
.L160:
	ldr	r3, [r5, #40]
	ldr	r2, [r5, #32]
	cmp	r3, #0
	lslne	r3, r2, #2
	bne	.L162
	add	r2, r2, #1
	cmp	r2, #2
	strne	r2, [r5, #32]
	lslne	r3, r2, #2
	mov	r2, #30
	streq	r3, [r5, #32]
	str	r2, [r5, #40]
.L162:
	mvn	lr, lr, lsl #18
	mvn	lr, lr, lsr #18
	ldr	r2, [r5, #24]
	add	r2, r3, r2
	ldr	r3, [r5, #28]
	add	r3, r3, r2, lsl #5
	ldr	r2, [r5, #44]
	orr	r3, r3, r2, lsl #12
	ldr	r2, [r8]
	orr	ip, ip, #16384
	cmp	r2, #0
	strh	lr, [r9, #202]	@ movhi
	strh	ip, [r9, #200]	@ movhi
	strh	r3, [r9, #204]	@ movhi
	bne	.L165
	ldr	r1, .L189+52
	ldr	r3, [r5, #40]
	ldr	r2, [r1]
	sub	r3, r3, #1
	add	r2, r2, #1
	str	r2, [r1]
	str	r3, [r5, #40]
.L165:
	mov	r3, #0
	str	r3, [r10]
	str	r3, [r8]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L152:
	mov	r2, #1
	ldr	r3, [r8]
	add	r3, r3, r2
	str	r3, [r8]
	str	r2, [r4, #68]
	ldm	r5, {ip, lr}
	ldr	r3, [r4, #20]
	b	.L153
.L157:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L160
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L160
	b	.L167
.L158:
	ldrh	r3, [r3, #48]
	b	.L160
.L190:
	.align	2
.L189:
	.word	trolleyCounter
	.word	67109120
	.word	trolley
	.word	player
	.word	shadowOAM
	.word	playerOn
	.word	friends
	.word	trolleyColliding
	.word	trolleyClashing
	.word	collision
	.word	clashing
	.word	walkBegin
	.word	walkEnd
	.word	distanceCounter
	.size	updateTrolley, .-updateTrolley
	.align	2
	.global	initClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	initClock, %function
initClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	mov	ip, #5
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #32
	mov	r8, #192
	mov	r7, #1
	mov	r6, #24
	mov	r5, #16
	mov	r4, #200
	mov	lr, #33536
	mov	r1, #0
	ldr	r3, .L193
	str	r2, [r3, #40]
	ldr	r2, .L193+4
	str	ip, [r3]
	strh	ip, [r2, #208]	@ movhi
	ldr	ip, .L193+8
	str	r8, [r3, #4]
	str	r7, [r3, #16]
	str	r6, [r3, #20]
	str	r5, [r3, #32]
	str	r4, [r3, #36]
	strh	lr, [r2, #212]	@ movhi
	str	r0, [r3, #8]
	strh	ip, [r2, #210]	@ movhi
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	clock
	.word	shadowOAM
	.word	-32576
	.size	initClock, .-initClock
	.align	2
	.global	updateClock
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateClock, %function
updateClock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L204
	ldr	r2, [r3, #36]
	cmp	r2, #0
	subne	r2, r2, #1
	bne	.L201
	ldr	r0, [r3, #24]
	cmp	r0, #22
	ldr	r1, [r3, #20]
	ble	.L198
	cmp	r1, #24
	beq	.L203
	cmp	r0, #26
	ble	.L198
	cmp	r1, #28
	bne	.L198
	mov	r0, #1
	mvn	r2, #0
	ldr	r1, .L204+4
	str	r0, [r1]
.L201:
	str	r2, [r3, #36]
	bx	lr
.L198:
	mov	r2, #199
	str	lr, [sp, #-4]!
	add	r0, r0, #4
	ldr	lr, [r3, #40]
	add	r1, r0, r1, lsl #5
	ldr	ip, .L204+8
	orr	r1, r1, lr, lsl #12
	str	r0, [r3, #24]
	strh	r1, [ip, #212]	@ movhi
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L203:
	mov	r0, #28
	ldr	r1, [r3, #40]
	ldr	ip, .L204+8
	lsl	r1, r1, #12
	orr	r1, r1, #896
	str	r2, [r3, #24]
	strh	r1, [ip, #212]	@ movhi
	str	r0, [r3, #20]
	mov	r2, #199
	b	.L201
.L205:
	.align	2
.L204:
	.word	clock
	.word	endGame
	.word	shadowOAM
	.size	updateClock, .-updateClock
	.align	2
	.global	initInvis
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInvis, %function
initInvis:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L210
	ldr	r5, .L210+4
.L207:
	ldr	r3, .L210+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	lr, #3
	mov	r10, #1
	str	r3, [r4, #20]
	str	r3, [r4, #36]
	mov	r3, #16
	mov	r2, #32
	mov	fp, #240
	mov	r9, #28
	mov	ip, #30
	mov	r1, #6
	ldr	r6, .L210+12
	smull	r7, r8, r0, r6
	asr	r6, r0, #31
	rsb	r6, r6, r8, asr #5
	add	r7, r6, r6, lsl lr
	add	r6, r6, r7, lsl r10
	sub	r0, r0, r6, lsl #2
	str	r3, [r4, #28]
	add	r0, r0, #36
	ldr	r3, .L210+16
	stm	r4, {r0, fp}
	str	r10, [r4, #8]
	str	r2, [r4, #12]
	str	r2, [r4, #16]
	str	r9, [r4, #24]
	str	lr, [r4, #40]
	str	ip, [r4, #44]
	str	r1, [r4, #52]
	add	r4, r4, #56
	cmp	r4, r3
	ldr	r3, .L210+20
	strh	r3, [r5, #218]	@ movhi
	ldr	r3, .L210+24
	orr	r0, r0, #512
	strh	r3, [r5, #220]	@ movhi
	strh	r0, [r5, #216]	@ movhi
	add	r5, r5, #8
	bne	.L207
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L211:
	.align	2
.L210:
	.word	invis
	.word	shadowOAM
	.word	rand
	.word	1808407283
	.word	invis+280
	.word	16624
	.word	25116
	.size	initInvis, .-initInvis
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	ldr	r3, .L214
	ldr	lr, .L214+4
	ldr	ip, .L214+8
	ldr	r1, .L214+12
	str	r4, [r3]
	ldr	r2, .L214+16
	ldr	r3, .L214+20
	ldr	r0, .L214+24
	ldr	r5, .L214+28
	str	r4, [lr]
	str	r4, [ip]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	str	r4, [r0]
	mov	lr, pc
	bx	r5
	ldr	r3, .L214+32
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	r2, .L214+36
	sub	r3, r0, r3, lsl #1
	add	r3, r3, #23
	str	r3, [r2]
	mov	lr, pc
	bx	r5
	mov	r5, #1
	mov	r2, #36
	mov	ip, #144
	mov	r1, #600
	ldr	r3, .L214+40
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #5
	add	r6, r3, r3, lsl #3
	add	r3, r3, r6, lsl r5
	sub	r0, r0, r3, lsl #2
	ldr	r3, .L214+44
	str	r4, [r3]
	ldr	r3, .L214+48
	str	r4, [r3]
	ldr	r3, .L214+52
	add	r0, r0, #120
	str	r0, [r3]
	ldr	r3, .L214+56
	ldr	lr, .L214+60
	ldr	r0, .L214+64
	str	r2, [r3]
	ldr	r2, .L214+68
	ldr	r3, .L214+72
	str	r4, [lr]
	str	ip, [r0]
	str	r1, [r2]
	str	r5, [r3]
	bl	initMainPlayer
	bl	initDistance
	bl	initOtherPlayer
	bl	initFriendBar
	mov	ip, #200
	mov	r1, #5
	mov	r0, #33536
	mov	lr, #8
	mov	r2, #32
	mov	r8, #192
	mov	r7, #24
	mov	r6, #16
	ldr	r3, .L214+76
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	ip, [r3, #36]
	ldr	r4, .L214+80
	ldr	ip, .L214+84
	strh	r1, [r4, #208]	@ movhi
	strh	ip, [r4, #210]	@ movhi
	strh	r0, [r4, #212]	@ movhi
	str	lr, [r3, #40]
	str	r5, [r3, #16]
	str	r8, [r3, #4]
	str	r7, [r3, #20]
	str	r6, [r3, #32]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initInvis
	bl	initTrolley
	mov	r1, r4
	mov	r3, #512
	ldr	r4, .L214+88
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L215:
	.align	2
.L214:
	.word	distanceTracker
	.word	trolleyClashing
	.word	trolleyColliding
	.word	friendMarker
	.word	distanceFull
	.word	distanceCounter
	.word	trolleyCounter
	.word	rand
	.word	1374389535
	.word	randTime
	.word	1808407283
	.word	endGame
	.word	winGame
	.word	invisRandTime
	.word	walkBegin
	.word	randCounter
	.word	walkEnd
	.word	foodMarker
	.word	playerOn
	.word	clock
	.word	shadowOAM
	.word	-32576
	.word	DMANow
	.size	initGame, .-initGame
	.align	2
	.global	updateInvis
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInvis, %function
updateInvis:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L233
	ldr	r3, [r10]
	cmp	r3, #0
	bne	.L217
	ldr	r0, .L233+4
	mov	r2, r0
.L220:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L231
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #56
	bne	.L220
.L219:
	ldr	r3, .L233+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L233+12
	smull	r4, r5, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r5, asr #5
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #1
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #700
	str	r0, [r10]
.L217:
	ldr	r4, .L233+4
	ldr	r5, .L233+16
	ldr	r7, .L233+8
	ldr	r6, .L233+12
	ldr	r9, .L233+20
	add	r8, r4, #280
.L226:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ldr	r3, [r4, #4]
	beq	.L221
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #8]
	sub	r2, r2, #1
	sub	r3, r3, r1
	cmp	r2, #0
	str	r2, [r4, #44]
	str	r3, [r4, #4]
	bne	.L222
	ldr	r1, [r4, #36]
	cmp	r1, #2
	moveq	r1, r2
	mov	r2, #30
	addne	r1, r1, #1
	str	r1, [r4, #36]
	str	r2, [r4, #44]
.L222:
	ldr	r2, [r4, #12]
	add	r1, r2, r3
	cmp	r1, #1
	ble	.L232
.L225:
	ldr	r0, [r4, #36]
	ldr	r1, [r4, #28]
	ldr	r2, [r4, #24]
	add	r1, r1, r0, lsl #1
	ldr	r0, [r4, #52]
	and	r3, r3, r9
	add	r2, r2, r1, lsl #5
	add	r4, r4, #56
	orr	r3, r3, #16384
	orr	r2, r2, r0, lsl #12
	cmp	r8, r4
	strh	r3, [r5, #218]	@ movhi
	strh	r2, [r5, #220]	@ movhi
	add	r5, r5, #8
	bne	.L226
	ldr	r3, [r10]
	sub	r3, r3, #1
	str	r3, [r10]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L221:
	ldr	r2, [r4]
	orr	r2, r2, #512
	strh	r2, [r5, #216]	@ movhi
	ldr	r2, [r4, #12]
	add	r1, r2, r3
	cmp	r1, #1
	bgt	.L225
.L232:
	rsb	r2, r2, #239
	str	r2, [r4, #4]
	mov	lr, pc
	bx	r7
	mov	r1, #0
	smull	fp, ip, r0, r6
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #5
	add	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #1
	sub	r0, r0, r3, lsl #2
	add	r0, r0, #36
	orr	r3, r0, #512
	strh	r3, [r5, #216]	@ movhi
	str	r0, [r4]
	str	r1, [r4, #20]
	ldr	r3, [r4, #4]
	b	.L225
.L231:
	mov	lr, #1
	rsb	r2, r3, r3, lsl #3
	lsl	r2, r2, #3
	add	r1, r0, r2
	ldr	ip, [r0, r2]
	ldr	r0, [r1, #12]
	ldr	r2, .L233+16
	rsb	r0, r0, #239
	add	r3, r2, r3, lsl #3
	str	lr, [r1, #20]
	str	r0, [r1, #4]
	strh	ip, [r3, #216]	@ movhi
	b	.L219
.L234:
	.align	2
.L233:
	.word	invisRandTime
	.word	invis
	.word	rand
	.word	1808407283
	.word	shadowOAM
	.word	511
	.size	updateInvis, .-updateInvis
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L241
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	blne	updateMainPlayer
.L236:
	bl	updateOtherPlayer
	bl	updateFriendBar
	bl	updateClock
	bl	updateDistance
	bl	updateInvis
	pop	{r4, lr}
	b	updateTrolley
.L242:
	.align	2
.L241:
	.word	playerOn
	.size	updateGame, .-updateGame
	.comm	distanceTracker,4,4
	.comm	trolleyColliding,4,4
	.comm	trolleyClashing,4,4
	.comm	trolleyCounter,4,4
	.comm	playerOn,4,4
	.comm	invisRandTime,4,4
	.comm	friendMarker,4,4
	.comm	currTalking,4,4
	.comm	distanceFull,4,4
	.comm	distanceCounter,4,4
	.comm	randFri,4,4
	.comm	randTime,4,4
	.comm	randCounter,4,4
	.comm	makeMeActive,4,4
	.comm	currActiveChar,4,4
	.comm	characterSelected,4,4
	.comm	randRow,4,4
	.comm	winGame,4,4
	.comm	endGame,4,4
	.comm	foodMarker,4,4
	.comm	foodCurrCount,4,4
	.comm	friendlyCurrCount,4,4
	.comm	numActiveFriends,4,4
	.comm	walkEnd,4,4
	.comm	walkBegin,4,4
	.comm	trolley,48,4
	.comm	clock,44,4
	.comm	player,68,4
	.comm	invis,280,4
	.comm	friendly,140,4
	.comm	distance,600,4
	.comm	friends,532,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
