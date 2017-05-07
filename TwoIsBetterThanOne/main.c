/*Game - Two is Better than One - Al Mahiyan
A puzzle action game where you play as 2 characters. Each have their own abilities and the goal 
is to swap between them to complete tasks until you can unlock the exit gate. 

BUGS: 
1. Music for game screen (soundA) may stop after a certain task is completed. *Sound for that file is located
line 270**. Not sure why since it loops. It swithces to the titlesong at some point. Only noticed it a couple times.
2. Sometimes when pushing block, it changes my width of characters. I hard coded a fix, but it might still happen,
not entirely positive. Collision code located in game.c, line 1454 to 1510.


COOL THINGS I DID (Not sure which count totally)
1. Pooling for turrets at different points on the map. Required seperate horizontal and vertical bullet sprites and collision checks.
	Located game.c line 1282 and 1770.
2. Function pointer state machine. Main.c line 114, 146 and so on for each state. 
3. The fact its a puzzle game required some complexity. But in terms of advanced characters,
each can do something different, have different checks for what they can do, and some can't do 
what the other can when holding an item. (holding key prevents switching to other character). 
4. All character, sprite art, and most state art is custom made. 
5. Unique due to the swapping mechanic and different abilities. 
*/


#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "game_bg.h"
#include "game2_bg.h"
#include "spritesheet.h"
#include "game_bg.h"
#include "gameover_bg.h"
#include "pause_bg.h"
#include "start_bg.h"
#include "win_bg.h"
#include "instructions.h"
#include "GameSong.h"
#include "TitleSong.h"
#include "PunchSfx.h"
#include "TutorialTitle.h"
#include "Tutorial1.h"
#include "Tutorial2.h"
#include "Tutorial3.h"
#include "Tutorial4.h"
#include "Tutorial5.h"
#include "Tutorial6.h"
#include "Tutorial7.h"
#include "Tutorial8.h"
#include "Tutorial9.h"
#include "TutorialEnd.h"
#include "start_bgscroll.h"
#include "TutorialSong.h"
#include "GameOverSong.h"
#include "WinSong.h"


SOUND soundA;

//buttons 
unsigned int buttons;
unsigned int oldButtons;

//state prototyes
void gotoStart();
void updateStart();
void gotoGame();
void updateGame();
void gotoPause();
void updatePause();
void gotoWin();
void updateWin();
void gotoLose();
void updateLose();
void gotoInstruct();
void updateInstruct();

void gotoGame2();
void updateGame2();

//tutorial states
void gotoTutorialTitle();
void updateTutorialTitle();
void gotoTutorial1();
void updateTutorial1();
void gotoTutorial2();
void updateTutorial2();
void gotoTutorial3();
void updateTutorial3();
void gotoTutorial4();
void updateTutorial4();
void gotoTutorial5();
void updateTutorial5();
void gotoTutorial6();
void updateTutorial6();
void gotoTutorial7();
void updateTutorial7();
void gotoTutorial8();
void updateTutorial8();
void gotoTutorial9();
void updateTutorial9();
void gotoTutorialEnd();
void updateTutorialEnd();

void (*state)();

int hOff;

int main(){

	REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(31);
	REG_BG1CNT = BG_SIZE1 | CBB(1) | SBB(29);
	
	//load the background palette and the tiles
	
	hideSprites();

	initialize(0);
	gotoStart();

	setupSounds();
	setupInterrupts();

	hOff = 0;

	playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);

	while(1){


		oldButtons = buttons;
		buttons = BUTTONS;



		//main switch for states
		state();

		copyShadowOAM();

		waitForVblank();

	}
}

void setupSounds(){
	REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.loops = loops;
        soundA.isPlaying = 1;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.vbCount = 0;  
}

void pauseSound()
{
	REG_TM0CNT = 0;
	REG_TM1CNT = 0;
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
}

void unpauseSound()
{
	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;
}

