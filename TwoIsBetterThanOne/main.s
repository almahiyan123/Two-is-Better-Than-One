	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L3+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #12
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #160
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #1
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L3+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L3+16
	mov	r0, #16777216
	strh	r5, [fp, #2]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L3+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #0]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #2]	@ movhi
	mov	r3, #1
	ldr	r7, .L3+24
	str	r9, [r4, #16]
	str	r3, [r4, #12]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L3
	ldmia	r3, {r2-r3}
	ldr	ip, .L3+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L3+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L3+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L4:
	.align	3
.L3:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #67108864
	add	r3, r3, #512
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L6
	ldr	r2, .L15
	ldr	r3, [r2, #12]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L7
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L12
	ldr	r1, .L15+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #12
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #2]	@ movhi
.L7:
	ldr	r2, .L15+8
	ldr	r3, [r2, #12]
	cmp	r3, #0
	bne	.L13
.L9:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L6:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r3, lr}
	bx	lr
.L13:
	ldr	r3, [r2, #28]
	ldr	r1, [r2, #20]
	add	r3, r3, #1
	cmp	r3, r1
	str	r3, [r2, #28]
	ble	.L9
	ldr	r3, [r2, #16]
	cmp	r3, #0
	bne	.L14
	ldr	r1, .L15+4
	ldr	r0, [r1, #0]
	mov	r1, #67108864
	add	r0, r0, #24
	add	r1, r1, #256
	str	r3, [r0, #8]
	str	r3, [r2, #12]
	strh	r3, [r1, #6]	@ movhi
	b	.L9
.L12:
	ldmia	r2, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	b	.L7
.L14:
	ldmia	r2, {r0, r1}	@ phole ldm
	ldr	ip, .L15+12
	ldr	r2, [r2, #8]
	mov	lr, pc
	bx	ip
	b	.L9
.L16:
	.align	2
.L15:
	.word	soundA
	.word	dma
	.word	soundB
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L18
	str	r3, [r2, #12]
	ldr	r2, .L18+4
	str	r3, [r2, #12]
	bx	lr
.L19:
	.align	2
.L18:
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	mov	r1, #128
	strh	r1, [r3, #2]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	ldr	r3, .L21
	mov	r2, #1
	str	r2, [r3, #12]
	ldr	r3, .L21+4
	str	r2, [r3, #12]
	bx	lr
.L22:
	.align	2
.L21:
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	r1, [r3, #0]
	mov	r2, #67108864
	mov	r3, #0
	add	r2, r2, #256
	add	r0, r1, #12
	add	r1, r1, #24
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L24+4
	str	r3, [r2, #12]
	ldr	r2, .L24+8
	str	r3, [r2, #12]
	bx	lr
.L25:
	.align	2
.L24:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L27
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L28:
	.align	2
.L27:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	gotoStart
	.type	gotoStart, %function
gotoStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	mov	r2, #768	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L30+8
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L30+16
	mov	r0, #3
	ldr	r1, .L30+20
	mov	r2, r5
	mov	r3, #2640
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L30+24
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L30+28
	add	r2, r5, #16384
	mov	r3, #1360
	mov	lr, pc
	bx	r4
	add	r2, r5, #59392
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L30+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L30+36
	ldr	r3, .L30+40
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	hideSprites
	.word	copyShadowOAM
	.word	start_bgPal
	.word	loadPalette
	.word	DMANow
	.word	start_bgTiles
	.word	start_bgMap
	.word	start_bgscrollTiles
	.word	start_bgscrollMap
	.word	updateStart
	.word	state
	.size	gotoStart, .-gotoStart
	.align	2
	.global	updateInstruct
	.type	updateInstruct, %function
updateInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L34+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	gotoStart
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.size	updateInstruct, .-updateInstruct
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L39
	ldr	r4, .L39+4
	ldr	r2, [r2, #0]
	ldr	r3, [r4, #0]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4, #0]
	beq	.L37
	ldr	r2, .L39+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L38
.L37:
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, #67108864
	strh	r3, [r2, #20]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L38:
	mov	r1, #311296
	add	r1, r1, #2816
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L39+12
	add	r1, r1, #8
	add	r2, r2, #17
	bl	playSoundA
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L37
.L40:
	.align	2
.L39:
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	TitleSong
	.size	updateLose, .-updateLose
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L44
	ldr	r4, .L44+4
	ldr	r2, [r2, #0]
	ldr	r3, [r4, #0]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4, #0]
	beq	.L42
	ldr	r2, .L44+8
	ldr	r0, [r2, #0]
	ands	r0, r0, #8
	beq	.L43
.L42:
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r2, #67108864
	strh	r3, [r2, #20]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	ldr	r3, .L44+12
	mov	lr, pc
	bx	r3
	mov	r1, #311296
	add	r1, r1, #2816
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L44+16
	add	r1, r1, #8
	add	r2, r2, #17
	bl	playSoundA
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L42
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	initialize
	.word	TitleSong
	.size	updateWin, .-updateWin
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r3, #23808
	mov	r4, #67108864
	mov	r2, #7936	@ movhi
	add	r3, r3, #4
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	bl	gotoStart
	mvn	r3, #1264
	mov	ip, #0
	sub	r3, r3, #1
	mov	lr, #128	@ movhi
	strh	lr, [r4, #132]	@ movhi
	strh	ip, [r4, #128]	@ movhi
	strh	r3, [r4, #130]	@ movhi
	add	r3, r4, #512
	ldrh	r1, [r3, #0]
	ldr	r0, .L48+8
	mov	r2, #50331648
	add	r2, r2, #28672
	orr	r1, r1, #1
	str	r0, [r2, #4092]
	strh	r1, [r3, #0]	@ movhi
	ldrh	r0, [r4, #4]
	mov	lr, #1	@ movhi
	orr	r0, r0, #8
	strh	r0, [r4, #4]	@ movhi
	mov	r1, #311296
	strh	lr, [r3, #8]	@ movhi
	ldr	lr, .L48+12
	add	r1, r1, #2816
	mov	r2, #11008
	ldr	r0, .L48+16
	add	r1, r1, #8
	add	r2, r2, #17
	mov	r3, #1
	str	ip, [lr, #0]
	bl	playSoundA
	ldr	sl, .L48+20
	ldr	r5, .L48+24
	ldr	r8, .L48+28
	ldr	r7, .L48+32
	ldr	r6, .L48+36
.L47:
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #304]
	str	r2, [sl, #0]
	str	r3, [r5, #0]
	ldr	ip, [r8, #0]
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	b	.L47
.L49:
	.align	2
.L48:
	.word	hideSprites
	.word	initialize
	.word	interruptHandler
	.word	hOff
	.word	TitleSong
	.word	oldButtons
	.word	buttons
	.word	state
	.word	copyShadowOAM
	.word	waitForVblank
	.size	main, .-main
	.align	2
	.global	gotoGame
	.type	gotoGame, %function
gotoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L51
	ldr	r3, .L51+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L51+8
	mov	r0, #3
	ldr	r1, .L51+12
	mov	r2, r5
	mov	r3, #1104
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L51+16
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L51+20
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L51+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L51+28
	ldr	r3, .L51+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	game_bgPal
	.word	loadPalette
	.word	DMANow
	.word	game_bgTiles
	.word	game_bgMap
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateGame
	.word	state
	.size	gotoGame, .-gotoGame
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L55
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L55+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	gotoGame
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	gotoGame2
	.type	gotoGame2, %function
gotoGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L58+8
	ldr	r3, .L58+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L58+16
	mov	r0, #3
	ldr	r1, .L58+20
	mov	r2, r5
	mov	r3, #640
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L58+24
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L58+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L58+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L58+36
	ldr	r3, .L58+40
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	hideSprites
	.word	copyShadowOAM
	.word	game2_bgPal
	.word	loadPalette
	.word	DMANow
	.word	game2_bgTiles
	.word	game2_bgMap
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateGame2
	.word	state
	.size	gotoGame2, .-gotoGame2
	.align	2
	.global	gameFunctions
	.type	gameFunctions, %function
gameFunctions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #0
	ldr	r3, .L61
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L61+8
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L61+12
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L61+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+32
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	actPlayers
	.word	updateLives
	.word	moveBullets
	.word	moveEnemies
	.word	moveObjects
	.word	drawCharacters
	.word	drawEnemies
	.word	drawBullets
	.word	drawObjects
	.size	gameFunctions, .-gameFunctions
	.align	2
	.global	gotoPause
	.type	gotoPause, %function
gotoPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L64
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L64+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L64+8
	mov	r0, #3
	ldr	r1, .L64+12
	mov	r2, #100663296
	mov	r3, #5184
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L64+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L64+20
	ldr	r3, .L64+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	instructionsPal
	.word	loadPalette
	.word	DMANow
	.word	instructionsTiles
	.word	instructionsMap
	.word	updatePause
	.word	state
	.size	gotoPause, .-gotoPause
	.align	2
	.global	gotoWin
	.type	gotoWin, %function
gotoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #768	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L67
	ldr	r3, .L67+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L67+8
	mov	r0, #3
	ldr	r1, .L67+12
	mov	r2, r5
	mov	r3, #1168
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L67+16
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L67+20
	add	r2, r5, #16384
	mov	r3, #1360
	mov	lr, pc
	bx	r4
	add	r2, r5, #59392
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L67+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L67+28
	ldr	r3, .L67+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	win_bgPal
	.word	loadPalette
	.word	DMANow
	.word	win_bgTiles
	.word	win_bgMap
	.word	start_bgscrollTiles
	.word	start_bgscrollMap
	.word	updateWin
	.word	state
	.size	gotoWin, .-gotoWin
	.align	2
	.global	gotoLose
	.type	gotoLose, %function
gotoLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r2, #768	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L70
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L70+8
	mov	r0, #3
	ldr	r1, .L70+12
	mov	r2, r5
	mov	r3, #1696
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L70+16
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L70+20
	add	r2, r5, #16384
	mov	r3, #1360
	mov	lr, pc
	bx	r4
	add	r2, r5, #59392
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L70+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L70+28
	ldr	r3, .L70+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	gameover_bgPal
	.word	loadPalette
	.word	DMANow
	.word	gameover_bgTiles
	.word	gameover_bgMap
	.word	start_bgscrollTiles
	.word	start_bgscrollMap
	.word	updateLose
	.word	state
	.size	gotoLose, .-gotoLose
	.align	2
	.global	updateGame2
	.type	updateGame2, %function
updateGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L73
	ldr	r3, .L79+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L76
.L73:
	mov	r0, #10
	ldr	r3, .L79+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	mov	r0, #10
	ldr	r3, .L79+16
	mov	lr, pc
	bx	r3
	mov	r0, #10
	ldr	r3, .L79+20
	mov	lr, pc
	bx	r3
	mov	r0, #10
	ldr	r3, .L79+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+44
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L77
	ldr	r3, .L79+48
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	mov	r4, r0
	beq	.L78
.L72:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L77:
	bl	gotoLose
	mov	r1, #413696
	add	r1, r1, #856
	mov	r2, #11008
	ldr	r0, .L79+52
	add	r1, r1, #2
	add	r2, r2, #17
	mov	r3, #1
	bl	playSoundA
	ldr	r3, .L79+48
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	mov	r4, r0
	bne	.L72
.L78:
	bl	gotoWin
	mov	r1, #532480
	mov	r2, #11008
	ldr	r0, .L79+56
	sub	r1, r1, #249
	add	r2, r2, #17
	mov	r3, r4
	ldmfd	sp!, {r4, lr}
	b	playSoundA
.L76:
	bl	gotoPause
	b	.L73
.L80:
	.align	2
.L79:
	.word	oldButtons
	.word	buttons
	.word	actPlayers
	.word	updateLives
	.word	moveBullets
	.word	moveEnemies
	.word	moveObjects
	.word	drawCharacters
	.word	drawEnemies
	.word	drawBullets
	.word	drawObjects
	.word	checkNoLives
	.word	checkWin
	.word	GameOverSong
	.word	WinSong
	.size	updateGame2, .-updateGame2
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L87
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L82
	ldr	r3, .L87+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L85
.L82:
	bl	gameFunctions
	ldr	r3, .L87+8
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L86
.L83:
	ldr	r3, .L87+12
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	beq	.L81
	mov	r0, #10
	ldr	r3, .L87+16
	mov	lr, pc
	bx	r3
	bl	gotoGame2
	mov	r1, #450560
	add	r1, r1, #2912
	mov	r2, #11008
	ldr	r0, .L87+20
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldmfd	sp!, {r4, lr}
	b	playSoundA
.L81:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L86:
	bl	gotoLose
	mov	r1, #413696
	add	r1, r1, #856
	mov	r2, #11008
	ldr	r0, .L87+24
	add	r1, r1, #2
	add	r2, r2, #17
	mov	r3, #1
	bl	playSoundA
	b	.L83
.L85:
	bl	gotoPause
	b	.L82
.L88:
	.align	2
.L87:
	.word	oldButtons
	.word	buttons
	.word	checkNoLives
	.word	checkWin
	.word	initialize
	.word	GameSong
	.word	GameOverSong
	.size	updateGame, .-updateGame
	.align	2
	.global	gotoInstruct
	.type	gotoInstruct, %function
gotoInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L90
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L90+8
	mov	r0, #3
	ldr	r1, .L90+12
	mov	r2, #100663296
	mov	r3, #5184
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L90+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L90+20
	ldr	r3, .L90+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	instructionsPal
	.word	loadPalette
	.word	DMANow
	.word	instructionsTiles
	.word	instructionsMap
	.word	updateInstruct
	.word	state
	.size	gotoInstruct, .-gotoInstruct
	.align	2
	.global	gotoTutorialTitle
	.type	gotoTutorialTitle, %function
gotoTutorialTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L93
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L93+8
	ldr	r3, .L93+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L93+16
	mov	r0, #3
	ldr	r1, .L93+20
	mov	r2, #100663296
	mov	r3, #1696
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L93+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L93+28
	ldr	r3, .L93+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	hideSprites
	.word	copyShadowOAM
	.word	TutorialTitlePal
	.word	loadPalette
	.word	DMANow
	.word	TutorialTitleTiles
	.word	TutorialTitleMap
	.word	updateTutorialTitle
	.word	state
	.size	gotoTutorialTitle, .-gotoTutorialTitle
	.align	2
	.global	updateStart
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L100
	ldr	r5, .L100+4
	ldr	r2, [r4, #0]
	ldr	r3, [r5, #0]
	add	r2, r2, #1
	tst	r3, #8
	str	r2, [r4, #0]
	beq	.L96
	ldr	r2, .L100+8
	ldr	r6, [r2, #0]
	ands	r6, r6, #8
	beq	.L98
.L96:
	tst	r3, #512
	beq	.L97
	ldr	r3, .L100+8
	ldr	r3, [r3, #0]
	tst	r3, #512
	beq	.L99
.L97:
	ldrh	r2, [r4, #0]
	mov	r3, #67108864
	strh	r2, [r3, #20]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L99:
	mov	r1, #311296
	add	r1, r1, #2816
	mov	r2, #11008
	ldr	r0, .L100+12
	add	r1, r1, #8
	add	r2, r2, #17
	mov	r3, #1
	bl	playSoundA
	bl	gotoTutorialTitle
	b	.L97
.L98:
	mov	r1, #450560
	add	r1, r1, #2912
	mov	r2, #11008
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L100+16
	bl	playSoundA
	ldr	r3, .L100+20
	mov	r0, r6
	mov	lr, pc
	bx	r3
	bl	gotoGame
	ldr	r3, [r5, #0]
	b	.L96
.L101:
	.align	2
.L100:
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	TutorialSong
	.word	GameSong
	.word	initialize
	.size	updateStart, .-updateStart
	.align	2
	.global	gotoTutorial1
	.type	gotoTutorial1, %function
gotoTutorial1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L103
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+4
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L103+8
	ldr	r3, .L103+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L103+16
	mov	r0, #3
	ldr	r1, .L103+20
	mov	r2, r5
	mov	r3, #3120
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L103+24
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L103+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L103+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L103+36
	ldr	r3, .L103+40
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial1Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial1Tiles
	.word	Tutorial1Map
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateTutorial1
	.word	state
	.size	gotoTutorial1, .-gotoTutorial1
	.align	2
	.global	updateTutorialTitle
	.type	updateTutorialTitle, %function
updateTutorialTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L110
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L106
	ldr	r2, .L110+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L108
.L106:
	tst	r3, #4
	beq	.L105
	ldr	r3, .L110+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L109
.L105:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L109:
	ldmfd	sp!, {r4, lr}
	b	gotoStart
.L108:
	ldr	r3, .L110+8
	mov	r0, #1
	mov	lr, pc
	bx	r3
	bl	gotoTutorial1
	ldr	r3, [r4, #0]
	b	.L106
.L111:
	.align	2
.L110:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	updateTutorialTitle, .-updateTutorialTitle
	.align	2
	.global	gotoTutorial2
	.type	gotoTutorial2, %function
gotoTutorial2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L113
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+4
	mov	lr, pc
	bx	r3
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L113+8
	ldr	r3, .L113+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L113+16
	mov	r0, #3
	ldr	r1, .L113+20
	mov	r2, #100663296
	mov	r3, #3120
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L113+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L113+28
	ldr	r3, .L113+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial2Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial2Tiles
	.word	Tutorial2Map
	.word	updateTutorial2
	.word	state
	.size	gotoTutorial2, .-gotoTutorial2
	.align	2
	.global	updateTutorial1
	.type	updateTutorial1, %function
updateTutorial1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #1
	ldr	r3, .L122
	ldr	r4, .L122+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L122+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L116
	ldr	r2, .L122+12
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L119
.L116:
	tst	r3, #4
	beq	.L117
	ldr	r2, .L122+12
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L120
.L117:
	tst	r3, #2
	beq	.L115
	ldr	r3, .L122+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L121
.L115:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L121:
	ldmfd	sp!, {r4, lr}
	b	gotoTutorialTitle
.L120:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L117
.L119:
	bl	gotoTutorial2
	ldr	r3, [r4, #0]
	b	.L116
.L123:
	.align	2
.L122:
	.word	actPlayers
	.word	oldButtons
	.word	drawCharacters
	.word	buttons
	.size	updateTutorial1, .-updateTutorial1
	.align	2
	.global	gotoTutorial3
	.type	gotoTutorial3, %function
gotoTutorial3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+4
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L125+8
	ldr	r3, .L125+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L125+16
	mov	r0, #3
	ldr	r1, .L125+20
	mov	r2, r5
	mov	r3, #3024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L125+24
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L125+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L125+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L125+36
	ldr	r3, .L125+40
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial3Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial3Tiles
	.word	Tutorial3Map
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateTutorial3
	.word	state
	.size	gotoTutorial3, .-gotoTutorial3
	.align	2
	.global	updateTutorial2
	.type	updateTutorial2, %function
updateTutorial2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L134
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L128
	ldr	r2, .L134+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L131
.L128:
	tst	r3, #4
	beq	.L129
	ldr	r2, .L134+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L132
.L129:
	tst	r3, #2
	beq	.L127
	ldr	r3, .L134+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L133
.L127:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L133:
	mov	r0, #1
	ldr	r3, .L134+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial1
.L132:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L129
.L131:
	ldr	r3, .L134+8
	mov	r0, #3
	mov	lr, pc
	bx	r3
	bl	gotoTutorial3
	ldr	r3, [r4, #0]
	b	.L128
.L135:
	.align	2
.L134:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	updateTutorial2, .-updateTutorial2
	.align	2
	.global	gotoTutorial4
	.type	gotoTutorial4, %function
gotoTutorial4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L137
	mov	lr, pc
	bx	r3
	ldr	r3, .L137+4
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L137+8
	ldr	r3, .L137+12
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #4096
	ldr	r4, .L137+16
	mov	r5, r2
	mov	r0, #3
	ldr	r1, .L137+20
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L137+24
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L137+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L137+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L137+36
	ldr	r3, .L137+40
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial4Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial4Tiles
	.word	Tutorial4Map
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateTutorial4
	.word	state
	.size	gotoTutorial4, .-gotoTutorial4
	.align	2
	.global	updateTutorial3
	.type	updateTutorial3, %function
updateTutorial3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #3
	ldr	r3, .L146
	mov	lr, pc
	bx	r3
	ldr	r4, .L146+4
	ldr	r3, .L146+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L146+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L140
	ldr	r2, .L146+16
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L143
.L140:
	tst	r3, #4
	beq	.L141
	ldr	r2, .L146+16
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L144
.L141:
	tst	r3, #2
	beq	.L139
	ldr	r3, .L146+16
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L145
.L139:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L145:
	mov	r0, #2
	ldr	r3, .L146+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial2
.L144:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L141
.L143:
	ldr	r3, .L146+20
	mov	r0, #4
	mov	lr, pc
	bx	r3
	bl	gotoTutorial4
	ldr	r3, [r4, #0]
	b	.L140
.L147:
	.align	2
.L146:
	.word	actPlayers
	.word	oldButtons
	.word	drawFighter
	.word	drawWall2
	.word	buttons
	.word	initialize
	.size	updateTutorial3, .-updateTutorial3
	.align	2
	.global	gotoTutorial5
	.type	gotoTutorial5, %function
gotoTutorial5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L149
	mov	lr, pc
	bx	r3
	ldr	r3, .L149+4
	mov	lr, pc
	bx	r3
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L149+8
	ldr	r3, .L149+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L149+16
	mov	r0, #3
	ldr	r1, .L149+20
	mov	r2, #100663296
	mov	r3, #3120
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L149+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L149+28
	ldr	r3, .L149+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial5Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial5Tiles
	.word	Tutorial5Map
	.word	updateTutorial5
	.word	state
	.size	gotoTutorial5, .-gotoTutorial5
	.align	2
	.global	updateTutorial4
	.type	updateTutorial4, %function
updateTutorial4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #4
	ldr	r3, .L158
	mov	lr, pc
	bx	r3
	ldr	r3, .L158+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L158+8
	mov	lr, pc
	bx	r3
	mov	r0, #4
	ldr	r3, .L158+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L158+16
	ldr	r3, .L158+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L158+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L152
	ldr	r2, .L158+28
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L155
.L152:
	tst	r3, #4
	beq	.L153
	ldr	r2, .L158+28
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L156
.L153:
	tst	r3, #2
	beq	.L151
	ldr	r3, .L158+28
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L157
.L151:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L157:
	mov	r0, #3
	ldr	r3, .L158+32
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial3
.L156:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L153
.L155:
	bl	gotoTutorial5
	ldr	r3, [r4, #0]
	b	.L152
.L159:
	.align	2
.L158:
	.word	actPlayers
	.word	drawFighter
	.word	drawDoor1
	.word	moveObjects
	.word	oldButtons
	.word	drawButton
	.word	drawBlock
	.word	buttons
	.word	initialize
	.size	updateTutorial4, .-updateTutorial4
	.align	2
	.global	gotoTutorial6
	.type	gotoTutorial6, %function
gotoTutorial6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L161
	mov	lr, pc
	bx	r3
	ldr	r3, .L161+4
	mov	lr, pc
	bx	r3
	mov	r0, #6
	ldr	r3, .L161+8
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	mov	r5, #100663296
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L161+12
	ldr	r3, .L161+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L161+20
	mov	r0, #3
	ldr	r1, .L161+24
	mov	r2, r5
	mov	r3, #3488
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L161+28
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L161+32
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L161+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L161+40
	ldr	r3, .L161+44
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L162:
	.align	2
.L161:
	.word	hideSprites
	.word	copyShadowOAM
	.word	initialize
	.word	Tutorial6Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial6Tiles
	.word	Tutorial6Map
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateTutorial6
	.word	state
	.size	gotoTutorial6, .-gotoTutorial6
	.align	2
	.global	updateTutorial5
	.type	updateTutorial5, %function
updateTutorial5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L170
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L164
	ldr	r2, .L170+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L167
.L164:
	tst	r3, #4
	beq	.L165
	ldr	r2, .L170+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L168
.L165:
	tst	r3, #2
	beq	.L163
	ldr	r3, .L170+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L169
.L163:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L169:
	mov	r0, #4
	ldr	r3, .L170+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial4
.L168:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L165
.L167:
	ldr	r3, .L170+8
	mov	r0, #6
	mov	lr, pc
	bx	r3
	bl	gotoTutorial6
	ldr	r3, [r4, #0]
	b	.L164
.L171:
	.align	2
.L170:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	updateTutorial5, .-updateTutorial5
	.align	2
	.global	gotoTutorial7
	.type	gotoTutorial7, %function
gotoTutorial7:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L173
	mov	lr, pc
	bx	r3
	ldr	r3, .L173+4
	mov	lr, pc
	bx	r3
	mov	r0, #7
	ldr	r3, .L173+8
	mov	lr, pc
	bx	r3
	mov	r2, #4352	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L173+12
	ldr	r3, .L173+16
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #4608
	ldr	r4, .L173+20
	mov	r5, r2
	mov	r0, #3
	ldr	r1, .L173+24
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L173+28
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L173+32
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	add	r2, r2, #512
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L173+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L173+40
	ldr	r3, .L173+44
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	hideSprites
	.word	copyShadowOAM
	.word	initialize
	.word	Tutorial7Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial7Tiles
	.word	Tutorial7Map
	.word	spritesheetTiles
	.word	spritesheetPal
	.word	updateTutorial7
	.word	state
	.size	gotoTutorial7, .-gotoTutorial7
	.align	2
	.global	updateTutorial6
	.type	updateTutorial6, %function
updateTutorial6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #6
	ldr	r3, .L184
	mov	lr, pc
	bx	r3
	mov	r0, #6
	ldr	r3, .L184+4
	mov	lr, pc
	bx	r3
	mov	r0, #6
	ldr	r3, .L184+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+24
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L180
.L176:
	ldr	r4, .L184+28
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L177
	ldr	r2, .L184+32
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L181
.L177:
	tst	r3, #4
	beq	.L178
	ldr	r2, .L184+32
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L182
.L178:
	tst	r3, #2
	beq	.L175
	ldr	r3, .L184+32
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L183
.L175:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L183:
	mov	r0, #5
	ldr	r3, .L184+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial5
.L180:
	mov	r0, #6
	ldr	r3, .L184+36
	mov	lr, pc
	bx	r3
	bl	gotoTutorial6
	b	.L176
.L182:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L178
.L181:
	ldr	r3, .L184+36
	mov	r0, #7
	mov	lr, pc
	bx	r3
	bl	gotoTutorial7
	ldr	r3, [r4, #0]
	b	.L177
.L185:
	.align	2
.L184:
	.word	actPlayers
	.word	moveEnemies
	.word	movePBullets
	.word	drawPBullets
	.word	drawShooter
	.word	drawOrb2
	.word	checkNoLives
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	updateTutorial6, .-updateTutorial6
	.align	2
	.global	gotoTutorial8
	.type	gotoTutorial8, %function
gotoTutorial8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L187
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+4
	mov	lr, pc
	bx	r3
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r0, .L187+8
	ldr	r3, .L187+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L187+16
	mov	r0, #3
	ldr	r1, .L187+20
	mov	r2, #100663296
	mov	r3, #3008
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L187+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L187+28
	ldr	r3, .L187+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L188:
	.align	2
.L187:
	.word	hideSprites
	.word	copyShadowOAM
	.word	Tutorial8Pal
	.word	loadPalette
	.word	DMANow
	.word	Tutorial8Tiles
	.word	Tutorial8Map
	.word	updateTutorial8
	.word	state
	.size	gotoTutorial8, .-gotoTutorial8
	.align	2
	.global	updateTutorial7
	.type	updateTutorial7, %function
updateTutorial7:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #7
	ldr	r3, .L196
	mov	lr, pc
	bx	r3
	ldr	r3, .L196+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L196+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L196+12
	ldr	r3, .L196+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L196+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L190
	ldr	r2, .L196+24
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L193
.L190:
	tst	r3, #4
	beq	.L191
	ldr	r2, .L196+24
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L194
.L191:
	tst	r3, #512
	beq	.L189
	ldr	r3, .L196+24
	ldr	r3, [r3, #0]
	tst	r3, #512
	beq	.L195
.L189:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L195:
	mov	r0, #6
	ldr	r3, .L196+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial6
.L194:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L191
.L193:
	bl	gotoTutorial8
	ldr	r3, [r4, #0]
	b	.L190
.L197:
	.align	2
.L196:
	.word	actPlayers
	.word	drawShooter
	.word	drawChest
	.word	oldButtons
	.word	drawLever
	.word	drawDoor2
	.word	buttons
	.word	initialize
	.size	updateTutorial7, .-updateTutorial7
	.align	2
	.global	gotoTutorial9
	.type	gotoTutorial9, %function
gotoTutorial9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L199
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L199+4
	mov	lr, pc
	bx	r3
	mov	r3, #5248
	mov	r0, #3
	ldr	r1, .L199+8
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L199+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L199+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L199+20
	ldr	r3, .L199+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L200:
	.align	2
.L199:
	.word	Tutorial9Pal
	.word	loadPalette
	.word	Tutorial9Tiles
	.word	DMANow
	.word	Tutorial9Map
	.word	updateTutorial9
	.word	state
	.size	gotoTutorial9, .-gotoTutorial9
	.align	2
	.global	updateTutorialEnd
	.type	updateTutorialEnd, %function
updateTutorialEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L208
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L202
	ldr	r2, .L208+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L205
.L202:
	tst	r3, #4
	beq	.L203
	ldr	r2, .L208+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L206
.L203:
	tst	r3, #2
	beq	.L201
	ldr	r3, .L208+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L207
.L201:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L207:
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial9
.L206:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L203
.L205:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L202
.L209:
	.align	2
.L208:
	.word	oldButtons
	.word	buttons
	.size	updateTutorialEnd, .-updateTutorialEnd
	.align	2
	.global	updateTutorial8
	.type	updateTutorial8, %function
updateTutorial8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L217
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L211
	ldr	r2, .L217+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L214
.L211:
	tst	r3, #4
	beq	.L212
	ldr	r2, .L217+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L215
.L212:
	tst	r3, #2
	beq	.L210
	ldr	r3, .L217+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L216
.L210:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L216:
	mov	r0, #7
	ldr	r3, .L217+8
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial7
.L215:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L212
.L214:
	bl	gotoTutorial9
	ldr	r3, [r4, #0]
	b	.L211
.L218:
	.align	2
.L217:
	.word	oldButtons
	.word	buttons
	.word	initialize
	.size	updateTutorial8, .-updateTutorial8
	.align	2
	.global	gotoTutorialEnd
	.type	gotoTutorialEnd, %function
gotoTutorialEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #256	@ movhi
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r0, .L220
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L220+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L220+8
	mov	r0, #3
	ldr	r1, .L220+12
	mov	r2, #100663296
	mov	r3, #2128
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L220+16
	mov	lr, pc
	bx	r4
	ldr	r2, .L220+20
	ldr	r3, .L220+24
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L221:
	.align	2
.L220:
	.word	TutorialEndPal
	.word	loadPalette
	.word	DMANow
	.word	TutorialEndTiles
	.word	TutorialEndMap
	.word	updateTutorialEnd
	.word	state
	.size	gotoTutorialEnd, .-gotoTutorialEnd
	.align	2
	.global	updateTutorial9
	.type	updateTutorial9, %function
updateTutorial9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L229
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L223
	ldr	r2, .L229+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L226
.L223:
	tst	r3, #4
	beq	.L224
	ldr	r2, .L229+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L227
.L224:
	tst	r3, #2
	beq	.L222
	ldr	r3, .L229+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L228
.L222:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L228:
	ldmfd	sp!, {r4, lr}
	b	gotoTutorial8
.L227:
	bl	gotoStart
	ldr	r3, [r4, #0]
	b	.L224
.L226:
	bl	gotoTutorialEnd
	ldr	r3, [r4, #0]
	b	.L223
.L230:
	.align	2
.L229:
	.word	oldButtons
	.word	buttons
	.size	updateTutorial9, .-updateTutorial9
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	state,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
