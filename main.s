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
	.file	"main.c"
	.text
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L11+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L11+8
	ldr	r3, .L11+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+20
	ldr	r2, .L11+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.word	instructScreen1Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions2
	.size	instructions, .-instructions
	.align	2
	.global	instructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions2, %function
instructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L22+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L22+8
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+20
	ldr	r2, .L22+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.word	instructScreen3Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions3
	.size	instructions2, .-instructions2
	.align	2
	.global	instructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions3, %function
instructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L33+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L33+8
	ldr	r3, .L33+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+20
	ldr	r2, .L33+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.word	instructScreen4Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions4
	.size	instructions3, .-instructions3
	.align	2
	.global	instructions4
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions4, %function
instructions4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r0, .L44+8
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+20
	ldr	r2, .L44+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.word	instructScreen5Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions5
	.size	instructions4, .-instructions4
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L58
	ldr	r3, [r4]
	ldr	r5, .L58+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L58+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r2, .L58+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L56
.L47:
	tst	r3, #4
	beq	.L46
	ldr	r3, .L58+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L57
.L46:
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	ldr	r0, [r4]
	ldr	r3, .L58+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+20
	ldr	r0, .L58+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L58+28
	ldr	r2, .L58+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L56:
	ldr	r0, [r4]
	ldr	r3, .L58+16
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L58+36
	ldr	r0, .L58+40
	strh	r2, [r3]	@ movhi
	ldr	r3, .L58+20
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L58+28
	ldr	r2, .L58+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	drawFullscreenImage3
	.word	instructScreen2Bitmap
	.word	state
	.word	instructions
	.word	1027
	.word	charScreenBitmap
	.word	character
	.size	start, .-start
	.align	2
	.global	instructions5
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions5, %function
instructions5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r3, #67108864
	ldr	r2, .L69+8
	push	{r4, lr}
	ldr	r0, .L69+12
	strh	r2, [r3]	@ movhi
	ldr	r3, .L69+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+24
	ldr	r2, .L69+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	buttons
	.word	1027
	.word	charScreenBitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	character
	.size	instructions5, .-instructions5
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L73
	push	{r4, lr}
	mov	r3, #1
	strh	r1, [r2]	@ movhi
	ldr	r0, .L73+4
	ldr	r2, .L73+8
	ldr	r1, .L73+12
	ldr	r4, .L73+16
	mov	lr, pc
	bx	r4
	ldr	r0, .L73+20
	ldr	r3, .L73+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+28
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r1, .L73+32
	ldr	r3, .L73+36
	ldr	r2, .L73+40
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	1027
	.word	titleSong
	.word	11025
	.word	2051136
	.word	playSoundA
	.word	startScreenBitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	seed
	.word	state
	.word	start
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldr	r3, .L76
	ldr	r0, .L76+4
	ldrh	r2, [r3, #48]
	ldr	r3, .L76+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L77:
	.align	2
.L76:
	.word	67109120
	.word	1027
	.word	buttons
	.size	initialize, .-initialize
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r5, .L81
	ldr	r1, .L81+4
	ldrh	r2, [r5, #48]
	ldr	r4, .L81+8
	push	{r7, lr}
	strh	r1, [r3]	@ movhi
	ldr	r3, .L81+12
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+20
	mov	lr, pc
	bx	r3
	ldr	r7, .L81+24
	ldr	r6, .L81+28
.L79:
	ldrh	r3, [r4]
	strh	r3, [r7]	@ movhi
	ldrh	r2, [r5, #48]
	ldr	r3, [r6]
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	b	.L79
.L82:
	.align	2
.L81:
	.word	67109120
	.word	1027
	.word	buttons
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	oldButtons
	.word	state
	.size	main, .-main
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L88
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L88+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L89:
	.align	2
.L88:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L93
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+12
	ldr	r2, .L93+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L94:
	.align	2
.L93:
	.word	instructScreen2Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToInstructions2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions2, %function
goToInstructions2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L97
	ldr	r3, .L97+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+12
	ldr	r2, .L97+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L98:
	.align	2
.L97:
	.word	instructScreen1Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions2
	.size	goToInstructions2, .-goToInstructions2
	.align	2
	.global	goToInstructions3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions3, %function
goToInstructions3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L101
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L101+12
	ldr	r2, .L101+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L102:
	.align	2
.L101:
	.word	instructScreen3Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions3
	.size	goToInstructions3, .-goToInstructions3
	.align	2
	.global	goToInstructions4
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions4, %function
goToInstructions4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L105
	ldr	r3, .L105+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+12
	ldr	r2, .L105+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L106:
	.align	2
.L105:
	.word	instructScreen4Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions4
	.size	goToInstructions4, .-goToInstructions4
	.align	2
	.global	goToInstructions5
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions5, %function
goToInstructions5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L109
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+12
	ldr	r2, .L109+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L110:
	.align	2
.L109:
	.word	instructScreen5Bitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	instructions5
	.size	goToInstructions5, .-goToInstructions5
	.align	2
	.global	goToCharacter
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCharacter, %function
goToCharacter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L113
	push	{r4, lr}
	ldr	r0, .L113+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L113+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+16
	ldr	r2, .L113+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L114:
	.align	2
.L113:
	.word	1027
	.word	charScreenBitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	character
	.size	goToCharacter, .-goToCharacter
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #4864
	mov	r5, #67108864
	ldr	r4, .L117
	strh	r3, [r5]	@ movhi
	ldr	r3, .L117+4
	mov	lr, pc
	bx	r3
	ldr	r6, .L117+8
	mov	r2, r4
	mov	r3, #1
	ldr	r1, .L117+12
	ldr	r0, .L117+16
	mov	lr, pc
	bx	r6
	mov	r2, r4
	mov	r3, #0
	ldr	r1, .L117+20
	ldr	r0, .L117+24
	ldr	r4, .L117+28
	mov	lr, pc
	bx	r4
	ldr	r4, .L117+32
	mov	r3, #1024
	mov	r2, #100663296
	ldr	r1, .L117+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L117+40
	ldr	r1, .L117+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #816
	ldr	r2, .L117+48
	ldr	r1, .L117+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L117+56
	ldr	r1, .L117+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L117+64
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L117+68
	ldr	r1, .L117+72
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L117+76
	ldr	r1, .L117+80
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L117+84
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L117+88
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L117+92
	ldr	r3, .L117+96
	strh	r3, [r5, #8]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	ldr	r3, .L117+100
	mov	lr, pc
	bx	r3
	ldr	r3, .L117+104
	ldr	r2, .L117+108
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L118:
	.align	2
.L117:
	.word	11025
	.word	stopSound
	.word	playSoundA
	.word	847594
	.word	GameSong
	.word	57888
	.word	ticking
	.word	playSoundB
	.word	DMANow
	.word	gameBG1Tiles
	.word	100720640
	.word	gameBG1Map
	.word	100679680
	.word	gameBG2Tiles
	.word	100714496
	.word	gameBG2Map
	.word	gameBG1Pal
	.word	100728832
	.word	spriteSheetTiles
	.word	83886592
	.word	spriteSheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	22789
	.word	23553
	.word	initGame
	.word	state
	.word	game
	.size	goToGame, .-goToGame
	.align	2
	.global	character
	.syntax unified
	.arm
	.fpu softvfp
	.type	character, %function
character:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L129
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L120
	ldr	r2, .L129+4
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L128
.L120:
	tst	r3, #2
	bxeq	lr
	ldr	r3, .L129+4
	ldrh	r3, [r3]
	tst	r3, #2
	bxne	lr
	mov	r2, #1
.L128:
	ldr	r3, .L129+8
	str	r2, [r3]
	b	goToGame
.L130:
	.align	2
.L129:
	.word	oldButtons
	.word	buttons
	.word	characterSelected
	.size	character, .-character
	.align	2
	.global	goToGamePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGamePause, %function
goToGamePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4864
	mov	r5, #67108864
	ldr	r3, .L133
	strh	r2, [r5]	@ movhi
	ldr	r4, .L133+4
	mov	lr, pc
	bx	r3
	mov	r3, #1024
	mov	r2, #100663296
	ldr	r1, .L133+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L133+12
	ldr	r1, .L133+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #816
	ldr	r2, .L133+20
	ldr	r1, .L133+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L133+28
	ldr	r1, .L133+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L133+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L133+40
	ldr	r1, .L133+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L133+48
	ldr	r1, .L133+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L133+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r0, .L133+60
	ldr	r1, .L133+64
	ldr	r3, .L133+68
	ldr	r2, .L133+72
	strh	r0, [r5, #8]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	unpauseSound
	.word	DMANow
	.word	gameBG1Tiles
	.word	100720640
	.word	gameBG1Map
	.word	100679680
	.word	gameBG2Tiles
	.word	100714496
	.word	gameBG2Map
	.word	gameBG1Pal
	.word	100728832
	.word	spriteSheetTiles
	.word	83886592
	.word	spriteSheetPal
	.word	shadowOAM
	.word	23553
	.word	22789
	.word	state
	.word	game
	.size	goToGamePause, .-goToGamePause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L140
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	ldrh	r3, [r1]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L140+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGamePause
.L141:
	.align	2
.L140:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #768
	mov	r4, #67108864
	ldr	r3, .L144
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r2, .L144+4
	ldr	r3, .L144+8
	strh	r0, [r4, #16]	@ movhi
	strh	r2, [r4, #80]	@ movhi
	strh	r0, [r4, #18]	@ movhi
	strh	r3, [r4, #82]	@ movhi
	strh	r0, [r4, #20]	@ movhi
	ldr	r5, .L144+12
	strh	r0, [r4, #22]	@ movhi
	mov	r3, #3040
	ldr	r2, .L144+16
	ldr	r1, .L144+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L144+24
	ldr	r1, .L144+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L144+32
	ldr	r3, .L144+36
	strh	r2, [r4, #10]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L144+40
	ldr	r2, .L144+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L145:
	.align	2
.L144:
	.word	pauseSound
	.word	4418
	.word	2056
	.word	DMANow
	.word	100679680
	.word	pauseScreenTiles
	.word	100714496
	.word	pauseScreenMap
	.word	6404
	.word	waitForVBlank
	.word	state
	.word	pause
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L148
	push	{r4, lr}
	ldr	r3, .L148+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r0, .L148+8
	ldr	r3, .L148+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L148+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L148+20
	ldr	r2, .L148+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L149:
	.align	2
.L148:
	.word	1027
	.word	stopSound
	.word	winScreenBitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	win
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L152
	push	{r4, lr}
	ldr	r3, .L152+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r0, .L152+8
	ldr	r3, .L152+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+20
	ldr	r2, .L152+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L153:
	.align	2
.L152:
	.word	1027
	.word	stopSound
	.word	loseScreenBitmap
	.word	drawFullscreenImage3
	.word	waitForVBlank
	.word	state
	.word	lose
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L171
	mov	lr, pc
	bx	r3
	ldr	r4, .L171+4
	ldr	r3, .L171+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L171+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	moveq	r2, #3
	ldreq	r5, .L171+16
	ldreq	r3, [r5]
	addeq	r3, r3, #1
	streq	r3, [r5]
	ldr	r3, .L171+20
	ldrh	r3, [r3]
	ldrne	r5, .L171+16
	streq	r2, [r4]
	tst	r3, #8
	beq	.L156
	ldr	r3, .L171+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L168
.L156:
	ldr	r3, .L171+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L169
	ldr	r3, .L171+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L170
.L157:
	mov	r1, #67108864
	ldrh	r0, [r5]
	ldr	r2, [r4]
	lsl	r3, r0, #17
	lsr	r3, r3, #16
	sub	r2, r2, #1
	str	r2, [r4]
	strh	r3, [r1, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r0, [r1, #20]	@ movhi
	bx	lr
.L170:
	bl	goToLose
	b	.L157
.L169:
	bl	goToWin
	b	.L157
.L168:
	bl	goToPause
	b	.L157
.L172:
	.align	2
.L171:
	.word	updateGame
	.word	.LANCHOR0
	.word	drawGame
	.word	waitForVBlank
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	winGame
	.word	endGame
	.size	game, .-game
	.comm	characterSelected,4,4
	.global	hOffCounter
	.global	vOff
	.global	hOff
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOffCounter, %object
	.size	hOffCounter, 4
hOffCounter:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