void stopSound()
{
    dma[1].cnt = 0;
    dma[2].cnt = 0;
    REG_TM0CNT = 0;
	REG_TM1CNT = 0;
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int) interruptHandler;
	
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		if(soundA.isPlaying){
			soundA.vbCount++;
			if(soundA.vbCount > soundA.duration){
				if(soundA.loops){
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				}else{
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}

		if(soundB.isPlaying){
			soundB.vbCount++;
			if(soundB.vbCount > soundB.duration){
				if(soundB.loops){
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				}else{
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

//gotoStartScreen
void gotoStart(){


	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
	loadPalette(start_bgPal);
    DMANow(3, start_bgTiles, &CHARBLOCKBASE[0], start_bgTilesLen/2);
	DMANow(3, start_bgMap, &SCREENBLOCKBASE[31], start_bgMapLen/2);
	DMANow(3, start_bgscrollTiles, &CHARBLOCKBASE[1], start_bgscrollTilesLen/2);
	DMANow(3, start_bgscrollMap, &SCREENBLOCKBASE[29], start_bgscrollMapLen/2);

	state = updateStart;
}

//update start screen
void updateStart(){

	hOff++;
	if(BUTTON_PRESSED(BUTTON_START)){

		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		
		initialize(0);
		gotoGame();

		
	}
	if(BUTTON_PRESSED(BUTTON_L)){

		playSoundA(TutorialSong, TUTORIALSONGLEN, TUTORIALSONGFREQ, 1);
		gotoTutorialTitle();

		
	}

	REG_BG1HOFS = hOff;
}

//go to game screen
void gotoGame(){

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;


	loadPalette(game_bgPal);
	DMANow(3, game_bgTiles, &CHARBLOCKBASE[0], game_bgTilesLen/2);
	DMANow(3, game_bgMap, &SCREENBLOCKBASE[31], game_bgMapLen/2);
	//load the spritesheet tile and plette
	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);

	//hideSprites();
	state = updateGame;
}

void updateGame(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoPause();
	}

	gameFunctions();

	//move the stuff yo
	
	if(checkNoLives()){
		gotoLose();
		playSoundA(GameOverSong, GAMEOVERSONGLEN, GAMEOVERSONGFREQ, 1);
	}
	if(checkWin() != 1){
		initialize(10);
		gotoGame2();
		playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
	}
}

void gotoGame2(){

	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(game2_bgPal);
	DMANow(3, game2_bgTiles, &CHARBLOCKBASE[0], game2_bgTilesLen/2);
	DMANow(3, game2_bgMap, &SCREENBLOCKBASE[31], game2_bgMapLen/2);
	//load the spritesheet tile and plette
	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);

	state = updateGame2;

}

void updateGame2(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoPause();
	}
	actPlayers(10);
	updateLives();
	moveBullets(10);
	moveEnemies(10);
	moveObjects(10);


	//draw all the stuff yo
	drawCharacters();
	drawEnemies();
	drawBullets();
	drawObjects();

	if(checkNoLives()){
		gotoLose();
		playSoundA(GameOverSong, GAMEOVERSONGLEN, GAMEOVERSONGFREQ, 1);
	}
	if(checkWin() == 1){
		gotoWin();
		playSoundA(WinSong, WINSONGLEN, WINSONGFREQ, 1);
	}
}

void gameFunctions(){
	actPlayers(0);
	updateLives();
	moveBullets(0);
	moveEnemies(0);
	moveObjects(0);


	//draw all the stuff yo
	drawCharacters();
	drawEnemies();
	drawBullets();
	drawObjects();

}

//go to pause screen and display actions
void gotoPause(){
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(instructionsPal);
    DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
	DMANow(3, instructionsMap, &SCREENBLOCKBASE[31], instructionsMapLen/2);

	state = updatePause;
}

//update pause screen, if start continue game, backspace go to start
void updatePause(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoGame();
	}
}

//go to winscreen 
void gotoWin(){
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
	loadPalette(win_bgPal);
    DMANow(3, win_bgTiles, &CHARBLOCKBASE[0], win_bgTilesLen/2);
	DMANow(3, win_bgMap, &SCREENBLOCKBASE[31], win_bgMapLen/2);
	DMANow(3, start_bgscrollTiles, &CHARBLOCKBASE[1], start_bgscrollTilesLen/2);
	DMANow(3, start_bgscrollMap, &SCREENBLOCKBASE[29], start_bgscrollMapLen/2);


	state = updateWin;
}

