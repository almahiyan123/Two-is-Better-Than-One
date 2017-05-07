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
	.file	"game.c"
	.text
	.align	2
	.global	copyShadowOAM
	.type	copyShadowOAM, %function
copyShadowOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #3
	ldr	r1, .L2
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L2+4
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	shadowOAM
	.word	DMANow
	.size	copyShadowOAM, .-copyShadowOAM
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L8
	mov	r3, #0
.L5:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L5
	bx	lr
.L9:
	.align	2
.L8:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	r2, r0, #6
	mov	r9, r0
	ldr	r0, .L53
	mov	r3, #0
	cmp	r2, #1
	sub	sp, sp, #64
	str	r3, [r0, #0]
	bls	.L43
	ldr	r1, .L53+4
	mov	r2, #1
	ldr	r4, .L53
	mov	ip, #16
	mov	r0, #11
	cmp	r9, r2
	str	r3, [r4, #4]
	str	r0, [r1, #12]
	str	ip, [r1, #8]
	str	r2, [r1, #16]
	str	r2, [r1, #20]
	beq	.L44
	cmp	r9, #3
	beq	.L45
	cmp	r9, #4
	beq	.L46
.L16:
	cmp	r9, #10
	beq	.L47
	ldr	r0, .L53+8
	mov	r2, #0
	mov	ip, #130
	str	ip, [r1, #0]
	str	r2, [r1, #48]
	mov	ip, #20
	str	r2, [r1, #28]
	mov	r2, #8
	mov	r3, #1
	str	ip, [r1, #4]
	str	r2, [r0, #12]
	mov	ip, #10
	mov	r2, #16
	cmp	r9, #6
	str	ip, [r1, #44]
	str	r2, [r0, #8]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	bne	.L19
	mov	r3, #80
	str	r3, [r0, #0]
	mov	r3, #40
	str	r3, [r0, #4]
	b	.L14
.L44:
	ldr	r0, .L53+8
	mov	r4, #80
	mov	r2, #120
	mov	r5, #10
	str	r3, [r1, #48]
	str	r3, [r1, #28]
	mov	r3, #8
	str	r4, [r1, #0]
	str	r2, [r1, #4]
	str	r5, [r1, #44]
	str	r3, [r0, #12]
	str	ip, [r0, #8]
	str	r9, [r0, #16]
	str	r9, [r0, #20]
	str	r4, [r0, #0]
	str	r2, [r0, #4]
.L14:
	ldr	r7, .L53+12
	ldr	r3, .L53+16
	ldr	r2, .L53+20
	ldr	r8, [r7, #0]
	ldr	r6, [r7, #4]
	mov	ip, #0
	mov	r5, #4
	mov	r4, #5
	cmp	r9, #10
	str	r4, [r0, #44]
	str	ip, [r0, #48]
	str	ip, [r0, #28]
	str	ip, [r1, #24]
	str	ip, [r1, #36]
	str	ip, [r0, #24]
	str	ip, [r0, #36]
	str	r5, [r3, #32]
	str	ip, [r3, #36]
	str	r8, [r3, #28]
	str	r5, [r2, #32]
	str	ip, [r2, #36]
	str	r6, [r2, #28]
	beq	.L48
	mov	r5, #100
	mov	r1, #16
	mov	ip, #2
	mov	r0, #1
	str	r5, [r3, #0]
	cmp	r9, #6
	mov	r5, #59
	str	r5, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #24]
	str	ip, [r3, #20]
	str	r0, [r3, #44]
	str	r4, [r3, #40]
	beq	.L49
	ldr	r3, .L53+24
	mov	ip, #10
	mov	r5, #180
	str	ip, [r2, #0]
	str	r5, [r2, #4]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r0, [r2, #24]
	str	r0, [r2, #20]
	str	r4, [r2, #40]
	str	r0, [r2, #44]
	mov	r2, #14
	str	ip, [r3, #16]
	str	r2, [r3, #20]
.L25:
	mov	r2, #75
	str	r2, [r3, #0]
	mov	r2, #138
	str	r2, [r3, #4]
.L23:
	ldr	sl, [r7, #8]
	mov	r6, #0
	mov	r3, #4
	cmp	sl, r6
	str	r3, [sp, #56]
	str	r3, [sp, #52]
	str	r6, [sp, #40]
	str	r6, [sp, #44]
	str	r6, [sp, #60]
	ble	.L26
	ldr	r8, .L53+28
	mov	sl, sl, asl #5
	add	fp, sp, #32
.L27:
	mov	r5, fp
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, r8, r6
	mov	r4, ip
	stmia	r4!, {r0, r1, r2, r3}
	add	r6, r6, #32
	ldmia	r5, {r0, r1, r2, r3}
	cmp	r6, sl
	stmia	r4, {r0, r1, r2, r3}
	bne	.L27
.L26:
	ldr	r8, [r7, #12]
	mov	r6, #0
	mov	r3, #4
	cmp	r8, r6
	str	r3, [sp, #24]
	str	r3, [sp, #20]
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #28]
	ble	.L28
	ldr	r7, .L53+32
	mov	r8, r8, asl #5
	mov	sl, sp
.L29:
	mov	r5, sl
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, r7, r6
	mov	r4, ip
	stmia	r4!, {r0, r1, r2, r3}
	add	r6, r6, #32
	ldmia	r5, {r0, r1, r2, r3}
	cmp	r6, r8
	stmia	r4, {r0, r1, r2, r3}
	bne	.L29
.L28:
	cmp	r9, #4
	beq	.L50
	cmp	r9, #10
	beq	.L51
	ldr	r3, .L53+36
	mov	r7, #130
	ldr	r1, .L53+40
	mov	r2, #0
	mov	r5, #15
	str	r7, [r3, #0]
	mov	r7, #90
	ldr	ip, .L53+44
	str	r7, [r3, #4]
	str	r5, [r3, #20]
	str	r5, [r3, #16]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	mov	r3, #23
	mov	r6, #4
	mov	r0, #8
	mov	r4, #32
	str	r3, [r1, #16]
	cmp	r9, #7
	mov	r3, #38
	str	r6, [r1, #20]
	str	r3, [r1, #0]
	str	r0, [r1, #4]
	str	r2, [r1, #24]
	str	r6, [ip, #20]
	str	r4, [ip, #16]
	bne	.L35
	mov	r5, #107
	ldr	r3, .L53+48
	ldr	r1, .L53+52
	str	r5, [ip, #0]
	mov	r5, #184
	str	r5, [ip, #4]
	str	r2, [ip, #24]
	mov	ip, #119
	str	r0, [r3, #20]
	str	r4, [r3, #16]
	str	ip, [r3, #0]
	str	r0, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	r4, [r1, #20]
	str	r0, [r1, #16]
.L31:
	ldr	r0, .L53+56
	mov	r3, #144
	str	r3, [r1, #4]
	mov	r3, #13
	mov	r2, #0
	mov	ip, #8
	str	r3, [r0, #20]
	cmp	r9, #7
	mov	r3, #14
	str	ip, [r1, #0]
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	str	r3, [r0, #16]
	bne	.L34
	mov	r5, #76
	ldr	r1, .L53+60
	ldr	r3, .L53+64
	str	r5, [r0, #0]
	mov	r5, #130
	mov	r4, #9
	str	r5, [r0, #4]
	str	r2, [r0, #28]
	str	r2, [r0, #24]
	mov	r0, #75
	str	ip, [r1, #20]
	str	ip, [r1, #16]
	stmia	r1, {r0, r2}	@ phole stm
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	str	r4, [r3, #20]
	str	r4, [r3, #16]
.L36:
	mov	r2, #138
	str	r2, [r3, #0]
	mov	r2, #179
	str	r2, [r3, #4]
.L39:
	ldr	r0, .L53
	mov	r2, #0
	str	r2, [r3, #24]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	add	sp, sp, #64
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L34:
	mov	r5, #17
	ldr	r1, .L53+60
	str	r5, [r0, #0]
	mov	r5, #216
	ldr	r3, .L53+64
	str	r5, [r0, #4]
	str	r2, [r0, #28]
	str	r2, [r0, #24]
	mov	r0, #15
	mov	r4, #9
	str	r0, [r1, #0]
	cmp	r9, #4
	mov	r0, #7
	str	ip, [r1, #20]
	str	ip, [r1, #16]
	str	r0, [r1, #4]
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	str	r4, [r3, #20]
	str	r4, [r3, #16]
	bne	.L38
	mov	r2, #90
	str	r2, [r3, #0]
	mov	r2, #100
	str	r2, [r3, #4]
	b	.L39
.L19:
	cmp	r9, #7
	beq	.L52
	cmp	r9, #10
	movne	r3, #130
	moveq	r3, #20
	strne	r3, [r0, #0]
	movne	r3, #20
	streq	r3, [r0, #0]
	strne	r3, [r0, #4]
	b	.L14
.L49:
	mov	ip, #90
	ldr	r3, .L53+24
	str	ip, [r2, #0]
	mov	ip, #150
	str	ip, [r2, #4]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r0, [r2, #24]
	str	r0, [r2, #20]
	str	r4, [r2, #40]
	str	r0, [r2, #44]
	mov	r2, #10
	str	r2, [r3, #16]
	mov	r2, #14
	str	r2, [r3, #20]
	b	.L25
.L48:
	mov	ip, #16
	mov	r0, #1
	mov	r5, #200
	mov	r6, #2
	mov	r8, #90
	ldr	r1, .L53+24
	str	r8, [r3, #0]
	stmib	r3, {r5, ip}	@ phole stm
	str	ip, [r3, #12]
	str	r6, [r3, #24]
	str	r6, [r3, #20]
	str	r0, [r3, #44]
	str	r4, [r3, #40]
	mov	r3, #110
	str	r3, [r2, #0]
	mov	r3, #14
	str	r3, [r1, #20]
	mov	r3, #103
	str	r3, [r1, #0]
	mov	r3, #185
	stmib	r2, {r5, ip}	@ phole stm
	str	ip, [r2, #12]
	str	r0, [r2, #24]
	str	r0, [r2, #20]
	str	r4, [r2, #40]
	str	r0, [r2, #44]
	str	r9, [r1, #16]
	str	r3, [r1, #4]
	b	.L23
.L50:
	ldr	r0, .L53+36
	mov	r8, #90
	mov	r2, #0
	ldr	r4, .L53+40
	mov	r7, #15
	str	r8, [r0, #0]
	mov	r8, #50
	str	r8, [r0, #4]
	str	r7, [r0, #20]
	str	r7, [r0, #16]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	mov	r0, #23
	str	r0, [r4, #16]
	mov	r0, #80
	ldr	ip, .L53+44
	str	r0, [r4, #0]
	mov	r0, #136
	str	r0, [r4, #4]
	mov	r0, #135
	ldr	r3, .L53+48
	ldr	r1, .L53+52
	str	r0, [ip, #0]
	mov	r0, #202
	mov	r6, #32
	mov	r5, #8
	str	r0, [ip, #4]
	mov	r0, #119
	str	r9, [r4, #20]
	str	r2, [r4, #24]
	str	r9, [ip, #20]
	str	r6, [ip, #16]
	str	r2, [ip, #24]
	str	r5, [r3, #20]
	str	r6, [r3, #16]
	stmia	r3, {r0, r5}	@ phole stm
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	r6, [r1, #20]
	str	r5, [r1, #16]
	b	.L31
.L43:
	ldr	r1, .L53+4
	mov	r2, #11
	mov	r3, #1
	str	r2, [r1, #12]
	cmp	r9, #4
	mov	r2, #16
	str	r3, [r0, #4]
	str	r2, [r1, #8]
	str	r3, [r1, #16]
	str	r3, [r1, #20]
	bne	.L16
.L46:
	mov	r3, #90
	str	r3, [r1, #0]
	mov	r3, #10
	str	r3, [r1, #4]
.L17:
	ldr	r0, .L53+8
	mov	r2, #0
	str	r2, [r1, #48]
	str	r2, [r1, #28]
	mov	r2, #8
	mov	r3, #1
	mov	ip, #10
	str	r2, [r0, #12]
	cmp	r9, #4
	mov	r2, #16
	str	ip, [r1, #44]
	str	r2, [r0, #8]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	bne	.L19
	mov	r3, #90
	stmia	r0, {r3, ip}	@ phole stm
	b	.L14
.L35:
	mov	r6, #135
	ldr	r3, .L53+48
	ldr	r1, .L53+52
	str	r6, [ip, #0]
	mov	r6, #202
	str	r6, [ip, #4]
	str	r2, [ip, #24]
	cmp	r9, #3
	mov	ip, #119
	str	r0, [r3, #20]
	str	r4, [r3, #16]
	str	ip, [r3, #0]
	str	r0, [r3, #4]
	str	r2, [r3, #28]
	str	r2, [r3, #24]
	str	r4, [r1, #20]
	str	r0, [r1, #16]
	bne	.L31
	mov	r7, #70
	ldr	r4, .L53+56
	str	r7, [r1, #0]
	mov	r7, #128
	str	r7, [r1, #4]
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	mov	r1, #13
	str	r1, [r4, #20]
	mov	r1, #14
	str	r1, [r4, #16]
	mov	r1, #17
	ldr	ip, .L53+60
	ldr	r3, .L53+64
	str	r1, [r4, #0]
	mov	r1, #216
	mov	r6, #9
	str	r1, [r4, #4]
	mov	r1, #7
	str	r2, [r4, #28]
	str	r2, [r4, #24]
	str	r0, [ip, #20]
	str	r0, [ip, #16]
	str	r5, [ip, #0]
	str	r1, [ip, #4]
	str	r2, [ip, #28]
	str	r2, [ip, #24]
	str	r6, [r3, #20]
	str	r6, [r3, #16]
	b	.L36
.L51:
	ldr	r5, .L53+36
	mov	fp, #45
	mov	r2, #0
	ldr	r7, .L53+40
	str	fp, [r5, #0]
	mov	r9, #15
	mov	fp, #65
	str	fp, [r5, #4]
	str	r9, [r5, #20]
	str	r9, [r5, #16]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	mov	r5, #4
	str	r5, [r7, #20]
	mov	r5, #23
	ldr	r6, .L53+44
	str	r5, [r7, #16]
	mov	r5, #40
	str	r5, [r7, #0]
	mov	fp, #200
	mov	r5, #4
	ldr	r4, .L53+48
	str	fp, [r7, #4]
	str	r5, [r6, #20]
	mov	fp, #130
	mov	r5, #88
	ldr	ip, .L53+52
	mov	r8, #8
	mov	sl, #32
	str	fp, [r6, #0]
	str	r5, [r6, #4]
	mov	fp, #88
	mov	r5, #80
	stmia	r4, {r5, fp}	@ phole stm
	str	r8, [r4, #20]
	str	sl, [r4, #16]
	str	r2, [r4, #28]
	str	r2, [r4, #24]
	mov	r4, #130
	ldr	r0, .L53+56
	str	r4, [ip, #0]
	mov	r4, #48
	str	sl, [ip, #20]
	str	r8, [ip, #16]
	str	r4, [ip, #4]
	str	r2, [ip, #28]
	str	r2, [ip, #24]
	mov	ip, #13
	str	ip, [r0, #20]
	mov	ip, #14
	str	ip, [r0, #16]
	mov	ip, #135
	ldr	r1, .L53+60
	str	ip, [r0, #0]
	ldr	r3, .L53+64
	mov	ip, #60
	str	ip, [r0, #4]
	str	r2, [r0, #28]
	mov	fp, #9
	str	r2, [r7, #24]
	str	sl, [r6, #16]
	str	r2, [r6, #24]
	mov	r5, #200
	str	r2, [r0, #24]
	mov	r0, #17
	str	r8, [r1, #20]
	str	r8, [r1, #16]
	stmia	r1, {r0, r5}	@ phole stm
	str	r2, [r1, #28]
	str	r2, [r1, #24]
	str	fp, [r3, #20]
	str	fp, [r3, #16]
.L37:
	mov	r2, #138
	str	r2, [r3, #0]
	mov	r2, #137
	str	r2, [r3, #4]
	b	.L39
.L45:
	ldr	r0, .L53+8
	mov	r4, #80
	str	r3, [r1, #48]
	str	r3, [r1, #28]
	mov	r3, #8
	str	r4, [r1, #0]
	str	r3, [r0, #12]
	mov	r4, #40
	mov	r3, #80
	str	r4, [r1, #4]
	str	r3, [r0, #0]
	mov	r4, #10
	mov	r3, #40
	str	r4, [r1, #44]
	str	ip, [r0, #8]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	str	r3, [r0, #4]
	b	.L14
.L52:
	mov	r3, #80
	str	r3, [r0, #0]
	mov	r3, #60
	str	r3, [r0, #4]
	b	.L14
.L47:
	mov	r3, #7
	str	r3, [r1, #0]
	mov	r3, #20
	str	r3, [r1, #4]
	b	.L17
.L38:
	cmp	r9, #10
	bne	.L36
	b	.L37
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.word	fighter
	.word	shooter
	.word	.LANCHOR1
	.word	orb1
	.word	orb2
	.word	livesNum
	.word	pBullets
	.word	tBullets
	.word	block
	.word	doorA
	.word	doorExit
	.word	wall
	.word	wall2
	.word	chest
	.word	lever
	.word	button
	.size	initialize, .-initialize
	.align	2
	.global	swapPlayers
	.type	swapPlayers, %function
swapPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L57
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	cmp	r2, #2
	str	r2, [r3, #4]
	moveq	r2, #0
	streq	r2, [r3, #4]
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.size	swapPlayers, .-swapPlayers
	.align	2
	.global	moveTut1Fighter
	.type	moveTut1Fighter, %function
moveTut1Fighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L60
	ldr	r3, .L64
	ldr	r2, [r3, #0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #0]
.L60:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L61
	ldr	r3, .L64
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #0]
	rsb	r1, r1, #160
	cmp	r2, r1
	addlt	r2, r2, #1
	strlt	r2, [r3, #0]
.L61:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L62
	ldr	r3, .L64
	ldr	r2, [r3, #4]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #4]
.L62:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L64
	ldr	r2, [r3, #4]
	cmp	r2, #239
	addle	r2, r2, #1
	strle	r2, [r3, #4]
	bx	lr
.L65:
	.align	2
.L64:
	.word	fighter
	.size	moveTut1Fighter, .-moveTut1Fighter
	.align	2
	.global	moveTut1Shooter
	.type	moveTut1Shooter, %function
moveTut1Shooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L67
	ldr	r3, .L71
	ldr	r2, [r3, #0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #0]
.L67:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L68
	ldr	r3, .L71
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #0]
	rsb	r1, r1, #160
	cmp	r2, r1
	addlt	r2, r2, #1
	strlt	r2, [r3, #0]
.L68:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L69
	ldr	r3, .L71
	ldr	r2, [r3, #4]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #4]
.L69:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L71
	ldr	r2, [r3, #4]
	cmp	r2, #239
	addle	r2, r2, #1
	strle	r2, [r3, #4]
	bx	lr
.L72:
	.align	2
.L71:
	.word	shooter
	.size	moveTut1Shooter, .-moveTut1Shooter
	.align	2
	.global	moveTut6Shooter
	.type	moveTut6Shooter, %function
moveTut6Shooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L74
	ldr	r3, .L78
	ldr	r2, [r3, #0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #0]
.L74:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L75
	ldr	r3, .L78
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #0]
	rsb	r1, r1, #160
	cmp	r2, r1
	addlt	r2, r2, #1
	strlt	r2, [r3, #0]
.L75:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L76
	ldr	r3, .L78
	ldr	r2, [r3, #4]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r3, #4]
.L76:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L78
	ldr	r2, [r3, #4]
	cmp	r2, #239
	addle	r2, r2, #1
	strle	r2, [r3, #4]
	bx	lr
.L79:
	.align	2
.L78:
	.word	shooter
	.size	moveTut6Shooter, .-moveTut6Shooter
	.align	2
	.global	moveOrb1Game2
	.type	moveOrb1Game2, %function
moveOrb1Game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	moveOrb1Game2, .-moveOrb1Game2
	.align	2
	.global	moveOrb2Game2
	.type	moveOrb2Game2, %function
moveOrb2Game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	moveOrb2Game2, .-moveOrb2Game2
	.align	2
	.global	door1Collision
	.type	door1Collision, %function
door1Collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L88
	stmfd	sp!, {r4, r5}
	ldr	r1, .L88+4
	ldr	ip, [r2, #4]
	ldr	r4, [r2, #12]
	ldr	r3, [r1, #4]
	add	r4, ip, r4
	sub	r4, r4, #1
	cmp	r3, r4
	bge	.L83
	ldr	r4, [r1, #16]
	add	r4, r3, r4
	sub	r4, r4, #1
	cmp	ip, r4
	blt	.L87
.L83:
	ldr	r2, .L88+8
	ldr	ip, [r2, #4]
	ldr	r4, [r2, #12]
	add	r4, ip, r4
	sub	r4, r4, #1
	cmp	r3, r4
	bge	.L82
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	ip, r3
	ldr	r3, .L88+4
	bge	.L82
	ldr	r1, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r3, #0]
	add	r4, r1, r4
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L82
	ldr	r3, [r3, #20]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	r1, ip
	bge	.L82
	cmp	r0, #4
	subeq	r1, r1, #1
	addne	r1, r1, #1
	streq	r1, [r2, #0]
	strne	r1, [r2, #0]
.L82:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L87:
	ldr	ip, [r2, #0]
	ldr	r5, [r2, #8]
	ldr	r4, [r1, #0]
	add	r5, ip, r5
	sub	r5, r5, #1
	cmp	r4, r5
	bge	.L83
	ldr	r5, [r1, #20]
	add	r4, r4, r5
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L83
	cmp	r0, #4
	subeq	ip, ip, #1
	addne	ip, ip, #1
	streq	ip, [r2, #0]
	strne	ip, [r2, #0]
	b	.L83
.L89:
	.align	2
.L88:
	.word	fighter
	.word	doorA
	.word	shooter
	.size	door1Collision, .-door1Collision
	.align	2
	.global	moveTut4Fighter
	.type	moveTut4Fighter, %function
moveTut4Fighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L91
	ldr	r4, .L99
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L99+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L95
.L91:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L92
	ldr	r4, .L99
	ldr	r3, [r4, #0]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	add	r0, r0, r3
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L99+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L96
.L92:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L93
	ldr	r4, .L99
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #2
	ldr	r3, .L99+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L97
.L93:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L90
	ldr	r4, .L99
	ldr	r3, [r4, #12]
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	sub	r2, r2, #1
	add	r0, r1, #5
	ldr	r3, .L99+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L90
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L90
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L98
.L90:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L97:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L93
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L93
	mov	r0, #4
	bl	door1Collision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
	b	.L93
.L96:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L92
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L92
	mov	r0, #4
	bl	door1Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r4, #0]
	b	.L92
.L95:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L91
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L91
	mov	r0, #4
	bl	door1Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #0]
	b	.L91
.L98:
	mov	r0, #4
	bl	door1Collision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	addle	r3, r3, #1
	strle	r3, [r4, #4]
	b	.L90
.L100:
	.align	2
.L99:
	.word	fighter
	.word	collisionMapTut4Bitmap
	.size	moveTut4Fighter, .-moveTut4Fighter
	.align	2
	.global	door2Collision
	.type	door2Collision, %function
door2Collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L107
	stmfd	sp!, {r4, r5}
	ldr	r1, .L107+4
	ldr	ip, [r2, #4]
	ldr	r4, [r2, #12]
	ldr	r3, [r1, #4]
	add	r4, ip, r4
	sub	r4, r4, #1
	cmp	r3, r4
	bge	.L102
	ldr	r4, [r1, #16]
	add	r4, r3, r4
	sub	r4, r4, #1
	cmp	ip, r4
	blt	.L106
.L102:
	ldr	r2, .L107+8
	ldr	ip, [r2, #4]
	ldr	r4, [r2, #12]
	add	r4, ip, r4
	sub	r4, r4, #1
	cmp	r3, r4
	bge	.L101
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	ip, r3
	ldr	r3, .L107+4
	bge	.L101
	ldr	r1, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r3, #0]
	add	r4, r1, r4
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L101
	ldr	r3, [r3, #20]
	add	ip, ip, r3
	sub	ip, ip, #1
	cmp	r1, ip
	bge	.L101
	cmp	r0, #7
	addeq	r1, r1, #1
	subne	r1, r1, #1
	streq	r1, [r2, #0]
	strne	r1, [r2, #0]
.L101:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L106:
	ldr	ip, [r2, #0]
	ldr	r5, [r2, #8]
	ldr	r4, [r1, #0]
	add	r5, ip, r5
	sub	r5, r5, #1
	cmp	r4, r5
	bge	.L102
	ldr	r5, [r1, #20]
	add	r4, r4, r5
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L102
	cmp	r0, #7
	addeq	ip, ip, #1
	subne	ip, ip, #1
	streq	ip, [r2, #0]
	strne	ip, [r2, #0]
	b	.L102
.L108:
	.align	2
.L107:
	.word	fighter
	.word	doorExit
	.word	shooter
	.size	door2Collision, .-door2Collision
	.align	2
	.global	wallCollision
	.type	wallCollision, %function
wallCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L113
	str	r4, [sp, #-4]!
	ldr	r1, .L113+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	sub	ip, ip, #1
	cmp	r3, ip
	bge	.L110
	ldr	ip, [r1, #16]
	add	ip, r3, ip
	sub	ip, ip, #1
	cmp	r0, ip
	blt	.L112
.L110:
	ldr	r2, .L113+8
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	add	ip, r0, ip
	sub	ip, ip, #1
	cmp	r3, ip
	bge	.L109
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	ldr	r3, .L113+4
	bge	.L109
	ldr	r1, [r2, #0]
	ldr	ip, [r2, #8]
	ldr	r0, [r3, #0]
	add	ip, r1, ip
	sub	ip, ip, #1
	cmp	r0, ip
	bge	.L109
	ldr	r3, [r3, #20]
	add	r0, r0, r3
	sub	r0, r0, #1
	cmp	r1, r0
	addlt	r1, r1, #1
	strlt	r1, [r2, #0]
.L109:
	ldmfd	sp!, {r4}
	bx	lr
.L112:
	ldr	r0, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r1, #0]
	add	r4, r0, r4
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L110
	ldr	r4, [r1, #20]
	add	ip, ip, r4
	sub	ip, ip, #1
	cmp	r0, ip
	bge	.L110
	ldr	ip, .L113+12
	ldr	ip, [ip, #4]
	add	r0, r0, #1
	cmp	ip, #0
	str	r0, [r2, #0]
	moveq	r2, #1
	streq	r2, [r1, #28]
	b	.L110
.L114:
	.align	2
.L113:
	.word	fighter
	.word	wall
	.word	shooter
	.word	.LANCHOR0
	.size	wallCollision, .-wallCollision
	.align	2
	.global	wall2Collision
	.type	wall2Collision, %function
wall2Collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L119
	ldr	r1, .L119+4
	stmfd	sp!, {r4, r5}
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	cmp	r3, ip
	bge	.L116
	ldr	ip, [r1, #16]
	add	ip, r3, ip
	cmp	r0, ip
	blt	.L118
.L116:
	ldr	r2, .L119+8
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	add	ip, r0, ip
	cmp	r3, ip
	bge	.L115
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r0, r3
	ldr	r3, .L119+4
	bge	.L115
	ldr	r1, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r3, #0]
	add	r4, r1, r4
	cmp	ip, r4
	bge	.L115
	ldr	r3, [r3, #20]
	add	ip, ip, r3
	cmp	r1, ip
	sublt	r0, r0, #1
	strlt	r0, [r2, #4]
.L115:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L118:
	ldr	ip, [r2, #0]
	ldr	r5, [r2, #8]
	ldr	r4, [r1, #0]
	add	r5, ip, r5
	cmp	r4, r5
	bge	.L116
	ldr	r5, [r1, #20]
	add	r4, r4, r5
	cmp	ip, r4
	bge	.L116
	ldr	ip, .L119+12
	ldr	ip, [ip, #4]
	sub	r0, r0, #1
	cmp	ip, #0
	str	r0, [r2, #4]
	moveq	r2, #1
	streq	r2, [r1, #28]
	b	.L116
.L120:
	.align	2
.L119:
	.word	fighter
	.word	wall2
	.word	shooter
	.word	.LANCHOR0
	.size	wall2Collision, .-wall2Collision
	.align	2
	.global	moveTut3Fighter
	.type	moveTut3Fighter, %function
moveTut3Fighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L122
	ldr	r4, .L137
	ldr	r1, [r4, #0]
	ldr	r0, [r4, #4]
	add	ip, r1, #4
	mov	ip, ip, asl #8
	add	r2, r0, #3
	ldr	r3, .L137+4
	add	r2, ip, r2
	mov	r5, r2, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	bne	.L130
.L122:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L124
	ldr	r4, .L137
	ldr	ip, [r4, #0]
	ldmib	r4, {r1, r5}	@ phole ldm
	add	r0, r5, ip
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L137+4
	add	r2, r0, r2
	mov	r6, r2, asl #1
	ldrh	r6, [r3, r6]
	cmp	r6, #0
	bne	.L131
.L124:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L126
	ldr	r4, .L137
	ldr	r1, [r4, #0]
	ldr	r0, [r4, #4]
	add	ip, r1, #5
	add	r2, r0, #2
	ldr	r3, .L137+4
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L132
.L126:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L121
	ldr	r4, .L137
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #0]
	add	r2, r0, r2
	sub	r2, r2, #1
	add	ip, r1, #5
	ldr	r3, .L137+4
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L121
	ldr	ip, [r4, #8]
	add	r5, ip, ip, lsr #31
	add	r5, r1, r5, asr #1
	add	r5, r2, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L121
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L121
	ldr	r3, .L137+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L133
.L129:
	cmp	r0, #239
	addle	r0, r0, #1
	strle	r0, [r4, #4]
.L121:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L132:
	ldr	ip, [r4, #8]
	add	r5, ip, ip, lsr #31
	add	r5, r1, r5, asr #1
	add	r5, r2, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	beq	.L126
	add	r1, r1, ip
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L126
	ldr	r3, .L137+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L134
.L127:
	cmp	r0, #0
	subgt	r0, r0, #1
	strgt	r0, [r4, #4]
	b	.L126
.L131:
	ldr	r6, [r4, #12]
	add	r7, r6, r6, lsr #31
	add	r2, r2, r7, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L124
	add	r1, r0, r1
	add	r6, r1, r6
	add	r3, r3, r6, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L124
	ldr	r3, .L137+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L135
.L125:
	rsb	r5, r5, #160
	cmp	r5, ip
	addgt	ip, ip, #1
	strgt	ip, [r4, #0]
	b	.L124
.L130:
	ldr	r5, [r4, #12]
	add	r6, r5, r5, lsr #31
	add	r2, r2, r6, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L122
	add	r0, ip, r0
	add	r5, r0, r5
	add	r3, r3, r5, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L122
	ldr	r3, .L137+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L136
.L123:
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r4, #0]
	b	.L122
.L134:
	bl	wall2Collision
	ldr	r0, [r4, #4]
	b	.L127
.L135:
	bl	wall2Collision
	ldr	ip, [r4, #0]
	ldr	r5, [r4, #8]
	b	.L125
.L136:
	bl	wall2Collision
	ldr	r1, [r4, #0]
	b	.L123
.L133:
	bl	wall2Collision
	ldr	r0, [r4, #4]
	b	.L129
.L138:
	.align	2
.L137:
	.word	fighter
	.word	collisionMapTut3Bitmap
	.word	wall2
	.size	moveTut3Fighter, .-moveTut3Fighter
	.align	2
	.global	chestCollision
	.type	chestCollision, %function
chestCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L143
	stmfd	sp!, {r4, r5}
	ldr	r1, .L143+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	sub	ip, ip, #1
	cmp	r3, ip
	bge	.L140
	ldr	ip, [r1, #16]
	add	ip, r3, ip
	sub	ip, ip, #1
	cmp	r0, ip
	blt	.L142
.L140:
	ldr	r2, .L143+8
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	add	ip, r0, ip
	sub	ip, ip, #1
	cmp	r3, ip
	bge	.L139
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r0, r3
	ldr	r3, .L143+4
	bge	.L139
	ldr	r1, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r3, #0]
	add	r4, r1, r4
	sub	r4, r4, #1
	cmp	ip, r4
	bge	.L139
	ldr	r4, [r3, #20]
	add	ip, ip, r4
	sub	ip, ip, #1
	cmp	r1, ip
	bge	.L139
	ldr	r1, .L143+12
	ldr	r1, [r1, #4]
	sub	r0, r0, #1
	cmp	r1, #1
	str	r0, [r2, #4]
	streq	r1, [r3, #28]
.L139:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L142:
	ldr	ip, [r2, #0]
	ldr	r5, [r2, #8]
	ldr	r4, [r1, #0]
	add	r5, ip, r5
	sub	r5, r5, #1
	cmp	r4, r5
	bge	.L140
	ldr	r5, [r1, #20]
	add	r4, r4, r5
	sub	r4, r4, #1
	cmp	ip, r4
	sublt	r0, r0, #1
	strlt	r0, [r2, #4]
	b	.L140
.L144:
	.align	2
.L143:
	.word	fighter
	.word	chest
	.word	shooter
	.word	.LANCHOR0
	.size	chestCollision, .-chestCollision
	.align	2
	.global	leverCollision
	.type	leverCollision, %function
leverCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L149
	ldr	r1, .L149+4
	stmfd	sp!, {r4, r5}
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	cmp	r3, ip
	bge	.L146
	ldr	ip, [r1, #16]
	add	ip, r3, ip
	cmp	r0, ip
	blt	.L148
.L146:
	ldr	r2, .L149+8
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	add	ip, r0, ip
	cmp	r3, ip
	bge	.L145
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r0, r3
	ldr	r3, .L149+4
	bge	.L145
	ldr	r1, [r2, #0]
	ldr	r4, [r2, #8]
	ldr	ip, [r3, #0]
	add	r4, r1, r4
	cmp	ip, r4
	bge	.L145
	ldr	r4, [r3, #20]
	add	ip, ip, r4
	cmp	r1, ip
	bge	.L145
	ldr	r1, .L149+12
	ldr	ip, [r1, #4]
	add	r0, r0, #1
	cmp	ip, #1
	str	r0, [r2, #4]
	bne	.L145
	ldr	r2, [r1, #8]
	cmp	r2, #1
	streq	r2, [r3, #28]
.L145:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L148:
	ldr	ip, [r2, #0]
	ldr	r5, [r2, #8]
	ldr	r4, [r1, #0]
	add	r5, ip, r5
	cmp	r4, r5
	bge	.L146
	ldr	r5, [r1, #20]
	add	r4, r4, r5
	cmp	ip, r4
	addlt	r0, r0, #1
	strlt	r0, [r2, #4]
	b	.L146
.L150:
	.align	2
.L149:
	.word	fighter
	.word	lever
	.word	shooter
	.word	.LANCHOR0
	.size	leverCollision, .-leverCollision
	.align	2
	.global	moveShooter
	.type	moveShooter, %function
moveShooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L152
	ldr	r4, .L175
	ldr	r2, [r4, #0]
	ldr	r1, [r4, #4]
	add	r2, r2, #4
	ldr	r3, .L175+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L164
.L152:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L155
	ldr	r4, .L175
	ldr	r3, [r4, #0]
	ldmib	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	ldr	r3, .L175+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L165
.L155:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L158
	ldr	r4, .L175
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #4
	ldr	r3, .L175+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L166
.L158:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L151
	ldr	r4, .L175
	ldmia	r4, {r1, r3}	@ phole ldm
	ldr	r2, [r4, #12]
	add	r0, r1, #5
	add	r2, r2, r3
	add	r0, r2, r0, asl #8
	ldr	r3, .L175+4
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L151
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L151
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L151
	ldr	r3, .L175+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L167
.L162:
	ldr	r3, .L175+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L168
.L163:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	chestCollision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	ldrle	r2, .L175
	addle	r3, r3, #1
	strle	r3, [r2, #4]
.L151:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L166:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L158
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L158
	ldr	r3, .L175+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L169
.L159:
	ldr	r3, .L175+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L170
.L160:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	leverCollision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, .L175
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	b	.L158
.L165:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L155
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L155
	ldr	r3, .L175+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L171
.L156:
	ldr	r3, .L175+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L172
.L157:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	ldrlt	r2, .L175
	addlt	r3, r3, #1
	strlt	r3, [r2, #0]
	b	.L155
.L164:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L152
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L152
	ldr	r3, .L175+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L173
.L153:
	ldr	r3, .L175+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L174
.L154:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldrgt	r2, .L175
	subgt	r3, r3, #1
	strgt	r3, [r2, #0]
	b	.L152
.L172:
	bl	wall2Collision
	b	.L157
.L174:
	bl	wall2Collision
	b	.L154
.L170:
	bl	wall2Collision
	b	.L160
.L169:
	bl	wallCollision
	b	.L159
.L171:
	bl	wallCollision
	b	.L156
.L173:
	bl	wallCollision
	b	.L153
.L168:
	bl	wall2Collision
	b	.L163
.L167:
	bl	wallCollision
	b	.L162
.L176:
	.align	2
.L175:
	.word	shooter
	.word	collisionMapBitmap
	.word	wall
	.word	wall2
	.size	moveShooter, .-moveShooter
	.align	2
	.global	moveFighter
	.type	moveFighter, %function
moveFighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L178
	ldr	r4, .L201
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L201+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L190
.L178:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L181
	ldr	r4, .L201
	ldr	r3, [r4, #0]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	add	r0, r0, r3
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L201+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L191
.L181:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L184
	ldr	r4, .L201
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #2
	ldr	r3, .L201+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L192
.L184:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L177
	ldr	r4, .L201
	ldr	r3, [r4, #12]
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	sub	r2, r2, #1
	add	r0, r1, #5
	ldr	r3, .L201+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L177
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L177
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L177
	ldr	r3, .L201+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L193
.L188:
	ldr	r3, .L201+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L194
.L189:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	chestCollision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	ldrle	r2, .L201
	addle	r3, r3, #1
	strle	r3, [r2, #4]
.L177:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L192:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L184
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L184
	ldr	r3, .L201+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L195
.L185:
	ldr	r3, .L201+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L196
.L186:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	leverCollision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, .L201
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	b	.L184
.L191:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L181
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L181
	ldr	r3, .L201+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L197
.L182:
	ldr	r3, .L201+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L198
.L183:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	ldrlt	r2, .L201
	addlt	r3, r3, #1
	strlt	r3, [r2, #0]
	b	.L181
.L190:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L178
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L178
	ldr	r3, .L201+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L199
.L179:
	ldr	r3, .L201+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L200
.L180:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldrgt	r2, .L201
	subgt	r3, r3, #1
	strgt	r3, [r2, #0]
	b	.L178
.L198:
	bl	wall2Collision
	b	.L183
.L200:
	bl	wall2Collision
	b	.L180
.L196:
	bl	wall2Collision
	b	.L186
.L195:
	bl	wallCollision
	b	.L185
.L197:
	bl	wallCollision
	b	.L182
.L199:
	bl	wallCollision
	b	.L179
.L194:
	bl	wall2Collision
	b	.L189
.L193:
	bl	wallCollision
	b	.L188
.L202:
	.align	2
.L201:
	.word	fighter
	.word	collisionMapBitmap
	.word	wall
	.word	wall2
	.size	moveFighter, .-moveFighter
	.align	2
	.global	moveGame2Shooter
	.type	moveGame2Shooter, %function
moveGame2Shooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L204
	ldr	r4, .L227
	ldr	r2, [r4, #0]
	ldr	r1, [r4, #4]
	add	r2, r2, #4
	ldr	r3, .L227+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L216
.L204:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L207
	ldr	r4, .L227
	ldr	r3, [r4, #0]
	ldmib	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	ldr	r3, .L227+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L217
.L207:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L210
	ldr	r4, .L227
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #4
	ldr	r3, .L227+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L218
.L210:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L203
	ldr	r4, .L227
	ldmia	r4, {r1, r3}	@ phole ldm
	ldr	r2, [r4, #12]
	add	r0, r1, #5
	add	r2, r2, r3
	add	r0, r2, r0, asl #8
	ldr	r3, .L227+4
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L203
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L203
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L203
	ldr	r3, .L227+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L219
.L214:
	ldr	r3, .L227+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L220
.L215:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	chestCollision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	ldrle	r2, .L227
	addle	r3, r3, #1
	strle	r3, [r2, #4]
.L203:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L218:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L210
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L210
	ldr	r3, .L227+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L221
.L211:
	ldr	r3, .L227+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L222
.L212:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	leverCollision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, .L227
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	b	.L210
.L217:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L207
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L207
	ldr	r3, .L227+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L223
.L208:
	ldr	r3, .L227+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L224
.L209:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	ldrlt	r2, .L227
	addlt	r3, r3, #1
	strlt	r3, [r2, #0]
	b	.L207
.L216:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L204
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L204
	ldr	r3, .L227+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L225
.L205:
	ldr	r3, .L227+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L226
.L206:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldrgt	r2, .L227
	subgt	r3, r3, #1
	strgt	r3, [r2, #0]
	b	.L204
.L224:
	bl	wall2Collision
	b	.L209
.L226:
	bl	wall2Collision
	b	.L206
.L222:
	bl	wall2Collision
	b	.L212
.L221:
	bl	wallCollision
	b	.L211
.L223:
	bl	wallCollision
	b	.L208
.L225:
	bl	wallCollision
	b	.L205
.L220:
	bl	wall2Collision
	b	.L215
.L219:
	bl	wallCollision
	b	.L214
.L228:
	.align	2
.L227:
	.word	shooter
	.word	collisionMap2Bitmap
	.word	wall
	.word	wall2
	.size	moveGame2Shooter, .-moveGame2Shooter
	.align	2
	.global	moveTut7Shooter
	.type	moveTut7Shooter, %function
moveTut7Shooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L230
	ldr	r4, .L238
	ldr	r2, [r4, #0]
	ldr	r1, [r4, #4]
	add	r2, r2, #4
	ldr	r3, .L238+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L234
.L230:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L231
	ldr	r4, .L238
	ldr	r3, [r4, #0]
	ldmib	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	ldr	r3, .L238+4
	add	r2, r1, r2, asl #8
	add	r1, r3, r2, asl #1
	ldrh	r1, [r1, #10]
	cmp	r1, #0
	bne	.L235
.L231:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L232
	ldr	r4, .L238
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #4
	ldr	r3, .L238+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L236
.L232:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L229
	ldr	r4, .L238
	ldmia	r4, {r1, r3}	@ phole ldm
	ldr	r2, [r4, #12]
	add	r0, r1, #5
	add	r2, r2, r3
	add	r0, r2, r0, asl #8
	ldr	r3, .L238+4
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L229
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L229
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L237
.L229:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L236:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L232
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L232
	mov	r0, #7
	bl	door2Collision
	bl	leverCollision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
	b	.L232
.L235:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L231
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L231
	mov	r0, #7
	bl	door2Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r4, #0]
	b	.L231
.L234:
	ldr	r1, [r4, #12]
	add	r0, r1, r1, lsr #31
	add	r0, r2, r0, asr #1
	add	r0, r3, r0, asl #1
	ldrh	r0, [r0, #6]
	cmp	r0, #0
	beq	.L230
	add	r2, r2, r1
	add	r3, r3, r2, asl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L230
	mov	r0, #7
	bl	door2Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r4, #0]
	b	.L230
.L237:
	mov	r0, #7
	bl	door2Collision
	bl	chestCollision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	addle	r3, r3, #1
	strle	r3, [r4, #4]
	b	.L229
.L239:
	.align	2
.L238:
	.word	shooter
	.word	collisionMapTut7Bitmap
	.size	moveTut7Shooter, .-moveTut7Shooter
	.align	2
	.global	moveGame2Fighter
	.type	moveGame2Fighter, %function
moveGame2Fighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	bne	.L241
	ldr	r4, .L264
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r0, r0, #4
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L264+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L253
.L241:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	bne	.L244
	ldr	r4, .L264
	ldr	r3, [r4, #0]
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	add	r0, r0, r3
	mov	r0, r0, asl #8
	add	r2, r1, #3
	ldr	r3, .L264+4
	add	r2, r0, r2
	mov	ip, r2, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	bne	.L254
.L244:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L247
	ldr	r4, .L264
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r0, r1, #5
	add	r2, r2, #2
	ldr	r3, .L264+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	bne	.L255
.L247:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L240
	ldr	r4, .L264
	ldr	r3, [r4, #12]
	ldmia	r4, {r1, r2}	@ phole ldm
	add	r2, r2, r3
	sub	r2, r2, #1
	add	r0, r1, #5
	ldr	r3, .L264+4
	add	r0, r2, r0, asl #8
	mov	r0, r0, asl #1
	ldrh	r0, [r3, r0]
	cmp	r0, #0
	beq	.L240
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L240
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L240
	ldr	r3, .L264+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L256
.L251:
	ldr	r3, .L264+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L257
.L252:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	chestCollision
	ldr	r3, [r4, #4]
	cmp	r3, #239
	ldrle	r2, .L264
	addle	r3, r3, #1
	strle	r3, [r2, #4]
.L240:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L255:
	ldr	r0, [r4, #8]
	add	ip, r0, r0, lsr #31
	add	ip, r1, ip, asr #1
	add	ip, r2, ip, asl #8
	mov	ip, ip, asl #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	beq	.L247
	add	r1, r1, r0
	sub	r1, r1, #1
	add	r2, r2, r1, asl #8
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L247
	ldr	r3, .L264+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L258
.L248:
	ldr	r3, .L264+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L259
.L249:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	bl	leverCollision
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ldrgt	r2, .L264
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	b	.L247
.L254:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L244
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L244
	ldr	r3, .L264+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L260
.L245:
	ldr	r3, .L264+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L261
.L246:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r2, [r4, #8]
	ldr	r3, [r4, #0]
	rsb	r2, r2, #160
	cmp	r3, r2
	ldrlt	r2, .L264
	addlt	r3, r3, #1
	strlt	r3, [r2, #0]
	b	.L244
.L253:
	ldr	ip, [r4, #12]
	add	r5, ip, ip, lsr #31
	add	r2, r2, r5, asr #1
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L241
	add	r1, r0, r1
	add	ip, r1, ip
	add	r3, r3, ip, asl #1
	ldrh	r3, [r3, #-4]
	cmp	r3, #0
	beq	.L241
	ldr	r3, .L264+8
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L262
.L242:
	ldr	r3, .L264+12
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L263
.L243:
	mov	r0, #0
	bl	door1Collision
	mov	r0, #0
	bl	door2Collision
	ldr	r3, [r4, #0]
	cmp	r3, #0
	ldrgt	r2, .L264
	subgt	r3, r3, #1
	strgt	r3, [r2, #0]
	b	.L241
.L261:
	bl	wall2Collision
	b	.L246
.L263:
	bl	wall2Collision
	b	.L243
.L259:
	bl	wall2Collision
	b	.L249
.L258:
	bl	wallCollision
	b	.L248
.L260:
	bl	wallCollision
	b	.L245
.L262:
	bl	wallCollision
	b	.L242
.L257:
	bl	wall2Collision
	b	.L252
.L256:
	bl	wallCollision
	b	.L251
.L265:
	.align	2
.L264:
	.word	fighter
	.word	collisionMap2Bitmap
	.word	wall
	.word	wall2
	.size	moveGame2Fighter, .-moveGame2Fighter
	.align	2
	.global	playerObjectCollision
	.type	playerObjectCollision, %function
playerObjectCollision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	ip, [sp, #12]
	ldr	r5, [sp, #16]
	sub	r4, ip, #2
	add	r4, r4, r5
	cmp	r4, r1
	ldr	r4, [sp, #8]
	ble	.L272
	sub	r1, r1, #2
	add	r2, r1, r2
	cmp	ip, r2
	bge	.L272
	ldr	r2, [sp, #20]
	sub	r1, r4, #2
	add	r2, r1, r2
	cmp	r2, r0
	ble	.L272
	sub	r0, r0, #2
	add	r3, r0, r3
	cmp	r4, r3
	bge	.L272
	ldr	r3, .L273
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ldreq	r3, .L273+4
	ldrne	r3, .L273+8
	ldreq	r2, [r3, #44]
	ldrne	r2, [r3, #44]
	subeq	r2, r2, #10
	subne	r2, r2, #5
	streq	r2, [r3, #44]
	moveq	r0, #1
	strne	r2, [r3, #44]
	movne	r0, #1
	b	.L267
.L272:
	mov	r0, #0
.L267:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L274:
	.align	2
.L273:
	.word	.LANCHOR0
	.word	fighter
	.word	shooter
	.size	playerObjectCollision, .-playerObjectCollision
	.align	2
	.global	moveOrb2
	.type	moveOrb2, %function
moveOrb2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L284
	ldr	r1, .L284+4
	sub	sp, sp, #16
	ldr	r2, [r3, #28]
	ldr	r0, [r1, #4]
	cmp	r2, r0
	beq	.L283
	ldr	r0, [r1, #16]
	cmp	r2, r0
	ldreq	ip, [r3, #4]
	ldreq	r2, [r3, #24]
	rsbeq	ip, r2, ip
	ldrne	ip, [r3, #4]
	streq	ip, [r3, #4]
.L277:
	ldr	r2, [r3, #36]
	ldr	r0, .L284+8
	smull	r4, r0, r2, r0
	mov	r4, r2, asr #31
	add	r0, r0, r2
	rsb	r0, r4, r0, asr #4
	rsb	r0, r0, r0, asl #4
	cmp	r2, r0, asl #1
	ldr	r2, .L284
	bne	.L279
	ldr	r4, [r2, #32]
	add	r4, r4, #1
	mov	r0, r4, asr #31
	mov	r0, r0, lsr #30
	add	r4, r4, r0
	and	r4, r4, #3
	rsb	r0, r0, r4
	str	r0, [r2, #32]
.L279:
	cmp	ip, #149
	bgt	.L280
	ldr	r2, [r1, #4]
	mov	r1, #150
	str	r1, [r3, #4]
	str	r2, [r3, #28]
.L281:
	ldr	r3, [r3, #44]
	cmp	r3, #0
	ldr	r4, .L284
	beq	.L275
	ldr	ip, .L284+12
	ldr	r5, [ip, #4]
	ldr	lr, [ip, #12]
	ldr	r6, [ip, #0]
	ldr	ip, [ip, #8]
	ldmia	r4, {r0, r1, r2, r3}	@ phole ldm
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	str	r6, [sp, #0]
	bl	playerObjectCollision
	ldr	ip, .L284+16
	ldmia	r4, {r0, r1, r2, r3}	@ phole ldm
	ldr	r5, [ip, #0]
	ldmib	ip, {r4, ip, lr}	@ phole ldm
	str	r5, [sp, #0]
	stmib	sp, {r4, lr}	@ phole stm
	str	ip, [sp, #12]
	bl	playerObjectCollision
.L275:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L280:
	cmp	ip, #200
	ldrgt	r2, [r1, #16]
	movgt	r1, #200
	strgt	r1, [r3, #4]
	strgt	r2, [r3, #28]
	b	.L281
.L283:
	ldr	r2, [r3, #4]
	ldr	ip, [r3, #24]
	add	ip, ip, r2
	str	ip, [r3, #4]
	b	.L277
.L285:
	.align	2
.L284:
	.word	orb2
	.word	.LANCHOR1
	.word	-2004318071
	.word	fighter
	.word	shooter
	.size	moveOrb2, .-moveOrb2
	.align	2
	.global	moveOrb1
	.type	moveOrb1, %function
moveOrb1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L308
	ldr	r1, .L308+4
	sub	sp, sp, #16
	ldr	r2, [r3, #28]
	ldr	r0, [r1, #4]
	cmp	r2, r0
	beq	.L303
	ldr	r0, [r1, #20]
	cmp	r2, r0
	beq	.L304
	ldr	r0, [r1, #16]
	cmp	r2, r0
	beq	.L305
	ldr	r0, [r1, #0]
	cmp	r2, r0
	ldreq	r2, [r3, #0]
	ldreq	r0, [r3, #20]
	addeq	r2, r0, r2
	streq	r2, [r3, #0]
	ldr	r0, [r3, #4]
.L288:
	ldr	r2, [r3, #36]
	ldr	ip, .L308+8
	smull	r4, ip, r2, ip
	mov	r4, r2, asr #31
	add	ip, ip, r2
	rsb	ip, r4, ip, asr #4
	rsb	ip, ip, ip, asl #4
	cmp	r2, ip, asl #1
	ldr	r2, .L308
	bne	.L292
	ldr	r4, [r2, #32]
	add	r4, r4, #1
	mov	ip, r4, asr #31
	mov	ip, ip, lsr #30
	add	r4, r4, ip
	and	r4, r4, #3
	rsb	ip, ip, r4
	str	ip, [r2, #32]
.L292:
	cmp	r0, #60
	bgt	.L293
	ldr	r2, [r3, #0]
	cmp	r2, #130
	ldr	r2, .L308
	ble	.L295
	ldr	r4, [r2, #28]
	ldr	ip, [r1, #0]
	cmp	r4, ip
	beq	.L306
.L295:
	cmp	r0, #159
	bgt	.L301
	cmp	r0, #59
	bgt	.L299
	ldr	r2, [r3, #0]
	cmp	r2, #100
	ldr	r2, .L308
	bgt	.L299
	ldr	r0, [r2, #28]
	ldr	r1, [r1, #16]
	cmp	r0, r1
	beq	.L307
.L299:
	ldr	r3, [r3, #44]
	cmp	r3, #0
	ldr	r4, .L308
	beq	.L286
	ldr	ip, .L308+12
	ldr	r5, [ip, #4]
	ldr	lr, [ip, #12]
	ldr	r6, [ip, #0]
	ldr	ip, [ip, #8]
	ldmia	r4, {r0, r1, r2, r3}	@ phole ldm
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	str	r6, [sp, #0]
	bl	playerObjectCollision
	ldr	ip, .L308+16
	ldmia	r4, {r0, r1, r2, r3}	@ phole ldm
	ldr	r5, [ip, #0]
	ldmib	ip, {r4, ip, lr}	@ phole ldm
	str	r5, [sp, #0]
	stmib	sp, {r4, lr}	@ phole stm
	str	ip, [sp, #12]
	bl	playerObjectCollision
.L286:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L293:
	cmp	r0, #160
	ble	.L295
	ldr	r2, [r3, #0]
	cmp	r2, #129
	ldr	r2, .L308
	ble	.L301
	ldr	ip, [r2, #28]
	ldr	r0, [r1, #4]
	cmp	ip, r0
	bne	.L301
	ldr	r0, .L308+4
	mov	ip, #160
	ldr	r0, [r0, #20]
	str	ip, [r2, #4]
	mov	ip, #130
	str	ip, [r2, #0]
	str	r0, [r2, #28]
.L301:
	ldr	r2, [r3, #0]
	cmp	r2, #99
	ldr	r2, .L308
	bgt	.L299
	ldr	r0, [r2, #28]
	ldr	r1, [r1, #20]
	cmp	r0, r1
	bne	.L299
	ldr	r1, .L308+4
	mov	r0, #160
	ldr	r1, [r1, #16]
	str	r0, [r2, #4]
	mov	r0, #100
	str	r0, [r2, #0]
	str	r1, [r2, #28]
	b	.L299
.L303:
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #24]
	add	r0, r0, r2
	str	r0, [r3, #4]
	b	.L288
.L304:
	ldr	r0, [r3, #0]
	ldr	r2, [r3, #20]
	rsb	r2, r2, r0
	str	r2, [r3, #0]
	ldr	r0, [r3, #4]
	b	.L288
.L305:
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #24]
	rsb	r0, r2, r0
	str	r0, [r3, #4]
	b	.L288
.L307:
	ldr	r1, .L308+4
	mov	r0, #60
	ldr	r1, [r1, #0]
	str	r0, [r2, #4]
	mov	r0, #100
	str	r0, [r2, #0]
	str	r1, [r2, #28]
	b	.L299
.L306:
	ldr	r1, .L308+4
	mov	r0, #60
	ldr	r1, [r1, #4]
	str	r0, [r2, #4]
	mov	r0, #130
	str	r0, [r2, #0]
	str	r1, [r2, #28]
	b	.L299
.L309:
	.align	2
.L308:
	.word	orb1
	.word	.LANCHOR1
	.word	-2004318071
	.word	fighter
	.word	shooter
	.size	moveOrb1, .-moveOrb1
	.align	2
	.global	checkWin
	.type	checkWin, %function
checkWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L313
	ldr	r3, [r3, #0]
	cmp	r3, #140
	bgt	.L312
	ldr	r3, .L313+4
	ldr	r0, [r3, #0]
	cmp	r0, #140
	movle	r0, #0
	movgt	r0, #1
	bx	lr
.L312:
	mov	r0, #1
	bx	lr
.L314:
	.align	2
.L313:
	.word	fighter
	.word	shooter
	.size	checkWin, .-checkWin
	.align	2
	.global	checkNoLives
	.type	checkNoLives, %function
checkNoLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L318
	ldr	r3, [r3, #44]
	cmp	r3, #0
	ble	.L317
	ldr	r3, .L318+4
	ldr	r0, [r3, #44]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L317:
	mov	r0, #1
	bx	lr
.L319:
	.align	2
.L318:
	.word	fighter
	.word	shooter
	.size	checkNoLives, .-checkNoLives
	.align	2
	.global	drawFighter
	.type	drawFighter, %function
drawFighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L326
	stmfd	sp!, {r4, lr}
	ldr	r1, [r3, #4]
	ldr	r4, .L326+4
	add	r1, r1, #2
	ldr	ip, [r4, #16]
	mov	r1, r1, asl #23
	ldr	r2, .L326+8
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	orr	r1, r1, #16384
	cmp	ip, #1
	mov	ip, #512	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #0]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	beq	.L324
	ldr	r1, [r4, #20]
	cmp	r1, #1
	beq	.L325
	ldr	r1, [r3, #36]
	ldr	r3, [r3, #28]
	add	r3, r3, r1, asl #5
	mov	r3, r3, asl #1
	strh	r3, [r2, #4]	@ movhi
.L320:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L325:
	ldr	r0, [r3, #36]
	ldr	ip, [r3, #28]
	add	r0, r0, #3
	add	r0, ip, r0, asl #5
	mov	r0, r0, asl #1
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #0
	str	r2, [r4, #20]
	mov	r2, #11
	ldr	r1, .L326+12
	str	r2, [r3, #12]
	mov	r2, #15
	str	r2, [r3, #8]
	mov	r3, #8
	str	r3, [r1, #12]
	mov	r3, #16
	str	r3, [r1, #8]
	b	.L320
.L324:
	ldr	r1, .L326+16
	ldr	r3, [r3, #28]
	ldr	r1, [r1, #24]
	add	r3, r3, r1, asl #4
	mov	r3, r3, asl #1
	strh	r3, [r2, #4]	@ movhi
	ldr	r3, .L326+20
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L320
.L327:
	.align	2
.L326:
	.word	fighter
	.word	.LANCHOR0
	.word	shadowOAM
	.word	shooter
	.word	.LANCHOR1
	.word	waitForVblank
	.size	drawFighter, .-drawFighter
	.align	2
	.global	drawShooter
	.type	drawShooter, %function
drawShooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L334
	stmfd	sp!, {r4, lr}
	ldr	r1, [r2, #4]
	ldr	r4, .L334+4
	add	r1, r1, #2
	ldr	ip, [r4, #16]
	mov	r1, r1, asl #23
	ldr	r3, .L334+8
	ldrb	r0, [r2, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	orr	r1, r1, #16384
	cmp	ip, #1
	mov	ip, #512	@ movhi
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	beq	.L332
	ldr	r1, [r4, #24]
	cmp	r1, #1
	beq	.L333
	ldr	r0, [r2, #36]
	ldr	r1, [r2, #28]
	add	r2, r0, #7
	add	r2, r1, r2, asl #5
	mov	r2, r2, asl #1
	strh	r2, [r3, #12]	@ movhi
.L328:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L332:
	ldr	r1, .L334+12
	ldr	r2, [r2, #28]
	ldr	r1, [r1, #28]
	add	r2, r2, r1, asl #4
	mov	r2, r2, asl #1
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L334+16
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #16]
	b	.L328
.L333:
	ldr	r1, .L334+12
	ldr	r2, [r2, #28]
	ldr	r1, [r1, #32]
	add	r2, r2, r1, asl #4
	mov	r2, r2, asl #1
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L334+16
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #24]
	b	.L328
.L335:
	.align	2
.L334:
	.word	shooter
	.word	.LANCHOR0
	.word	shadowOAM
	.word	.LANCHOR1
	.word	waitForVblank
	.size	drawShooter, .-drawShooter
	.align	2
	.global	drawCharacters
	.type	drawCharacters, %function
drawCharacters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L339
	ldr	r3, [r3, #4]
	cmp	r3, #1
	beq	.L338
	b	drawFighter
.L338:
	b	drawShooter
.L340:
	.align	2
.L339:
	.word	.LANCHOR0
	.size	drawCharacters, .-drawCharacters
	.align	2
	.global	drawOrb1
	.type	drawOrb1, %function
drawOrb1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L344
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #44]
	mov	r1, r1, asl #23
	ldr	r2, .L344+4
	mov	r1, r1, lsr #23
	cmp	ip, #0
	orr	r1, r1, #16384
	strh	r1, [r2, #18]	@ movhi
	ldrne	r1, .L344+8
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	ldrne	r1, [r1, #36]
	ldrne	r3, [r3, #32]
	addne	r3, r3, r1, asl #4
	moveq	r3, #960	@ movhi
	movne	r3, r3, asl #1
	strh	r0, [r2, #16]	@ movhi
	streqh	r3, [r2, #20]	@ movhi
	strneh	r3, [r2, #20]	@ movhi
	bx	lr
.L345:
	.align	2
.L344:
	.word	orb1
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawOrb1, .-drawOrb1
	.align	2
	.global	drawOrb2
	.type	drawOrb2, %function
drawOrb2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L349
	ldr	r1, [r3, #4]
	ldr	ip, [r3, #44]
	mov	r1, r1, asl #23
	ldr	r2, .L349+4
	mov	r1, r1, lsr #23
	cmp	ip, #0
	orr	r1, r1, #16384
	strh	r1, [r2, #26]	@ movhi
	ldrne	r1, .L349+8
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	ldrne	r1, [r1, #36]
	ldrne	r3, [r3, #32]
	addne	r3, r3, r1, asl #4
	moveq	r3, #960	@ movhi
	movne	r3, r3, asl #1
	strh	r0, [r2, #24]	@ movhi
	streqh	r3, [r2, #28]	@ movhi
	strneh	r3, [r2, #28]	@ movhi
	bx	lr
.L350:
	.align	2
.L349:
	.word	orb2
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawOrb2, .-drawOrb2
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawOrb1
	ldmfd	sp!, {r4, lr}
	b	drawOrb2
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawPBullets
	.type	drawPBullets, %function
drawPBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L358
	stmfd	sp!, {r4, r5, r6}
	ldr	ip, [r3, #8]
	cmp	ip, #0
	ble	.L352
	ldr	r5, [r3, #40]
	mov	r5, r5, asl #21
	ldr	r3, .L358+4
	ldr	r2, .L358+8
	mov	r5, r5, lsr #16
	mov	r1, #0
	b	.L356
.L354:
	ldr	r4, [r3, #-24]
	ldr	r0, [r3, #-12]
	mov	r4, r4, asl #23
	ldrb	r6, [r3, #-28]	@ zero_extendqisi2
	mov	r4, r4, lsr #23
	add	r1, r1, #1
	orr	r4, r4, #16384
	add	r0, r5, r0
	cmp	ip, r1
	strh	r6, [r2, #32]	@ movhi
	strh	r4, [r2, #34]	@ movhi
	strh	r0, [r2, #36]	@ movhi
	add	r3, r3, #32
	add	r2, r2, #8
	ble	.L352
.L356:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	bne	.L354
	ldr	r4, [r3, #-24]
	ldr	r0, [r3, #-12]
	mov	r4, r4, asl #23
	mov	r4, r4, lsr #23
	add	r1, r1, #1
	orr	r4, r4, #16384
	add	r0, r5, r0
	mov	r6, #512	@ movhi
	cmp	ip, r1
	strh	r6, [r2, #32]	@ movhi
	strh	r4, [r2, #34]	@ movhi
	strh	r0, [r2, #36]	@ movhi
	add	r3, r3, #32
	add	r2, r2, #8
	bgt	.L356
.L352:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L359:
	.align	2
.L358:
	.word	.LANCHOR1
	.word	pBullets+28
	.word	shadowOAM
	.size	drawPBullets, .-drawPBullets
	.align	2
	.global	drawTBullets
	.type	drawTBullets, %function
drawTBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L366
	stmfd	sp!, {r4, r5, r6}
	ldr	ip, [r3, #12]
	cmp	ip, #0
	ble	.L360
	ldr	r5, [r3, #40]
	mov	r5, r5, asl #21
	ldr	r3, .L366+4
	ldr	r2, .L366+8
	mov	r5, r5, lsr #16
	mov	r1, #0
	b	.L364
.L362:
	ldr	r4, [r3, #-24]
	ldr	r0, [r3, #-12]
	mov	r4, r4, asl #23
	ldrb	r6, [r3, #-28]	@ zero_extendqisi2
	mov	r4, r4, lsr #23
	add	r1, r1, #1
	orr	r4, r4, #16384
	add	r0, r5, r0
	cmp	ip, r1
	strh	r6, [r2, #72]	@ movhi
	strh	r4, [r2, #74]	@ movhi
	strh	r0, [r2, #76]	@ movhi
	add	r3, r3, #32
	add	r2, r2, #8
	ble	.L360
.L364:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	bne	.L362
	ldr	r4, [r3, #-24]
	ldr	r0, [r3, #-12]
	mov	r4, r4, asl #23
	mov	r4, r4, lsr #23
	add	r1, r1, #1
	orr	r4, r4, #16384
	add	r0, r5, r0
	mov	r6, #512	@ movhi
	cmp	ip, r1
	strh	r6, [r2, #72]	@ movhi
	strh	r4, [r2, #74]	@ movhi
	strh	r0, [r2, #76]	@ movhi
	add	r3, r3, #32
	add	r2, r2, #8
	bgt	.L364
.L360:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L367:
	.align	2
.L366:
	.word	.LANCHOR1
	.word	tBullets+28
	.word	shadowOAM
	.size	drawTBullets, .-drawTBullets
	.align	2
	.global	drawBullets
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawPBullets
	ldmfd	sp!, {r4, lr}
	b	drawTBullets
	.size	drawBullets, .-drawBullets
	.align	2
	.global	drawBlock
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L370
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, .L370+4
	ldr	ip, [r1, #4]
	ldr	r6, [r3, #44]
	ldr	r5, [r3, #48]
	ldrb	r4, [r1, #0]	@ zero_extendqisi2
	ldr	r3, .L370+8
	mov	ip, ip, asl #23
	mov	r2, #368
	mov	ip, ip, lsr #23
	add	r0, r2, #2
	strh	r4, [r3, r2]	@ movhi
	orr	ip, ip, #16384
	add	r1, r5, r6, asl #5
	mov	r2, #372
	strh	ip, [r3, r0]	@ movhi
	strh	r1, [r3, r2]	@ movhi
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L371:
	.align	2
.L370:
	.word	block
	.word	.LANCHOR1
	.word	shadowOAM
	.size	drawBlock, .-drawBlock
	.align	2
	.global	drawDoor1
	.type	drawDoor1, %function
drawDoor1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L376
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #24]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #23
	ldr	r2, .L376+4
	mov	r3, #376
	mov	r1, r1, lsr #23
	orr	ip, ip, #16384
	add	r3, r3, #2
	orr	r1, r1, #16384
	cmp	r0, #1
	mov	r0, #376
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	beq	.L375
	ldr	r3, .L376+8
	ldr	r1, [r3, #28]
	ldr	r3, .L376+12
	ldr	r3, [r3, #56]
	add	r1, r3, r1, asl #5
	mov	r3, #380
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L375:
	ldr	r3, .L376+12
	add	r1, r3, #52
	ldmia	r1, {r1, r3}	@ phole ldm
	add	r1, r3, r1, asl #5
	mov	r3, #380
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L377:
	.align	2
.L376:
	.word	doorA
	.word	shadowOAM
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	drawDoor1, .-drawDoor1
	.align	2
	.global	drawDoor2
	.type	drawDoor2, %function
drawDoor2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L382
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #24]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #23
	ldr	r2, .L382+4
	mov	r3, #384
	mov	r1, r1, lsr #23
	orr	ip, ip, #16384
	add	r3, r3, #2
	orr	r1, r1, #16384
	cmp	r0, #1
	mov	r0, #384
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	beq	.L381
	ldr	r3, .L382+8
	ldr	r1, [r3, #28]
	ldr	r3, .L382+12
	ldr	r3, [r3, #60]
	add	r1, r3, r1, asl #5
	mov	r3, #388
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L381:
	ldr	r3, .L382+12
	ldr	r1, [r3, #52]
	ldr	r3, [r3, #60]
	add	r1, r3, r1, asl #5
	mov	r3, #388
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L383:
	.align	2
.L382:
	.word	doorExit
	.word	shadowOAM
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	drawDoor2, .-drawDoor2
	.align	2
	.global	drawWall
	.type	drawWall, %function
drawWall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L388
	str	r4, [sp, #-4]!
	ldr	r0, [r3, #4]
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	ldr	r1, [r3, #24]
	mov	r0, r0, asl #23
	ldr	r2, .L388+4
	mov	r3, #392
	mov	r0, r0, lsr #23
	orr	r4, r4, #16384
	add	r3, r3, #2
	orr	r0, r0, #16384
	mov	ip, #392
	cmp	r1, #1
	strh	r4, [r2, ip]	@ movhi
	strh	r0, [r2, r3]	@ movhi
	beq	.L387
	cmp	r1, #0
	bne	.L384
	ldr	r3, .L388+8
	ldr	r1, [r3, #28]
	ldr	r3, .L388+12
	ldr	r3, [r3, #68]
	add	r1, r3, r1, asl #5
	mov	r3, #396
	strh	r1, [r2, r3]	@ movhi
.L384:
	ldmfd	sp!, {r4}
	bx	lr
.L387:
	ldr	r3, .L388+12
	ldr	r1, [r3, #52]
	ldr	r3, [r3, #64]
	add	r1, r3, r1, asl #5
	mov	r3, #396
	strh	r1, [r2, r3]	@ movhi
	b	.L384
.L389:
	.align	2
.L388:
	.word	wall
	.word	shadowOAM
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	drawWall, .-drawWall
	.align	2
	.global	drawWall2
	.type	drawWall2, %function
drawWall2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L396
	ldr	r2, [r3, #24]
	cmp	r2, #1
	beq	.L395
	cmp	r2, #0
	ldreq	r2, .L396+4
	ldreq	r0, [r2, #28]
	ldreq	r2, .L396+8
	ldreq	r1, [r2, #76]
	ldreq	r2, .L396+12
	addeq	r0, r1, r0, asl #5
	moveq	r1, #404
	ldrne	r2, .L396+12
	streqh	r0, [r2, r1]	@ movhi
.L392:
	ldr	r1, [r3, #4]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, asl #23
	mvn	ip, ip, asl #17
	mov	r3, #400
	mov	r1, r1, lsr #23
	mvn	ip, ip, lsr #17
	add	r3, r3, #2
	orr	r1, r1, #16384
	mov	r0, #400
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L395:
	ldr	r2, .L396+8
	ldr	r1, [r2, #72]
	ldr	r0, [r2, #52]
	ldr	r2, .L396+12
	add	r0, r1, r0, asl #5
	mov	r1, #404
	strh	r0, [r2, r1]	@ movhi
	b	.L392
.L397:
	.align	2
.L396:
	.word	wall2
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shadowOAM
	.size	drawWall2, .-drawWall2
	.align	2
	.global	drawChest
	.type	drawChest, %function
drawChest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L402
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #24]
	mov	r1, r1, asl #23
	ldr	r2, .L402+4
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r3, #408
	add	r3, r3, #2
	orr	r1, r1, #16384
	cmp	r0, #1
	mov	r0, #408
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	beq	.L401
	ldr	r3, .L402+8
	ldr	r1, [r3, #80]
	ldr	r3, [r3, #88]
	add	r1, r3, r1, asl #5
	mov	r3, #412
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L401:
	ldr	r3, .L402+8
	add	r1, r3, #80
	ldmia	r1, {r1, r3}	@ phole ldm
	add	r1, r3, r1, asl #5
	mov	r3, #412
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L403:
	.align	2
.L402:
	.word	chest
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawChest, .-drawChest
	.align	2
	.global	drawLever
	.type	drawLever, %function
drawLever:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L408
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #24]
	mov	r1, r1, asl #23
	ldr	r2, .L408+4
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r3, #416
	add	r3, r3, #2
	orr	r1, r1, #16384
	cmp	r0, #1
	mov	r0, #416
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	beq	.L407
.L405:
	ldr	r3, .L408+8
	ldr	r1, [r3, #80]
	ldr	r3, [r3, #96]
	add	r1, r3, r1, asl #5
	mov	r3, #420
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L407:
	ldr	r3, .L408+12
	ldr	r3, [r3, #24]
	cmp	r3, #1
	bne	.L405
	ldr	r3, .L408+8
	ldr	r1, [r3, #80]
	ldr	r3, [r3, #92]
	add	r1, r3, r1, asl #5
	mov	r3, #420
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L409:
	.align	2
.L408:
	.word	lever
	.word	shadowOAM
	.word	.LANCHOR1
	.word	chest
	.size	drawLever, .-drawLever
	.align	2
	.global	drawButton
	.type	drawButton, %function
drawButton:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L414
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #24]
	mov	r1, r1, asl #23
	ldr	r2, .L414+4
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, r1, lsr #23
	mov	r3, #424
	add	r3, r3, #2
	orr	r1, r1, #16384
	cmp	r0, #1
	mov	r0, #424
	strh	ip, [r2, r0]	@ movhi
	strh	r1, [r2, r3]	@ movhi
	beq	.L413
	ldr	r3, .L414+8
	ldr	r1, [r3, #44]
	ldr	r3, [r3, #104]
	add	r1, r3, r1, asl #5
	mov	r3, #428
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L413:
	ldr	r3, .L414+8
	ldr	r1, [r3, #44]
	ldr	r3, [r3, #100]
	add	r1, r3, r1, asl #5
	mov	r3, #428
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L415:
	.align	2
.L414:
	.word	button
	.word	shadowOAM
	.word	.LANCHOR1
	.size	drawButton, .-drawButton
	.align	2
	.global	drawObjects
	.type	drawObjects, %function
drawObjects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	drawBlock
	bl	drawDoor1
	bl	drawDoor2
	bl	drawWall
	bl	drawWall2
	bl	drawChest
	bl	drawLever
	ldmfd	sp!, {r4, lr}
	b	drawButton
	.size	drawObjects, .-drawObjects
	.align	2
	.global	updateLives
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L421
	str	r4, [sp, #-4]!
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L418
	ldr	r2, .L421+4
	ldr	r3, .L421+8
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #44]
	mov	r0, r0, asl #23
	rsb	r1, r1, #332
.L420:
	ldr	r3, .L421+12
	ldrb	r4, [r2, #0]	@ zero_extendqisi2
	mov	r0, r0, lsr #23
	mov	r2, #432
	add	r2, r2, #2
	add	r1, r1, #2
	orr	r0, r0, #16384
	strh	r0, [r3, r2]	@ movhi
	mov	r1, r1, asl #1
	mov	ip, #432
	mov	r2, #436
	strh	r4, [r3, ip]	@ movhi
	strh	r1, [r3, r2]	@ movhi
.L417:
	ldmfd	sp!, {r4}
	bx	lr
.L418:
	cmp	r3, #1
	bne	.L417
	ldr	r2, .L421+4
	ldr	r3, .L421+16
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #44]
	mov	r0, r0, asl #23
	rsb	r1, r1, #364
	b	.L420
.L422:
	.align	2
.L421:
	.word	.LANCHOR0
	.word	livesNum
	.word	fighter
	.word	shadowOAM
	.word	shooter
	.size	updateLives, .-updateLives
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L424+8
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	ip, [ip, #0]
	mov	r8, r0
	mov	r5, #0
	mov	r4, #67108864
	add	ip, ip, #24
	mov	r6, r2
	add	fp, r4, #256
	add	r2, r4, #164
	mov	sl, r1
	mov	r9, r3
	mov	r1, r8
	mov	r0, #2
	mov	r3, #910163968
	str	r5, [ip, #8]
	ldr	ip, .L424+12
	mov	lr, pc
	bx	ip
	mov	r1, r6
	ldr	r3, .L424+16
	mov	r0, #16777216
	strh	r5, [fp, #6]	@ movhi
	mov	lr, pc
	bx	r3
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r4, .L424+20
	mov	r3, r3, lsr #16
	strh	r3, [fp, #4]	@ movhi
	mov	r3, #128	@ movhi
	str	r8, [r4, #0]
	strh	r3, [fp, #6]	@ movhi
	mov	r3, #1
	ldr	r7, .L424+24
	str	r9, [r4, #16]
	str	r3, [r4, #12]
	mov	r0, sl
	str	sl, [r4, #4]
	str	r6, [r4, #8]
	mov	lr, pc
	bx	r7
	adr	r3, .L424
	ldmia	r3, {r2-r3}
	ldr	ip, .L424+28
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r0, r6
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	ip, .L424+32
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L424+36
	mov	lr, pc
	bx	r3
	str	r5, [r4, #28]
	str	r0, [r4, #20]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L425:
	.align	3
.L424:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	playerBulletCollision
	.type	playerBulletCollision, %function
playerBulletCollision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	ip, [sp, #16]
	ldr	r5, [sp, #24]
	sub	r4, ip, #1
	add	r4, r4, r5
	cmp	r4, r1
	ldr	r4, [sp, #20]
	ble	.L432
	sub	r1, r1, #1
	add	r2, r1, r2
	cmp	ip, r2
	bge	.L432
	ldr	r2, [sp, #28]
	sub	r1, r4, #1
	add	r2, r1, r2
	cmp	r2, r0
	ble	.L432
	sub	r0, r0, #1
	add	r3, r0, r3
	cmp	r4, r3
	bge	.L432
	ldr	r3, .L434
	ldr	r4, [r3, #4]
	cmp	r4, #1
	beq	.L433
	ldr	r4, .L434+4
	ldr	ip, [r4, #44]
	mov	r1, #4992
	sub	ip, ip, #1
	mov	r2, #11008
	ldr	r0, .L434+8
	add	r1, r1, #43
	add	r2, r2, #17
	mov	r3, #0
	str	ip, [r4, #44]
	bl	playSoundB
	mov	r0, #1
	str	r0, [r4, #48]
	b	.L427
.L432:
	mov	r0, #0
.L427:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L433:
	ldr	r5, .L434+12
	ldr	ip, [r5, #44]
	mov	r1, #4992
	sub	ip, ip, #1
	mov	r2, #11008
	ldr	r0, .L434+8
	add	r1, r1, #43
	add	r2, r2, #17
	mov	r3, #0
	str	ip, [r5, #44]
	bl	playSoundB
	str	r4, [r5, #48]
	mov	r0, r4
	b	.L427
.L435:
	.align	2
.L434:
	.word	.LANCHOR0
	.word	fighter
	.word	DamageSfx
	.word	shooter
	.size	playerBulletCollision, .-playerBulletCollision
	.global	__aeabi_idivmod
	.align	2
	.global	moveT2Bullets
	.type	moveT2Bullets, %function
moveT2Bullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L482
	sub	sp, sp, #20
	ldr	r2, [r3, #0]
	ldr	r4, .L482+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	mov	r0, r2
	ldr	r1, [r4, #0]
	ldr	r3, .L482+8
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldrne	r6, .L482+12
	bne	.L437
	ldr	r3, .L482+16
	mov	ip, r3
	mov	r2, r3
.L440:
	ldr	r0, [r2, #28]
	cmp	r0, #0
	beq	.L475
	add	r1, r1, #1
	cmp	r1, #7
	add	r2, r2, #32
	bne	.L440
	ldr	r6, .L482+12
.L439:
	ldr	r1, .L482+16
	mov	r2, #7
.L443:
	ldr	r0, [r1, #252]
	cmp	r0, #0
	beq	.L476
	add	r2, r2, #1
	cmp	r2, #14
	add	r1, r1, #32
	bne	.L443
.L442:
	ldr	r1, .L482+16
	mov	r2, #14
.L446:
	ldr	r0, [r1, #476]
	cmp	r0, #0
	beq	.L477
	add	r2, r2, #1
	cmp	r2, #21
	add	r1, r1, #32
	bne	.L446
.L445:
	ldr	r1, .L482+16
	mov	r2, #21
.L449:
	ldr	r0, [r1, #700]
	cmp	r0, #0
	beq	.L478
	add	r2, r2, #1
	cmp	r2, #28
	add	r1, r1, #32
	bne	.L449
.L448:
	mov	r2, #28
.L452:
	ldr	r1, [r3, #924]
	cmp	r1, #0
	beq	.L479
	add	r2, r2, #1
	cmp	r2, #35
	add	r3, r3, #32
	bne	.L452
.L451:
	ldr	r3, .L482+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L482+24
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	add	r0, r0, #125
	str	r0, [r4, #0]
.L437:
	ldr	r3, [r6, #12]
	cmp	r3, #7
	ble	.L436
	ldr	r4, .L482+16
	ldr	r7, .L482+28
	ldr	r8, .L482+32
	mov	r5, #7
	mov	sl, #0
.L462:
	ldr	r3, [r4, #252]
	cmp	r3, #0
	beq	.L454
	add	r3, r4, #232
	ldmda	r3, {r1, r3}
	add	r1, r3, r1
	sub	r3, r5, #7
	cmp	r3, #6
	str	r1, [r4, #228]
	bhi	.L455
	cmp	r1, #140
	streq	sl, [r4, #252]
.L455:
	sub	r3, r5, #14
	cmp	r3, #13
	ldrhi	r0, [r4, #224]
	bhi	.L456
	ldr	r0, [r4, #224]
	cmp	r0, #82
	streq	sl, [r4, #252]
.L456:
	sub	r3, r5, #28
	cmp	r3, #6
	ldrhi	r1, [r4, #228]
	bhi	.L458
	cmp	r1, #75
	streq	sl, [r4, #252]
.L458:
	cmp	r1, #5
	cmpne	r1, #230
	bne	.L480
.L459:
	str	sl, [r4, #252]
.L460:
	ldr	r3, [r4, #236]
	add	r0, r3, r0
	cmp	r0, #5
	cmpne	r0, #150
	str	r0, [r4, #224]
	bne	.L481
.L461:
	str	sl, [r4, #252]
.L454:
	ldr	r3, [r6, #12]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #32
	bgt	.L462
.L436:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L480:
	ldr	ip, [r8, #4]
	ldr	lr, [r8, #0]
	ldr	r9, [r8, #12]
	ldr	fp, [r8, #8]
	add	r2, r4, #244
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	bl	playerBulletCollision
	cmp	r0, #0
	ldreq	r0, [r4, #224]
	beq	.L460
	ldr	r0, [r4, #224]
	b	.L459
.L481:
	ldr	ip, [r7, #4]
	ldr	lr, [r7, #0]
	ldr	r9, [r7, #12]
	ldr	fp, [r7, #8]
	ldr	r1, [r4, #228]
	add	r2, r4, #244
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	bl	playerBulletCollision
	cmp	r0, #0
	beq	.L454
	b	.L461
.L476:
	add	r1, ip, r2, asl #5
	mov	lr, #232
	str	lr, [r1, #4]
	mov	lr, #140
	ldr	r0, [r6, #112]
	str	lr, [ip, r2, asl #5]
	mvn	r2, #0
	str	r2, [r1, #8]
	mov	r2, #1
	str	r0, [r1, #16]
	str	r2, [r1, #28]
	b	.L442
.L475:
	ldr	r6, .L482+12
	ldr	lr, [r6, #108]
	add	r2, ip, r1, asl #5
	str	r0, [ip, r1, asl #5]
	mvn	r1, #0
	stmib	r2, {r0, r1}	@ phole stm
	str	lr, [r2, #16]
	b	.L439
.L479:
	add	r3, ip, r2, asl #5
	mov	lr, #5
	ldr	r0, [r6, #112]
	mov	r1, #1
	str	lr, [r3, #4]
	mov	lr, #110
	str	lr, [ip, r2, asl #5]
	str	r1, [r3, #8]
	str	r0, [r3, #16]
	str	r1, [r3, #28]
	b	.L451
.L478:
	add	r1, ip, r2, asl #5
	mov	r5, #5
	ldr	lr, [r6, #108]
	mov	r0, #1
	str	r5, [r1, #4]
	mov	r5, #80
	str	r5, [ip, r2, asl #5]
	str	r0, [r1, #12]
	str	lr, [r1, #16]
	str	r0, [r1, #28]
	b	.L448
.L477:
	add	r1, ip, r2, asl #5
	mov	r5, #169
	ldr	lr, [r6, #108]
	mov	r0, #1
	str	r5, [r1, #4]
	mov	r5, #10
	str	r5, [ip, r2, asl #5]
	str	r0, [r1, #12]
	str	lr, [r1, #16]
	str	r0, [r1, #28]
	b	.L445
.L483:
	.align	2
.L482:
	.word	time
	.word	timeToNextTBullet
	.word	__aeabi_idivmod
	.word	.LANCHOR1
	.word	tBullets
	.word	rand
	.word	1374389535
	.word	shooter
	.word	fighter
	.size	moveT2Bullets, .-moveT2Bullets
	.align	2
	.global	moveTBullets
	.type	moveTBullets, %function
moveTBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L524
	sub	sp, sp, #20
	ldr	r2, [r3, #0]
	ldr	r4, .L524+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	mov	r0, r2
	ldr	r1, [r4, #0]
	ldr	r3, .L524+8
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	ldrne	r6, .L524+12
	bne	.L485
	ldr	r3, .L524+16
	mov	ip, r3
	mov	r2, r3
.L488:
	ldr	r0, [r2, #28]
	cmp	r0, #0
	beq	.L517
	add	r1, r1, #1
	cmp	r1, #7
	add	r2, r2, #32
	bne	.L488
	ldr	r6, .L524+12
.L487:
	ldr	r1, .L524+16
	mov	r2, #7
.L491:
	ldr	r0, [r1, #252]
	cmp	r0, #0
	beq	.L518
	add	r2, r2, #1
	cmp	r2, #14
	add	r1, r1, #32
	bne	.L491
.L490:
	ldr	r1, .L524+16
	mov	r2, #14
.L494:
	ldr	r0, [r1, #476]
	cmp	r0, #0
	beq	.L519
	add	r2, r2, #1
	cmp	r2, #21
	add	r1, r1, #32
	bne	.L494
.L493:
	ldr	r1, .L524+16
	mov	r2, #21
.L497:
	ldr	r0, [r1, #700]
	cmp	r0, #0
	beq	.L520
	add	r2, r2, #1
	cmp	r2, #28
	add	r1, r1, #32
	bne	.L497
.L496:
	mov	r2, #28
.L500:
	ldr	r1, [r3, #924]
	cmp	r1, #0
	beq	.L521
	add	r2, r2, #1
	cmp	r2, #35
	add	r3, r3, #32
	bne	.L500
.L499:
	ldr	r3, .L524+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L524+24
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	add	r0, r0, #125
	str	r0, [r4, #0]
.L485:
	ldr	r3, [r6, #12]
	cmp	r3, #7
	ble	.L484
	ldr	r4, .L524+16
	ldr	r7, .L524+28
	ldr	r8, .L524+32
	mov	r5, #7
	mov	sl, #0
.L507:
	ldr	r3, [r4, #252]
	cmp	r3, #0
	beq	.L502
	add	r3, r4, #232
	ldmda	r3, {r1, r3}
	add	r1, r3, r1
	sub	r3, r5, #7
	cmp	r3, #7
	str	r1, [r4, #228]
	bhi	.L503
	cmp	r1, #153
	streq	sl, [r4, #252]
.L503:
	cmp	r1, #5
	cmpne	r1, #230
	bne	.L522
.L504:
	ldr	r3, [r4, #224]
	ldr	r0, [r4, #236]
	add	r0, r0, r3
	cmp	r0, #5
	cmpne	r0, #150
	str	sl, [r4, #252]
	str	r0, [r4, #224]
	bne	.L523
.L506:
	str	sl, [r4, #252]
.L502:
	ldr	r3, [r6, #12]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #32
	bgt	.L507
.L484:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L522:
	ldr	ip, [r8, #4]
	ldr	lr, [r8, #0]
	ldr	r9, [r8, #12]
	ldr	fp, [r8, #8]
	ldr	r0, [r4, #224]
	add	r2, r4, #244
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	bl	playerBulletCollision
	cmp	r0, #0
	bne	.L504
	ldr	r3, [r4, #224]
	ldr	r0, [r4, #236]
	add	r0, r0, r3
	cmp	r0, #5
	cmpne	r0, #150
	str	r0, [r4, #224]
	beq	.L506
.L523:
	ldr	ip, [r7, #4]
	ldr	lr, [r7, #0]
	ldr	r9, [r7, #12]
	ldr	fp, [r7, #8]
	ldr	r1, [r4, #228]
	add	r2, r4, #244
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {ip, lr}	@ phole stm
	str	r9, [sp, #8]
	str	fp, [sp, #12]
	bl	playerBulletCollision
	cmp	r0, #0
	beq	.L502
	b	.L506
.L518:
	add	r1, ip, r2, asl #5
	mov	lr, #210
	str	lr, [r1, #4]
	mov	lr, #61
	ldr	r0, [r6, #112]
	str	lr, [ip, r2, asl #5]
	mvn	r2, #0
	str	r2, [r1, #8]
	mov	r2, #1
	str	r0, [r1, #16]
	str	r2, [r1, #28]
	b	.L490
.L517:
	ldr	r6, .L524+12
	ldr	lr, [r6, #108]
	add	r2, ip, r1, asl #5
	str	r0, [ip, r1, asl #5]
	mvn	r1, #0
	stmib	r2, {r0, r1}	@ phole stm
	str	lr, [r2, #16]
	b	.L487
.L521:
	add	r3, ip, r2, asl #5
	mov	lr, #61
	ldr	r0, [r6, #108]
	mov	r1, #1
	str	lr, [r3, #4]
	mov	lr, #18
	str	lr, [ip, r2, asl #5]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3, #28]
	b	.L499
.L520:
	add	r1, ip, r2, asl #5
	mov	lr, #65
	str	lr, [r1, #4]
	mov	lr, #71
	ldr	r0, [r6, #112]
	str	lr, [ip, r2, asl #5]
	mvn	r2, #0
	str	r2, [r1, #8]
	mov	r2, #1
	str	r0, [r1, #16]
	str	r2, [r1, #28]
	b	.L496
.L519:
	add	r1, ip, r2, asl #5
	mov	r5, #161
	ldr	lr, [r6, #112]
	mov	r0, #1
	str	r5, [r1, #4]
	mov	r5, #85
	str	r5, [ip, r2, asl #5]
	str	r0, [r1, #8]
	str	lr, [r1, #16]
	str	r0, [r1, #28]
	b	.L493
.L525:
	.align	2
.L524:
	.word	time
	.word	timeToNextTBullet
	.word	__aeabi_idivmod
	.word	.LANCHOR1
	.word	tBullets
	.word	rand
	.word	1374389535
	.word	shooter
	.word	fighter
	.size	moveTBullets, .-moveTBullets
	.align	2
	.global	moveBlockGame2
	.type	moveBlockGame2, %function
moveBlockGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r2, .L542
	sub	sp, sp, #20
	ldr	r1, .L542+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	sub	ip, ip, #2
	cmp	r3, ip
	bge	.L527
	ldr	r4, [r1, #16]
	add	r5, r4, r3
	cmp	r0, r5
	blt	.L537
.L527:
	ldr	ip, .L542+8
	mov	r2, #0
	str	r2, [ip, #32]
.L530:
	ldr	r2, .L542+12
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #16]
	add	r4, r0, r4
	cmp	r3, r4
	bge	.L526
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r0, r3
	bge	.L526
	ldr	r1, .L542+4
	ldr	r3, [r2, #0]
	ldr	r0, [r2, #20]
	ldr	r1, [r1, #0]
	add	r4, r0, r3
	cmp	r1, r4
	bge	.L526
	add	r1, r0, r1
	cmp	r3, r1
	bge	.L526
	ldr	r1, [ip, #4]
	ldr	r3, .L542+16
	mov	r4, #1
	str	r4, [r2, #24]
	cmp	r1, #0
	mov	r2, #4
	str	r4, [r3, #24]
	str	r2, [r3, #16]
	ldr	r5, .L542+8
	bne	.L526
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L538
.L526:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L537:
	ldr	r7, [r2, #0]
	ldr	ip, [r2, #8]
	ldr	r6, [r1, #0]
	add	ip, r7, ip
	sub	ip, ip, #2
	cmp	r6, ip
	bge	.L527
	ldr	sl, [r1, #20]
	add	r8, sl, r6
	cmp	r7, r8
	bge	.L527
	ldr	fp, .L542+20
	ldr	r9, [r2, #40]
	ldr	fp, [fp, #116]
	ldr	ip, .L542+8
	str	r9, [sp, #12]
	cmp	r9, fp
	mov	r9, #1
	str	r9, [ip, #20]
	str	r9, [ip, #32]
	mov	r9, #0
	str	r9, [ip, #16]
	beq	.L539
	ldr	r9, [ip, #36]
	ldr	fp, [sp, #12]
	cmp	fp, r9
	beq	.L540
	ldr	r9, .L542+20
	ldr	sl, [sp, #12]
	ldr	r0, [r9, #120]
	cmp	sl, r0
	beq	.L541
	sub	r8, r8, #2
	mov	r8, r8, asl #8
	ldr	r0, .L542+24
	add	sl, r3, r8
	add	r9, r0, sl, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L535
	add	r4, r4, r4, lsr #31
	add	r4, sl, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L535
	add	r5, r5, r8
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	addne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L530
.L535:
	sub	r7, r7, #1
	str	r7, [r2, #0]
	b	.L530
.L538:
	mov	r1, #3920
	mov	r2, #11008
	ldr	r0, .L542+28
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	str	r4, [r5, #12]
	b	.L526
.L539:
	sub	r5, r5, #1
	add	r7, r6, #3
	ldr	r4, .L542+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, r9
	mov	r7, #18
	str	r7, [r2, #12]
	beq	.L529
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, r9
	beq	.L529
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, r9
	addne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L530
.L529:
	sub	r0, r0, #1
	str	r0, [r2, #4]
	b	.L530
.L540:
	add	r5, r3, #1
	add	r7, r6, #3
	ldr	r4, .L542+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, #0
	mov	r7, #10
	str	r7, [r1, #16]
	beq	.L532
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, #0
	beq	.L532
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, #0
	subne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L530
.L532:
	add	r0, r0, #1
	str	r0, [r2, #4]
	b	.L530
.L541:
	add	sl, r6, #1
	mov	sl, sl, asl #8
	ldr	r0, .L542+24
	add	r8, r3, sl
	add	r9, r0, r8, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L534
	add	r4, r4, r4, lsr #31
	add	r4, r8, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L534
	add	r5, r5, sl
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	subne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L530
.L534:
	add	r7, r7, #1
	str	r7, [r2, #0]
	b	.L530
.L543:
	.align	2
.L542:
	.word	fighter
	.word	block
	.word	.LANCHOR0
	.word	button
	.word	doorA
	.word	.LANCHOR1
	.word	collisionMap2Bitmap
	.word	DoorSfx
	.size	moveBlockGame2, .-moveBlockGame2
	.align	2
	.global	moveBlockTut4
	.type	moveBlockTut4, %function
moveBlockTut4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r2, .L560
	sub	sp, sp, #20
	ldr	r1, .L560+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	sub	ip, ip, #2
	cmp	r3, ip
	bge	.L545
	ldr	r4, [r1, #16]
	add	r5, r4, r3
	cmp	r0, r5
	blt	.L555
.L545:
	ldr	ip, .L560+8
	mov	r2, #0
	str	r2, [ip, #32]
.L548:
	ldr	r2, .L560+12
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #16]
	add	r4, r0, r4
	cmp	r3, r4
	bge	.L544
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r0, r3
	bge	.L544
	ldr	r1, .L560+4
	ldr	r3, [r2, #0]
	ldr	r0, [r2, #20]
	ldr	r1, [r1, #0]
	add	r4, r0, r3
	cmp	r1, r4
	bge	.L544
	add	r1, r0, r1
	cmp	r3, r1
	bge	.L544
	ldr	r1, [ip, #4]
	ldr	r3, .L560+16
	mov	r4, #1
	str	r4, [r2, #24]
	cmp	r1, #0
	mov	r2, #4
	str	r4, [r3, #24]
	str	r2, [r3, #16]
	ldr	r5, .L560+8
	bne	.L544
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L556
.L544:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L555:
	ldr	r7, [r2, #0]
	ldr	ip, [r2, #8]
	ldr	r6, [r1, #0]
	add	ip, r7, ip
	sub	ip, ip, #2
	cmp	r6, ip
	bge	.L545
	ldr	sl, [r1, #20]
	add	r8, sl, r6
	cmp	r7, r8
	bge	.L545
	ldr	fp, .L560+20
	ldr	r9, [r2, #40]
	ldr	fp, [fp, #116]
	ldr	ip, .L560+8
	str	r9, [sp, #12]
	cmp	r9, fp
	mov	r9, #1
	str	r9, [ip, #20]
	str	r9, [ip, #32]
	mov	r9, #0
	str	r9, [ip, #16]
	beq	.L557
	ldr	r9, [ip, #36]
	ldr	fp, [sp, #12]
	cmp	fp, r9
	beq	.L558
	ldr	r9, .L560+20
	ldr	sl, [sp, #12]
	ldr	r0, [r9, #120]
	cmp	sl, r0
	beq	.L559
	sub	r8, r8, #2
	mov	r8, r8, asl #8
	ldr	r0, .L560+24
	add	sl, r3, r8
	add	r9, r0, sl, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L553
	add	r4, r4, r4, lsr #31
	add	r4, sl, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L553
	add	r5, r5, r8
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	addne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L548
.L553:
	sub	r7, r7, #1
	str	r7, [r2, #0]
	b	.L548
.L556:
	mov	r1, #3920
	mov	r2, #11008
	ldr	r0, .L560+28
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	str	r4, [r5, #12]
	b	.L544
.L557:
	sub	r5, r5, #1
	add	r7, r6, #3
	ldr	r4, .L560+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, r9
	mov	r7, #15
	str	r7, [r2, #12]
	beq	.L547
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, r9
	beq	.L547
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, r9
	addne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L548
.L547:
	sub	r0, r0, #1
	str	r0, [r2, #4]
	b	.L548
.L558:
	add	r5, r3, #1
	add	r7, r6, #3
	ldr	r4, .L560+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, #0
	mov	r7, #10
	str	r7, [r1, #16]
	beq	.L550
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, #0
	beq	.L550
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, #0
	subne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L548
.L550:
	add	r0, r0, #1
	str	r0, [r2, #4]
	b	.L548
.L559:
	add	sl, r6, #1
	mov	sl, sl, asl #8
	ldr	r0, .L560+24
	add	r8, r3, sl
	add	r9, r0, r8, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L552
	add	r4, r4, r4, lsr #31
	add	r4, r8, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L552
	add	r5, r5, sl
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	subne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L548
.L552:
	add	r7, r7, #1
	str	r7, [r2, #0]
	b	.L548
.L561:
	.align	2
.L560:
	.word	fighter
	.word	block
	.word	.LANCHOR0
	.word	button
	.word	doorA
	.word	.LANCHOR1
	.word	collisionMapTut4Bitmap
	.word	DoorSfx
	.size	moveBlockTut4, .-moveBlockTut4
	.align	2
	.global	moveBlock
	.type	moveBlock, %function
moveBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r2, .L578
	sub	sp, sp, #20
	ldr	r1, .L578+4
	ldr	r0, [r2, #4]
	ldr	ip, [r2, #12]
	ldr	r3, [r1, #4]
	add	ip, r0, ip
	sub	ip, ip, #2
	cmp	r3, ip
	bge	.L563
	ldr	r4, [r1, #16]
	add	r5, r4, r3
	cmp	r0, r5
	blt	.L573
.L563:
	ldr	ip, .L578+8
	mov	r2, #0
	str	r2, [ip, #32]
.L566:
	ldr	r2, .L578+12
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #16]
	add	r4, r0, r4
	cmp	r3, r4
	bge	.L562
	ldr	r1, [r1, #16]
	add	r3, r3, r1
	cmp	r0, r3
	bge	.L562
	ldr	r1, .L578+4
	ldr	r3, [r2, #0]
	ldr	r0, [r2, #20]
	ldr	r1, [r1, #0]
	add	r4, r0, r3
	cmp	r1, r4
	bge	.L562
	add	r1, r0, r1
	cmp	r3, r1
	bge	.L562
	ldr	r1, [ip, #4]
	ldr	r3, .L578+16
	mov	r4, #1
	str	r4, [r2, #24]
	cmp	r1, #0
	mov	r2, #4
	str	r4, [r3, #24]
	str	r2, [r3, #16]
	ldr	r5, .L578+8
	bne	.L562
	ldr	r3, [r5, #12]
	cmp	r3, #0
	beq	.L574
.L562:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L573:
	ldr	r7, [r2, #0]
	ldr	ip, [r2, #8]
	ldr	r6, [r1, #0]
	add	ip, r7, ip
	sub	ip, ip, #2
	cmp	r6, ip
	bge	.L563
	ldr	sl, [r1, #20]
	add	r8, sl, r6
	cmp	r7, r8
	bge	.L563
	ldr	fp, .L578+20
	ldr	r9, [r2, #40]
	ldr	fp, [fp, #116]
	ldr	ip, .L578+8
	str	r9, [sp, #12]
	cmp	r9, fp
	mov	r9, #1
	str	r9, [ip, #20]
	str	r9, [ip, #32]
	mov	r9, #0
	str	r9, [ip, #16]
	beq	.L575
	ldr	r9, [ip, #36]
	ldr	fp, [sp, #12]
	cmp	fp, r9
	beq	.L576
	ldr	r9, .L578+20
	ldr	sl, [sp, #12]
	ldr	r0, [r9, #120]
	cmp	sl, r0
	beq	.L577
	sub	r8, r8, #2
	mov	r8, r8, asl #8
	ldr	r0, .L578+24
	add	sl, r3, r8
	add	r9, r0, sl, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L571
	add	r4, r4, r4, lsr #31
	add	r4, sl, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L571
	add	r5, r5, r8
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	addne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L566
.L571:
	sub	r7, r7, #1
	str	r7, [r2, #0]
	b	.L566
.L574:
	mov	r1, #3920
	mov	r2, #11008
	ldr	r0, .L578+28
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	str	r4, [r5, #12]
	b	.L562
.L575:
	sub	r5, r5, #1
	add	r7, r6, #3
	ldr	r4, .L578+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, r9
	mov	r7, #18
	str	r7, [r2, #12]
	beq	.L565
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, r9
	beq	.L565
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, r9
	addne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L566
.L565:
	sub	r0, r0, #1
	str	r0, [r2, #4]
	b	.L566
.L576:
	add	r5, r3, #1
	add	r7, r6, #3
	ldr	r4, .L578+24
	add	r7, r5, r7, asl #8
	mov	r7, r7, asl #1
	ldrh	r7, [r4, r7]
	cmp	r7, #0
	mov	r7, #10
	str	r7, [r1, #16]
	beq	.L568
	add	sl, sl, sl, lsr #31
	add	r6, r6, sl, asr #1
	sub	r6, r6, #1
	add	r6, r5, r6, asl #8
	mov	r6, r6, asl #1
	ldrh	r6, [r4, r6]
	cmp	r6, #0
	beq	.L568
	sub	r8, r8, #4
	add	r5, r5, r8, asl #8
	mov	r5, r5, asl #1
	ldrh	r4, [r4, r5]
	cmp	r4, #0
	subne	r3, r3, #1
	strne	r3, [r1, #4]
	bne	.L566
.L568:
	add	r0, r0, #1
	str	r0, [r2, #4]
	b	.L566
.L577:
	add	sl, r6, #1
	mov	sl, sl, asl #8
	ldr	r0, .L578+24
	add	r8, r3, sl
	add	r9, r0, r8, asl #1
	ldrh	r9, [r9, #2]
	cmp	r9, #0
	beq	.L570
	add	r4, r4, r4, lsr #31
	add	r4, r8, r4, asr #1
	add	r4, r0, r4, asl #1
	ldrh	r4, [r4, #-2]
	cmp	r4, #0
	beq	.L570
	add	r5, r5, sl
	add	r0, r0, r5, asl #1
	ldrh	r0, [r0, #-2]
	cmp	r0, #0
	subne	r6, r6, #1
	strne	r6, [r1, #0]
	bne	.L566
.L570:
	add	r7, r7, #1
	str	r7, [r2, #0]
	b	.L566
.L579:
	.align	2
.L578:
	.word	fighter
	.word	block
	.word	.LANCHOR0
	.word	button
	.word	doorA
	.word	.LANCHOR1
	.word	collisionMapBitmap
	.word	DoorSfx
	.size	moveBlock, .-moveBlock
	.align	2
	.global	moveObjects
	.type	moveObjects, %function
moveObjects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L586
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bxeq	lr
	cmp	r0, #4
	beq	.L584
	cmp	r0, #10
	beq	.L585
	b	moveBlock
.L585:
	b	moveBlockGame2
.L584:
	b	moveBlockTut4
.L587:
	.align	2
.L586:
	.word	.LANCHOR0
	.size	moveObjects, .-moveObjects
	.align	2
	.global	movePBullets
	.type	movePBullets, %function
movePBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L661
	sub	sp, sp, #20
	ldr	r2, [r3, #4]
	cmp	r2, #1
	mov	r7, r0
	beq	.L589
.L639:
	ldr	r6, .L661+4
	ldr	r3, [r6, #8]
	cmp	r3, #0
	ble	.L588
	ldr	r1, .L661+8
.L601:
	ldr	r5, [r1, #28]
.L602:
	mov	r2, #0
	ldr	r0, [r6, #8]
	ldr	r3, .L661+12
	ldr	r4, .L661+16
	ldr	r8, .L661+20
	mov	ip, r2
.L627:
	cmp	r5, #0
	beq	.L604
	ldr	r1, [r3, #-52]
	cmp	r1, #0
	ble	.L605
	cmp	r7, #6
	beq	.L644
	cmp	r7, #10
	beq	.L645
	ldr	r5, [r3, #-56]
	cmp	r5, #240
	beq	.L610
	ldr	sl, [r3, #-60]
	add	sl, r5, sl, asl #8
	mov	r9, sl, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	bne	.L646
.L610:
	str	ip, [r3, #-32]
	ldr	r1, [r3, #-52]
.L605:
	cmp	r1, #0
	blt	.L647
.L611:
	ldr	r1, [r3, #-48]
	cmp	r1, #0
	ble	.L616
	cmp	r7, #6
	beq	.L648
	cmp	r7, #10
	beq	.L649
	ldr	r5, [r3, #-60]
	cmp	r5, #160
	beq	.L621
	ldr	sl, [r3, #-36]
	ldr	r9, [r3, #-56]
	add	sl, r5, sl
	add	sl, r9, sl, asl #8
	mov	r9, sl, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	bne	.L650
.L621:
	str	ip, [r3, #-32]
	ldr	r1, [r3, #-48]
.L616:
	cmp	r1, #0
	blt	.L651
.L604:
	add	r2, r2, #1
	cmp	r0, r2
	add	r3, r3, #32
	ldrgt	r5, [r3, #-32]
	bgt	.L627
.L626:
	cmp	r0, #0
	ble	.L588
	mov	r5, #0
	ldr	r4, .L661+24
	ldr	r8, .L661+28
	ldr	sl, .L661+32
	mov	r9, r5
.L632:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L628
	cmp	r7, #6
	beq	.L629
	ldr	r3, [sl, #44]
	cmp	r3, #0
	beq	.L629
	ldr	r3, [sl, #4]
	ldr	r1, [sl, #8]
	ldr	r2, [r4, #-16]
	add	r1, r3, r1
	sub	r1, r1, #1
	cmp	r2, r1
	bge	.L629
	ldr	r1, [r4, #0]
	add	r2, r2, r1
	sub	r2, r2, #1
	cmp	r3, r2
	bge	.L629
	ldr	r3, [sl, #0]
	ldr	r1, [sl, #12]
	ldr	r2, [r4, #-20]
	add	r1, r3, r1
	sub	r1, r1, #1
	cmp	r2, r1
	bge	.L629
	ldr	r1, [r4, #4]
	add	r2, r2, r1
	sub	r2, r2, #1
	cmp	r3, r2
	bge	.L629
	ldr	ip, [sl, #40]
	sub	ip, ip, #1
	cmp	ip, #0
	str	ip, [sl, #40]
	bne	.L630
	mov	r1, #24064
	mov	r2, #11008
	ldr	r0, .L661+36
	add	r1, r1, #172
	add	r2, r2, #17
	mov	r3, ip
	str	ip, [sl, #44]
	bl	playSoundB
.L630:
	str	r9, [r4, #8]
.L629:
	ldr	r3, [r8, #44]
	cmp	r3, #0
	beq	.L628
	ldr	r3, [r8, #4]
	ldr	r1, [r8, #8]
	ldr	r2, [r4, #-16]
	add	r1, r3, r1
	sub	r1, r1, #1
	cmp	r2, r1
	bge	.L628
	ldr	r1, [r4, #0]
	add	r2, r2, r1
	sub	r2, r2, #1
	cmp	r3, r2
	bge	.L628
	ldr	r3, [r8, #0]
	ldr	r1, [r8, #12]
	ldr	r2, [r4, #-20]
	add	r1, r3, r1
	sub	r1, r1, #1
	cmp	r2, r1
	bge	.L628
	ldr	r1, [r4, #4]
	add	r2, r2, r1
	sub	r2, r2, #1
	cmp	r3, r2
	bge	.L628
	ldr	ip, [r8, #40]
	sub	ip, ip, #1
	cmp	ip, #0
	str	ip, [r8, #40]
	bne	.L631
	mov	r1, #24064
	mov	r2, #11008
	ldr	r0, .L661+36
	add	r1, r1, #172
	add	r2, r2, #17
	mov	r3, ip
	str	ip, [r8, #44]
	bl	playSoundB
.L631:
	str	r9, [r4, #8]
.L628:
	ldr	r3, [r6, #8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #32
	bgt	.L632
.L588:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L651:
	cmp	r7, #6
	beq	.L652
	cmp	r7, #10
	beq	.L653
	ldr	r1, [r3, #-60]
	cmp	r1, #0
	beq	.L625
	ldr	r5, [r3, #-56]
	mov	sl, r1, asl #8
	add	fp, sl, r5
	mov	r9, fp, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	str	fp, [sp, #4]
	beq	.L625
	ldr	r9, [r3, #-40]
	add	fp, r9, r9, lsr #31
	add	sl, sl, fp, asr #1
	add	r5, sl, r5
	mov	r5, r5, asl #1
	ldrh	r5, [r4, r5]
	cmp	r5, #0
	str	r9, [sp, #12]
	beq	.L625
	ldr	sl, [sp, #4]
	add	r5, sl, r9
	mov	r5, r5, asl #1
	ldrh	r5, [r4, r5]
	cmp	r5, #0
	beq	.L625
.L643:
	sub	r1, r1, #1
	str	r1, [r3, #-60]
	b	.L604
.L647:
	cmp	r7, #6
	beq	.L654
	cmp	r7, #10
	beq	.L655
	ldr	r1, [r3, #-56]
	cmp	r1, #0
	beq	.L615
	ldr	r5, [r3, #-60]
	add	sl, r1, r5, asl #8
	mov	sl, sl, asl #1
	ldrh	sl, [r4, sl]
	cmp	sl, #0
	beq	.L615
	ldr	sl, [r3, #-36]
	add	r9, sl, sl, lsr #31
	add	r9, r5, r9, asr #1
	add	r9, r1, r9, asl #8
	mov	r9, r9, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	beq	.L615
	add	r5, r5, sl
	sub	r5, r5, #1
	add	r5, r1, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r4, r5]
	cmp	r5, #0
	beq	.L615
.L641:
	sub	r1, r1, #1
	str	r1, [r3, #-56]
	b	.L611
.L648:
	ldr	r5, [r3, #-60]
	add	r5, r5, #1
	cmp	r5, #160
	str	r5, [r3, #-60]
	streq	ip, [r3, #-32]
	b	.L616
.L644:
	ldr	r5, [r3, #-56]
	add	r5, r5, #1
	cmp	r5, #240
	str	r5, [r3, #-56]
	streq	ip, [r3, #-32]
	b	.L605
.L646:
	ldr	fp, [r3, #-40]
	add	r9, fp, fp, lsr #31
	add	r9, sl, r9, asr #1
	mov	r9, r9, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	beq	.L610
	add	sl, sl, fp
	mov	sl, sl, asl #1
	ldrh	sl, [r4, sl]
	cmp	sl, #0
	beq	.L610
.L640:
	add	r5, r5, #1
	str	r5, [r3, #-56]
	b	.L605
.L650:
	ldr	fp, [r3, #-40]
	add	r9, fp, fp, lsr #31
	add	r9, sl, r9, asr #1
	mov	r9, r9, asl #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	beq	.L621
	add	sl, sl, fp
	mov	sl, sl, asl #1
	ldrh	sl, [r4, sl]
	cmp	sl, #0
	beq	.L621
.L642:
	add	r5, r5, #1
	str	r5, [r3, #-60]
	b	.L616
.L655:
	ldr	r1, [r3, #-56]
	cmp	r1, #0
	beq	.L615
	ldr	r5, [r3, #-60]
	add	sl, r1, r5, asl #8
	mov	sl, sl, asl #1
	ldrh	sl, [r8, sl]
	cmp	sl, #0
	beq	.L615
	ldr	sl, [r3, #-36]
	add	r9, sl, sl, lsr #31
	add	r9, r5, r9, asr #1
	add	r9, r1, r9, asl #8
	mov	r9, r9, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L615
	add	r5, r5, sl
	sub	r5, r5, #1
	add	r5, r1, r5, asl #8
	mov	r5, r5, asl #1
	ldrh	r5, [r8, r5]
	cmp	r5, #0
	bne	.L641
.L615:
	str	ip, [r3, #-32]
	b	.L611
.L653:
	ldr	r1, [r3, #-60]
	cmp	r1, #0
	beq	.L625
	ldr	r5, [r3, #-56]
	mov	sl, r1, asl #8
	add	r9, sl, r5
	str	r9, [sp, #4]
	mov	r9, r9, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L625
	ldr	fp, [r3, #-40]
	add	r9, fp, fp, lsr #31
	add	sl, sl, r9, asr #1
	add	r5, sl, r5
	mov	r5, r5, asl #1
	ldrh	r5, [r8, r5]
	cmp	r5, #0
	str	fp, [sp, #12]
	beq	.L625
	ldr	sl, [sp, #4]
	add	r5, sl, fp
	mov	r5, r5, asl #1
	ldrh	r5, [r8, r5]
	cmp	r5, #0
	bne	.L643
.L625:
	str	ip, [r3, #-32]
	b	.L604
.L649:
	ldr	r5, [r3, #-60]
	cmp	r5, #160
	beq	.L621
	ldr	sl, [r3, #-36]
	ldr	r9, [r3, #-56]
	add	sl, r5, sl
	add	sl, r9, sl, asl #8
	mov	r9, sl, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L621
	ldr	fp, [r3, #-40]
	add	r9, fp, fp, lsr #31
	add	r9, sl, r9, asr #1
	mov	r9, r9, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L621
	add	sl, sl, fp
	mov	sl, sl, asl #1
	ldrh	sl, [r8, sl]
	cmp	sl, #0
	beq	.L621
	b	.L642
.L645:
	ldr	r5, [r3, #-56]
	cmp	r5, #240
	beq	.L610
	ldr	sl, [r3, #-60]
	add	sl, r5, sl, asl #8
	mov	r9, sl, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L610
	ldr	fp, [r3, #-40]
	add	r9, fp, fp, lsr #31
	add	r9, sl, r9, asr #1
	mov	r9, r9, asl #1
	ldrh	r9, [r8, r9]
	cmp	r9, #0
	beq	.L610
	add	sl, sl, fp
	mov	sl, sl, asl #1
	ldrh	sl, [r8, sl]
	cmp	sl, #0
	beq	.L610
	b	.L640
.L589:
	ldr	r2, .L661+40
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L639
	ldr	r2, .L661+44
	ldr	r2, [r2, #0]
	ands	r2, r2, #1
	bne	.L639
	ldr	r6, .L661+4
	ldr	r4, [r6, #8]
	cmp	r4, #0
	ble	.L588
	ldr	r1, .L661+8
	ldr	r5, [r1, #28]
	cmp	r5, #0
	movne	r0, r1
	beq	.L656
.L596:
	add	r2, r2, #1
	cmp	r2, r4
	bge	.L602
	ldr	ip, [r0, #60]
	cmp	ip, #0
	add	r0, r0, #32
	bne	.L596
.L594:
	ldr	ip, .L661+48
	ldr	r4, [r6, #124]
	ldr	r0, [ip, #40]
	cmp	r0, r4
	movne	r4, r2, asl #5
	beq	.L657
.L597:
	ldr	r5, [r6, #128]
	cmp	r0, r5
	beq	.L658
.L598:
	ldr	r3, [r6, #132]
	cmp	r0, r3
	beq	.L659
.L599:
	ldr	r3, [r6, #140]
	cmp	r0, r3
	beq	.L660
.L600:
	add	r4, r1, r4
	mov	r3, #1
	str	r3, [r4, #28]
	b	.L601
.L652:
	ldr	r1, [r3, #-60]
	sub	r1, r1, #1
	cmp	r1, #0
	str	r1, [r3, #-60]
	streq	r1, [r3, #-32]
	b	.L604
.L654:
	ldr	r1, [r3, #-56]
	ldr	r5, [r3, #-40]
	sub	r1, r1, #1
	cmn	r1, r5
	str	r1, [r3, #-56]
	streq	ip, [r3, #-32]
	b	.L611
.L660:
	ldr	r8, [ip, #0]
	ldr	r3, .L661+4
	ldr	r0, [ip, #4]
	ldr	r5, [r3, #136]
	add	ip, r8, #3
	add	r3, r1, r4
	mov	r8, #1
	add	r0, r0, #2
	str	r8, [r3, #12]
	mov	r8, #0
	str	r8, [r3, #8]
	str	r5, [r3, #16]
	str	ip, [r1, r2, asl #5]
	str	r0, [r3, #4]
	b	.L600
.L659:
	ldr	r3, .L661+4
	ldr	r8, [ip, #0]
	ldr	r5, [ip, #4]
	ldr	sl, [r3, #136]
	mvn	r9, #0
	add	r3, r1, r4
	add	r8, r8, #3
	add	r5, r5, #8
	str	r9, [r3, #12]
	mov	r9, #0
	str	r9, [r3, #8]
	str	sl, [r3, #16]
	str	r8, [r1, r2, asl #5]
	str	r5, [r3, #4]
	b	.L599
.L658:
	ldr	r8, [ip, #0]
	ldr	r5, [ip, #4]
	ldr	sl, [r3, #40]
	mvn	r9, #0
	add	r3, r1, r4
	add	r8, r8, #3
	add	r5, r5, #2
	str	r9, [r3, #8]
	mov	r9, #0
	str	r9, [r3, #12]
	str	sl, [r3, #16]
	str	r8, [r1, r2, asl #5]
	str	r5, [r3, #4]
	b	.L598
.L657:
	ldr	sl, [ip, #0]
	ldr	r8, [ip, #4]
	mov	r4, r2, asl #5
	add	r5, r1, r4
	mov	r9, #1
	ldr	fp, [r3, #40]
	add	sl, sl, #3
	add	r8, r8, #8
	str	r9, [r5, #8]
	mov	r9, #0
	str	r9, [r5, #12]
	str	fp, [r5, #16]
	str	sl, [r1, r2, asl #5]
	str	r8, [r5, #4]
	b	.L597
.L656:
	mov	r2, r5
	b	.L594
.L662:
	.align	2
.L661:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	pBullets
	.word	pBullets+60
	.word	collisionMapBitmap
	.word	collisionMap2Bitmap
	.word	pBullets+20
	.word	orb2
	.word	orb1
	.word	DestroySfx
	.word	oldButtons
	.word	buttons
	.word	shooter
	.size	movePBullets, .-movePBullets
	.align	2
	.global	moveBullets
	.type	moveBullets, %function
moveBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	cmp	r0, #10
	sub	sp, sp, #12
	beq	.L665
	mov	r0, #0
	bl	movePBullets
	mov	r0, #0
	add	sp, sp, #12
	ldr	lr, [sp], #4
	b	moveTBullets
.L665:
	str	r0, [sp, #4]
	bl	moveT2Bullets
	ldr	r0, [sp, #4]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	b	movePBullets
	.size	moveBullets, .-moveBullets
	.align	2
	.global	actionsShooter
	.type	actionsShooter, %function
actionsShooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L682
	ldr	r3, [r4, #28]
	mov	r2, #11
	cmp	r3, #4
	strne	r3, [r4, #32]
	str	r2, [r4, #12]
	movne	r3, #4
	mov	r2, #15
	strne	r3, [r4, #28]
	str	r2, [r4, #8]
	ldr	r3, [r4, #24]
	ldr	r2, .L682+4
	smull	r0, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #2
	ldr	r3, .L682
	bne	.L668
	ldr	r2, [r3, #36]
	ldr	r1, .L682+8
	add	r2, r2, #1
	smull	r0, r1, r2, r1
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, asl #1
	rsb	r2, r1, r2
	str	r2, [r3, #36]
.L668:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	ldreq	r3, .L682+12
	ldreq	r3, [r3, #132]
	moveq	r2, #1
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	ldreq	r3, .L682+12
	ldreq	r3, [r3, #140]
	moveq	r2, #0
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r3, .L682+12
	ldreq	r3, [r3, #128]
	moveq	r2, #3
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	r3, .L682+12
	ldr	r6, .L682+16
	ldreq	r3, [r3, #124]
	streq	r3, [r4, #40]
	ldr	r3, [r6, #0]
	moveq	r2, #2
	streq	r2, [r4, #28]
	tst	r3, #1
	beq	.L673
	ldr	r3, .L682+20
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L678
.L673:
	ldr	r5, .L682+24
	ldr	r3, [r5, #28]
	cmp	r3, #1
	beq	.L679
.L674:
	ldr	r2, .L682+28
	ldr	r3, [r2, #28]
	cmp	r3, #1
	beq	.L680
.L675:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	ldr	r3, .L682
	beq	.L681
.L676:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L666:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L678:
	ldr	r2, .L682+32
	ldr	r1, [r2, #4]
	cmp	r1, #1
	mov	r1, #1
	str	r1, [r2, #16]
	bne	.L673
	mov	r1, #2992
	mov	r2, #11008
	ldr	r0, .L682+36
	add	r1, r1, #15
	add	r2, r2, #17
	bl	playSoundB
	b	.L673
.L681:
	ldr	r2, [r3, #32]
	mov	r1, #0
	cmp	r2, #4
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	beq	.L666
	b	.L676
.L680:
	ldr	r3, [r5, #24]
	cmp	r3, #1
	bne	.L675
	ldr	r5, .L682+32
	ldr	r3, [r5, #8]
	cmp	r3, #1
	bne	.L675
	ldr	r7, [r5, #44]
	cmp	r7, #1
	bne	.L675
	ldr	r3, [r6, #0]
	tst	r3, #2
	beq	.L675
	ldr	r3, .L682+20
	ldr	r3, [r3, #0]
	ands	r1, r3, #2
	bne	.L675
	ldr	r3, [r5, #48]
	ldr	r0, .L682+40
	str	r7, [r2, #24]
	cmp	r3, #0
	mov	r2, #4
	str	r1, [r5, #8]
	str	r7, [r0, #24]
	str	r2, [r0, #16]
	bne	.L675
	mov	r1, #3920
	mov	r2, #11008
	ldr	r0, .L682+44
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	mov	r3, #15
	str	r3, [r4, #8]
	mov	r3, #8
	str	r7, [r5, #48]
	str	r3, [r4, #12]
	b	.L675
.L679:
	ldr	r8, .L682+32
	ldr	r7, [r8, #4]
	cmp	r7, #1
	bne	.L674
	ldr	r3, [r6, #0]
	tst	r3, #2
	beq	.L674
	ldr	r3, .L682+20
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L674
	ldr	r3, [r8, #44]
	cmp	r3, #0
	str	r7, [r8, #24]
	str	r7, [r5, #24]
	str	r7, [r8, #8]
	bne	.L674
	mov	r1, #5632
	mov	r2, #11008
	ldr	r0, .L682+48
	add	r1, r1, #43
	add	r2, r2, #17
	bl	playSoundB
	str	r7, [r8, #44]
	b	.L674
.L683:
	.align	2
.L682:
	.word	shooter
	.word	1717986919
	.word	1431655766
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	chest
	.word	lever
	.word	.LANCHOR0
	.word	LaserSfx
	.word	doorExit
	.word	DoorSfx
	.word	OpenSfx
	.size	actionsShooter, .-actionsShooter
	.align	2
	.global	actShooter
	.type	actShooter, %function
actShooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	actionsShooter
	.size	actShooter, .-actShooter
	.align	2
	.global	actTut1Shooter
	.type	actTut1Shooter, %function
actTut1Shooter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	actionsShooter
	.size	actTut1Shooter, .-actTut1Shooter
	.align	2
	.global	actionsFighter
	.type	actionsFighter, %function
actionsFighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L701
	ldr	r3, [r4, #28]
	cmp	r3, #4
	strne	r3, [r4, #32]
	movne	r3, #4
	strne	r3, [r4, #28]
	ldr	r2, .L701+4
	ldr	r3, [r4, #24]
	smull	r0, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #2
	ldr	r3, .L701
	bne	.L688
	ldr	r2, [r3, #36]
	ldr	r1, .L701+8
	add	r2, r2, #1
	smull	r0, r1, r2, r1
	sub	r1, r1, r2, asr #31
	add	r1, r1, r1, asl #1
	rsb	r2, r1, r2
	str	r2, [r3, #36]
.L688:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #64
	ldreq	r3, .L701+12
	ldreq	r3, [r3, #120]
	moveq	r2, #1
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #128
	ldreq	r3, .L701+12
	ldreq	r3, [r3, #144]
	moveq	r2, #0
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r3, .L701+16
	ldreq	r3, [r3, #36]
	moveq	r2, #3
	streq	r2, [r4, #28]
	streq	r3, [r4, #40]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	r3, .L701+12
	ldreq	r3, [r3, #116]
	streq	r3, [r4, #40]
	ldr	r3, .L701+20
	ldr	r3, [r3, #0]
	moveq	r2, #2
	streq	r2, [r4, #28]
	tst	r3, #1
	beq	.L693
	ldr	r3, .L701+24
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L698
.L693:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	ldr	r3, .L701
	beq	.L699
.L696:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L686:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L698:
	ldr	r5, .L701+16
	ldr	r3, [r5, #4]
	cmp	r3, #0
	mov	r3, #1
	str	r3, [r5, #16]
	bne	.L693
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L700
.L694:
	ldr	r3, .L701+28
	ldr	r2, [r3, #28]
	cmp	r2, #1
	streq	r2, [r3, #24]
	ldr	r3, .L701+32
	ldr	r2, [r3, #28]
	cmp	r2, #1
	streq	r2, [r3, #24]
	ldr	r3, [r4, #28]
	cmp	r3, #4
	ldr	r3, .L701
	bne	.L696
.L699:
	ldr	r2, [r3, #32]
	mov	r1, #0
	cmp	r2, #4
	str	r1, [r3, #36]
	str	r2, [r3, #28]
	beq	.L686
	b	.L696
.L700:
	mov	r1, #4032
	mov	r2, #11008
	ldr	r0, .L701+36
	add	r1, r1, #9
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r5, #4]
	cmp	r3, #0
	beq	.L694
	b	.L693
.L702:
	.align	2
.L701:
	.word	fighter
	.word	1717986919
	.word	1431655766
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	wall
	.word	wall2
	.word	PunchSfx
	.size	actionsFighter, .-actionsFighter
	.align	2
	.global	actFighter
	.type	actFighter, %function
actFighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	actionsFighter
	.size	actFighter, .-actFighter
	.align	2
	.global	actTut1Fighter
	.type	actTut1Fighter, %function
actTut1Fighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	actionsFighter
	.size	actTut1Fighter, .-actTut1Fighter
	.align	2
	.global	moveEnemies
	.type	moveEnemies, %function
moveEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #10
	stmfd	sp!, {r3, r4, r5, lr}
	beq	.L706
	cmp	r0, #6
	beq	.L707
	ldr	r3, .L712
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L709
.L707:
	ldr	r3, .L712+4
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L710
.L706:
	ldr	r3, .L712+8
	ldr	r3, [r3, #0]
	tst	r3, #256
	beq	.L705
	ldr	r3, .L712+12
	ldr	r3, [r3, #0]
	ands	r2, r3, #256
	bne	.L705
	ldr	r1, .L712
	str	r2, [r1, #44]
	ldr	r1, .L712+4
	ldr	r5, .L712+16
	str	r2, [r1, #44]
	ldr	r2, .L712+20
	mov	r4, #1
	ldr	r3, [r5, #0]
	str	r4, [r2, #24]
	ldr	r2, .L712+24
	cmp	r3, #0
	str	r4, [r2, #24]
	beq	.L711
.L705:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L710:
	bl	moveOrb2
	b	.L706
.L709:
	bl	moveOrb1
	b	.L707
.L711:
	mov	r1, #24064
	mov	r2, #11008
	ldr	r0, .L712+28
	add	r1, r1, #172
	add	r2, r2, #17
	bl	playSoundB
	str	r4, [r5, #0]
	b	.L705
.L713:
	.align	2
.L712:
	.word	orb1
	.word	orb2
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	wall
	.word	wall2
	.word	DestroySfx
	.size	moveEnemies, .-moveEnemies
	.align	2
	.global	actPlayers
	.type	actPlayers, %function
actPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r0, #3
	cmp	r0, #6
	cmpne	r3, #1
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	bls	.L715
	cmp	r0, #7
	beq	.L716
	ldr	r5, .L732
	ldr	r3, [r5, #8]
	cmp	r3, #1
	beq	.L715
	ldr	r3, .L732+4
	ldr	r3, [r3, #0]
	tst	r3, #512
	bne	.L725
.L715:
	cmp	r4, #1
	beq	.L726
	cmp	r4, #3
	beq	.L727
	cmp	r4, #4
	beq	.L728
.L716:
	cmp	r4, #6
	beq	.L729
	cmp	r4, #7
	beq	.L730
	cmp	r4, #10
	beq	.L731
	bl	actionsShooter
	bl	actionsFighter
	bl	moveShooter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveFighter
.L725:
	ldr	r3, .L732+8
	ldr	r3, [r3, #0]
	ands	r3, r3, #512
	bne	.L715
	mov	r2, #11008
	ldr	r0, .L732+12
	mov	r1, #2000
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r5, #4]
	cmp	r3, #0
	bne	.L717
	ldr	r2, .L732+16
	ldr	r3, .L732+20
	ldmia	r2, {r1, ip}	@ phole ldm
	ldmia	r3, {r0, lr}	@ phole ldm
	stmia	r3, {r1, ip}	@ phole stm
	mov	r3, #1
	stmia	r2, {r0, lr}	@ phole stm
	str	r3, [r5, #4]
	b	.L715
.L731:
	bl	actionsShooter
	bl	actionsFighter
	bl	moveGame2Shooter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveGame2Fighter
.L728:
	bl	actionsFighter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveTut4Fighter
.L726:
	bl	actionsShooter
	bl	actionsFighter
	bl	moveTut1Shooter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveTut1Fighter
.L727:
	bl	actionsFighter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveTut3Fighter
.L729:
	bl	actionsShooter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveTut1Shooter
.L730:
	bl	actionsShooter
	ldmfd	sp!, {r4, r5, r6, lr}
	b	moveTut7Shooter
.L717:
	cmp	r3, #1
	bne	.L718
	ldr	r2, .L732+20
	ldr	r3, .L732+16
	ldr	ip, [r2, #4]
	ldr	lr, [r3, #4]
	ldr	r1, [r2, #0]
	ldr	r0, [r3, #0]
	str	lr, [r2, #4]
	str	ip, [r3, #4]
	str	r0, [r2, #0]
	str	r1, [r3, #0]
.L719:
	mov	r3, #0
	str	r3, [r5, #4]
	b	.L715
.L718:
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r5, #4]
	bne	.L715
	b	.L719
.L733:
	.align	2
.L732:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	SwitchSfx
	.word	shooter
	.word	fighter
	.size	actPlayers, .-actPlayers
	.global	mapSize
	.global	screenCollMapSize
	.global	isChestOpen
	.global	doorClosedRow
	.global	doorOpenRow
	.global	doorAloc
	.global	doorExitloc
	.global	blueDoorOpened
	.global	greenDoorOpened
	.global	onOffObjectLoc
	.global	blockButton_loc
	.global	wallOK
	.global	wallDown
	.global	wallTwoOk
	.global	wallTwoDown
	.global	chestClosed
	.global	chestOpen
	.global	leverOff
	.global	leverOn
	.global	blockloc
	.global	buttonUp
	.global	buttonDown
	.global	withBlock
	.global	bulletCount
	.global	tBulletCount
	.global	cheatPressed
	.global	dontPunch
	.global	bullet_loc
	.global	bullet_h
	.global	bullet_v
	.global	tbullet_h
	.global	tbullet_v
	.global	which
	.global	F_LEFT
	.global	F_RIGHT
	.global	F_DOWN
	.global	F_UP
	.global	S_LEFT
	.global	S_RIGHT
	.global	S_DOWN
	.global	S_UP
	.global	E_RIGHT
	.global	E_UP
	.global	E_LEFT
	.global	E_DOWN
	.global	orb_loc
	.global	ifAttack
	.global	ifOpenChest
	.global	F_ATTACK
	.global	S_ATTACK
	.global	S_HACK
	.global	withKey
	.comm	soundB,32,4
	.comm	shadowOAM,1024,4
	.comm	fighter,52,4
	.comm	shooter,52,4
	.comm	orb1,52,4
	.comm	orb2,52,4
	.comm	block,32,4
	.comm	wall,32,4
	.comm	wall2,32,4
	.comm	button,32,4
	.comm	doorA,32,4
	.comm	doorExit,32,4
	.comm	chest,32,4
	.comm	lever,32,4
	.comm	livesNum,32,4
	.comm	timeToNextTBullet,4,4
	.comm	time,4,4
	.comm	pBullets,160,4
	.comm	tBullets,1120,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	E_DOWN, %object
	.size	E_DOWN, 4
E_DOWN:
	.word	11
	.type	E_RIGHT, %object
	.size	E_RIGHT, 4
E_RIGHT:
	.word	8
	.type	bulletCount, %object
	.size	bulletCount, 4
bulletCount:
	.word	5
	.type	tBulletCount, %object
	.size	tBulletCount, 4
tBulletCount:
	.word	35
	.type	E_LEFT, %object
	.size	E_LEFT, 4
E_LEFT:
	.word	10
	.type	E_UP, %object
	.size	E_UP, 4
E_UP:
	.word	9
	.type	F_ATTACK, %object
	.size	F_ATTACK, 4
F_ATTACK:
	.word	12
	.type	S_ATTACK, %object
	.size	S_ATTACK, 4
S_ATTACK:
	.word	20
	.type	S_HACK, %object
	.size	S_HACK, 4
S_HACK:
	.word	22
	.type	orb_loc, %object
	.size	orb_loc, 4
orb_loc:
	.word	28
	.type	bullet_loc, %object
	.size	bullet_loc, 4
bullet_loc:
	.word	24
	.type	blockButton_loc, %object
	.size	blockButton_loc, 4
blockButton_loc:
	.word	28
	.type	blockloc, %object
	.size	blockloc, 4
blockloc:
	.word	8
	.type	doorOpenRow, %object
	.size	doorOpenRow, 4
doorOpenRow:
	.word	4
	.type	doorAloc, %object
	.size	doorAloc, 4
doorAloc:
	.word	12
	.type	doorExitloc, %object
	.size	doorExitloc, 4
doorExitloc:
	.word	8
	.type	wallDown, %object
	.size	wallDown, 4
wallDown:
	.word	16
	.type	wallOK, %object
	.size	wallOK, 4
wallOK:
	.word	16
	.type	wallTwoDown, %object
	.size	wallTwoDown, 4
wallTwoDown:
	.word	20
	.type	wallTwoOk, %object
	.size	wallTwoOk, 4
wallTwoOk:
	.word	20
	.type	onOffObjectLoc, %object
	.size	onOffObjectLoc, 4
onOffObjectLoc:
	.word	26
	.type	chestOpen, %object
	.size	chestOpen, 4
chestOpen:
	.word	16
	.type	chestClosed, %object
	.size	chestClosed, 4
chestClosed:
	.word	14
	.type	leverOn, %object
	.size	leverOn, 4
leverOn:
	.word	20
	.type	leverOff, %object
	.size	leverOff, 4
leverOff:
	.word	18
	.type	buttonDown, %object
	.size	buttonDown, 4
buttonDown:
	.word	10
	.type	buttonUp, %object
	.size	buttonUp, 4
buttonUp:
	.word	12
	.type	tbullet_v, %object
	.size	tbullet_v, 4
tbullet_v:
	.word	6
	.type	tbullet_h, %object
	.size	tbullet_h, 4
tbullet_h:
	.word	4
	.type	F_RIGHT, %object
	.size	F_RIGHT, 4
F_RIGHT:
	.word	1
	.type	F_UP, %object
	.size	F_UP, 4
F_UP:
	.word	3
	.type	S_RIGHT, %object
	.size	S_RIGHT, 4
S_RIGHT:
	.word	5
	.type	S_LEFT, %object
	.size	S_LEFT, 4
S_LEFT:
	.word	4
	.type	S_UP, %object
	.size	S_UP, 4
S_UP:
	.word	7
	.type	bullet_v, %object
	.size	bullet_v, 4
bullet_v:
	.word	2
	.type	S_DOWN, %object
	.size	S_DOWN, 4
S_DOWN:
	.word	6
	.type	F_DOWN, %object
	.size	F_DOWN, 4
F_DOWN:
	.word	2
	.type	mapSize, %object
	.size	mapSize, 4
mapSize:
	.word	256
	.type	screenCollMapSize, %object
	.size	screenCollMapSize, 4
screenCollMapSize:
	.word	256
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cheatPressed, %object
	.size	cheatPressed, 4
cheatPressed:
	.space	4
	.type	which, %object
	.size	which, 4
which:
	.space	4
	.type	withKey, %object
	.size	withKey, 4
withKey:
	.space	4
	.type	blueDoorOpened, %object
	.size	blueDoorOpened, 4
blueDoorOpened:
	.space	4
	.type	ifAttack, %object
	.size	ifAttack, 4
ifAttack:
	.space	4
	.type	withBlock, %object
	.size	withBlock, 4
withBlock:
	.space	4
	.type	ifOpenChest, %object
	.size	ifOpenChest, 4
ifOpenChest:
	.space	4
	.type	doorClosedRow, %object
	.size	doorClosedRow, 4
doorClosedRow:
	.space	4
	.type	dontPunch, %object
	.size	dontPunch, 4
dontPunch:
	.space	4
	.type	F_LEFT, %object
	.size	F_LEFT, 4
F_LEFT:
	.space	4
	.type	bullet_h, %object
	.size	bullet_h, 4
bullet_h:
	.space	4
	.type	isChestOpen, %object
	.size	isChestOpen, 4
isChestOpen:
	.space	4
	.type	greenDoorOpened, %object
	.size	greenDoorOpened, 4
greenDoorOpened:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