//on win screen if start is pressed to go start
void updateWin(){

	hOff++;
	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(0);
		playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);
		gotoStart();
		
	}



	REG_BG1HOFS = hOff;
}

//go to lose screen draw on both sides
void gotoLose(){
	
	

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
	loadPalette(gameover_bgPal);
    DMANow(3, gameover_bgTiles, &CHARBLOCKBASE[0], gameover_bgTilesLen/2);
	DMANow(3, gameover_bgMap, &SCREENBLOCKBASE[31], gameover_bgMapLen/2);
	DMANow(3, start_bgscrollTiles, &CHARBLOCKBASE[1], start_bgscrollTilesLen/2);
	DMANow(3, start_bgscrollMap, &SCREENBLOCKBASE[29], start_bgscrollMapLen/2);


	

	state = updateLose;
	
}

//on lose screen if start pressed go to start
void updateLose(){

	hOff++;
	if(BUTTON_PRESSED(BUTTON_START)){

		playSoundA(TitleSong, TITLESONGLEN, TITLESONGFREQ, 1);
		gotoStart();
	}

	REG_BG1HOFS = hOff;

}
//display screen and instructions
void gotoInstruct(){
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(instructionsPal);
    DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
	DMANow(3, instructionsMap, &SCREENBLOCKBASE[31], instructionsMapLen/2);

	state = updateInstruct;
}
//go to start if pressed
void updateInstruct(){
	if(BUTTON_PRESSED(BUTTON_START)){
		
		gotoStart();
	}
}


//go to tutorial title page
void gotoTutorialTitle(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(TutorialTitlePal);
    DMANow(3, TutorialTitleTiles, &CHARBLOCKBASE[0], TutorialTitleTilesLen/2);
	DMANow(3, TutorialTitleMap, &SCREENBLOCKBASE[31], TutorialTitleMapLen/2);

	
	state = updateTutorialTitle;
}

//update tutorial title page
void updateTutorialTitle(){
	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(1);
		gotoTutorial1();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}


}

//tut1
void gotoTutorial1(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(Tutorial1Pal);
    DMANow(3, Tutorial1Tiles, &CHARBLOCKBASE[0], Tutorial1TilesLen/2);
	DMANow(3, Tutorial1Map, &SCREENBLOCKBASE[31], Tutorial1MapLen/2);


	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);



	state = updateTutorial1;
}

void updateTutorial1(){


	actPlayers(1);
	drawCharacters();

	if(BUTTON_PRESSED(BUTTON_START)){
		gotoTutorial2();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		gotoTutorialTitle();
	}

	


}

//tut2
void gotoTutorial2(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(Tutorial2Pal);
    DMANow(3, Tutorial2Tiles, &CHARBLOCKBASE[0], Tutorial2TilesLen/2);
	DMANow(3, Tutorial2Map, &SCREENBLOCKBASE[31], Tutorial2MapLen/2);

	state = updateTutorial2;
}

void updateTutorial2(){
	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(3);
		gotoTutorial3();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(1);
		gotoTutorial1();
	}
}

void gotoTutorial3(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(Tutorial3Pal);
    DMANow(3, Tutorial3Tiles, &CHARBLOCKBASE[0], Tutorial3TilesLen/2);
	DMANow(3, Tutorial3Map, &SCREENBLOCKBASE[31], Tutorial3MapLen/2);

	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);

	state = updateTutorial3;


}

void updateTutorial3(){

	actPlayers(3);
	drawFighter();
	drawWall2();


	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(4);
		gotoTutorial4();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(2);
		gotoTutorial2();
	}

	

}

void gotoTutorial4(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(Tutorial4Pal);
    DMANow(3, Tutorial4Tiles, &CHARBLOCKBASE[0], Tutorial4TilesLen/2);
	DMANow(3, Tutorial4Map, &SCREENBLOCKBASE[31], Tutorial4MapLen/2);

	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);


	state = updateTutorial4;
}

void updateTutorial4(){


	actPlayers(4);
	drawFighter();
	drawDoor1();
	moveObjects(4);
	drawButton();
	drawBlock();

	if(BUTTON_PRESSED(BUTTON_START)){
		gotoTutorial5();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();

	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(3);
		gotoTutorial3();
	}

}

void gotoTutorial5(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(Tutorial5Pal);
    DMANow(3, Tutorial5Tiles, &CHARBLOCKBASE[0], Tutorial5TilesLen/2);
	DMANow(3, Tutorial5Map, &SCREENBLOCKBASE[31], Tutorial5MapLen/2);

	state = updateTutorial5;
}

void updateTutorial5(){
	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(6);
		gotoTutorial6();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(4);
		gotoTutorial4();
	}
}

void gotoTutorial6(){
	hideSprites();
	copyShadowOAM();
	initialize(6);
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(Tutorial6Pal);
    DMANow(3, Tutorial6Tiles, &CHARBLOCKBASE[0], Tutorial6TilesLen/2);
	DMANow(3, Tutorial6Map, &SCREENBLOCKBASE[31], Tutorial6MapLen/2);

	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);

	state = updateTutorial6;
}

void updateTutorial6(){


	actPlayers(6);
	moveEnemies(6);
	movePBullets(6);
	drawPBullets();
	drawShooter();
	drawOrb2();
	if(checkNoLives()){
		initialize(6);
		gotoTutorial6();
	}


	if(BUTTON_PRESSED(BUTTON_START)){
		initialize(7);
		gotoTutorial7();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(5);
		gotoTutorial5();
	}


}

void gotoTutorial7(){
	hideSprites();
	copyShadowOAM();
	initialize(7);
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	loadPalette(Tutorial7Pal);
    DMANow(3, Tutorial7Tiles, &CHARBLOCKBASE[0], Tutorial7TilesLen/2);
	DMANow(3, Tutorial7Map, &SCREENBLOCKBASE[31], Tutorial7MapLen/2);

	DMANow(3, spritesheetTiles, &CHARBLOCKBASE[4], spritesheetTilesLen/2);
	DMANow(3, spritesheetPal, SPRITE_PALETTE, spritesheetPalLen/2);

	state = updateTutorial7;
}

void updateTutorial7(){

	actPlayers(7);
	drawShooter();
	drawChest();
	drawLever();
	drawDoor2();

	if(BUTTON_PRESSED(BUTTON_START)){
		gotoTutorial8();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_L)){
		initialize(6);
		gotoTutorial6();
	}
}

void gotoTutorial8(){
	hideSprites();
	copyShadowOAM();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(Tutorial8Pal);
    DMANow(3, Tutorial8Tiles, &CHARBLOCKBASE[0], Tutorial8TilesLen/2);
	DMANow(3, Tutorial8Map, &SCREENBLOCKBASE[31], Tutorial8MapLen/2);

	state = updateTutorial8;
}

void updateTutorial8(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoTutorial9();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		initialize(7);
		gotoTutorial7();
	}
}

void gotoTutorial9(){
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(Tutorial9Pal);
    DMANow(3, Tutorial9Tiles, &CHARBLOCKBASE[0], Tutorial9TilesLen/2);
	DMANow(3, Tutorial9Map, &SCREENBLOCKBASE[31], Tutorial9MapLen/2);

	state = updateTutorial9;
}

void updateTutorial9(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoTutorialEnd();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		gotoTutorial8();
	}
}

void gotoTutorialEnd(){
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	loadPalette(TutorialEndPal);
    DMANow(3, TutorialEndTiles, &CHARBLOCKBASE[0], TutorialEndTilesLen/2);
	DMANow(3, TutorialEndMap, &SCREENBLOCKBASE[31], TutorialEndMapLen/2);

	state = updateTutorialEnd;
}

void updateTutorialEnd(){
	if(BUTTON_PRESSED(BUTTON_START)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)){
		gotoStart();
	}
	if(BUTTON_PRESSED(BUTTON_B)){
		gotoTutorial9();
	}
}