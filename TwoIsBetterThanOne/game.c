#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include "game_bg.h"
#include "collisionMap.h"
#include "collisionMapTut3.h"
#include "collisionMapTut4.h"
#include "collisionMapTut7.h"
#include "collisionMap2.h"
#include "GameSong.h"
#include "TitleSong.h"
#include "PunchSfx.h"
#include "LaserSfx.h"
#include "DoorSfx.h"
#include "OpenSfx.h"
#include "DestroySfx.h"
#include "SwitchSfx.h"
#include "DamageSfx.h"




int mapSize = 256;

//copy of oam
OBJ_ATTR shadowOAM[128];

//screenCollison map size
int screenCollMapSize = 256;

#define ROWMASK 0xFF
#define COLMASK 0x1FF

//players nand enemies
PLAYER fighter;
PLAYER shooter;

ENEMY orb1;
ENEMY orb2;

//objects
OBJECT block;
OBJECT wall;
OBJECT wall2;
OBJECT button;
OBJECT doorA;
OBJECT doorExit;
OBJECT chest;
int isChestOpen = 0;
OBJECT lever;
OBJECT livesNum;

int doorClosedRow = 0;
int doorOpenRow = 4;
int doorAloc = 12;
int doorExitloc = 8;

int blueDoorOpened = 0;
int greenDoorOpened = 0;

//row of object locations
int onOffObjectLoc = 26;
int blockButton_loc = 28;

//object locations
int wallOK = 16;
int wallDown = 16;
int wallTwoOk = 20;
int wallTwoDown = 20;
int chestClosed = 14;
int chestOpen = 16;
int leverOff = 18;
int leverOn = 20;
int blockloc = 8;
int buttonUp = 12;
int buttonDown = 10;

int withBlock = 0;


//bullets
int bulletCount = 5;
int tBulletCount = 35;
int timeToNextTBullet;
int time;

int cheatPressed = 0;
int dontPunch = 0;

BULLET pBullets[5];
BULLET tBullets[35];

//bullet sprite locations
int bullet_loc = 24;
int bullet_h = 0;
int bullet_v = 2;
int tbullet_h = 4;
int tbullet_v = 6;

//who is on default 0
int which = 0;

//directions for fighter and shooter
int F_LEFT = 0;
int F_RIGHT = 1;
int F_DOWN = 2;
int F_UP = 3;
int S_LEFT = 4;
int S_RIGHT = 5;
int S_DOWN = 6;
int S_UP = 7; 

//direction for enemies
int E_RIGHT = 8;
int E_UP = 9;
int E_LEFT = 10;
int E_DOWN = 11;

int orb_loc = 28;

//attack state for players
int ifAttack = 0;
int ifOpenChest = 0;
int F_ATTACK = 12;
int S_ATTACK = 20;
int S_HACK = 22;

int withKey = 0;


//tutorialvalues

//state enums
enum {FRONT, BACK, RIGHT, LEFT, IDLE, ACT, ACT1, ACT2, BULLETSTART};  

//method to copy copy oam into real oam
void copyShadowOAM(){
	DMANow(3, shadowOAM, OAM, 4*128);
}

//hide all the sprites in the shadowoam
void hideSprites()
{
    for(int i = 0; i<128; i++){
    	shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}


void initialize(int tutLevel){


    
    cheatPressed = 0;

    if(tutLevel == 6 || tutLevel == 7){
        which = 1;
    }else{
        which = 0;
    }
    //fighter variables
    fighter.width = 11;
    fighter.height = 16;
    fighter.rdel = 1;
    fighter.cdel = 1;
    if(tutLevel == 1){
        fighter.screenRow = 80;
        fighter.screenCol = 120;
    }else if(tutLevel == 3){
        fighter.screenRow = 80;
        fighter.screenCol = 40;

    }else if(tutLevel == 4){
        fighter.screenRow = 90;
        fighter.screenCol = 10;

    }else if(tutLevel == 10){
        fighter.screenRow = 7;
        fighter.screenCol = 20;
    }else{
        fighter.screenRow = 130;
        fighter.screenCol = 20;
    }
    
    fighter.lives = 10;
    fighter.isHit = 0;

    fighter.aniState = FRONT;
    

    //shooter variables 
    shooter.width = 8;
    shooter.height = 16;
    shooter.rdel = 1;
    shooter.cdel = 1;
    if(tutLevel == 1){
        shooter.screenRow = 80;
        shooter.screenCol = 120;
    }else if(tutLevel == 3 || tutLevel == 6){
        shooter.screenRow = 80;
        shooter.screenCol = 40;
    }else if(tutLevel == 4){
        shooter.screenRow = 90;
        shooter.screenCol = 10;
    }else if(tutLevel == 7){
        shooter.screenRow = 80;
        shooter.screenCol = 60;
    }else if(tutLevel == 10){
        shooter.screenRow = 7;
        shooter.screenRow = 20;
    }else{
        shooter.screenRow = 130;
        shooter.screenCol = 20;
    }
    
    shooter.lives = 5;
    shooter.isHit = 0;

    //state for shooter animations
    //fighter animatoins
    shooter.aniState = FRONT;

    fighter.aniCounter = 0;
    fighter.currFrame = 0;

    shooter.aniCounter = 0;
    shooter.currFrame = 0;
    //initial orb states
    orb1.state = IDLE;
    orb1.stateCount = 0;
    orb1.direction = E_DOWN;

    orb2.state = IDLE;
    orb2.stateCount = 0;
    orb2.direction = E_RIGHT;

    if(tutLevel == 10){
        orb1.screenRow = 90;
        orb1.screenCol = 200;
    }else{
        orb1.screenRow = 100;
         orb1.screenCol = 59;
    }
    
    orb1.width = 16;
    orb1.height = 16;
    orb1.cdel = 2;
    orb1.rdel = 2;
    orb1.active = 1;
    orb1.lives = 5;
    if(tutLevel == 6){
        orb2.screenRow = 90;
        orb2.screenCol = 150;
    }else if(tutLevel == 10){
        orb2.screenRow = 110;
        orb2.screenCol = 200;
    }else{
        orb2.screenRow = 10;
        orb2.screenCol = 180;
    }
   
    orb2.width = 16;
    orb2.height = 16;
    orb2.cdel = 1;
    orb2.rdel = 1;
    orb2.lives = 5;
    orb2.active = 1;

    livesNum.width = 10;
    livesNum.height = 14;
    if(tutLevel == 10){
        livesNum.screenRow = 103;
        livesNum.screenCol = 185;
    }else{
        livesNum.screenRow = 75;
        livesNum.screenCol = 138;
    }
    

    //bullet initial stuff
    BULLET pBullet;
    pBullet.height = 4;
    pBullet.width = 4;
    pBullet.cdel = 0;
    pBullet.rdel = 0;
    pBullet.active = 0;
    //make structs for each bullet
    for(int i = 0; i<bulletCount; i++){
        pBullets[i] = pBullet;
    }
    //turret bullet initial stuff
    BULLET tBullet;
    tBullet.height = 4;
    tBullet.width = 4;
    tBullet.cdel = 0;
    tBullet.rdel = 0;
    tBullet.active = 0;


    for(int i = 0; i<tBulletCount; i++){
        tBullets[i] = tBullet;
    }

    if(tutLevel == 4){
        block.screenRow = 90;
        block.screenCol = 50;
    }else if(tutLevel == 10){
        block.screenRow = 45;
        block.screenCol = 65;
    }else{
        block.screenRow = 130;
        block.screenCol = 90;
    }
    
    block.height = 15;
    block.width = 15;
    block.cdel = 0;
    block.rdel = 0;

    doorA.height = 4;
    doorA.width = 23;
    if(tutLevel == 4){
        doorA.screenRow = 80;
        doorA.screenCol = 136;
    }else if(tutLevel == 10){
        doorA.screenRow = 40;
        doorA.screenCol = 200;
    }else{
        doorA.screenRow = 38;
        doorA.screenCol = 8;
    }
    
    doorA.active = 0;


    doorExit.height = 4;
    doorExit.width = 32;
    if(tutLevel == 7){
        doorExit.screenRow = 107;
        doorExit.screenCol = 184;
    }else if(tutLevel == 10){
        doorExit.screenRow = 130;
        doorExit.screenCol = 88;
    }else{
        doorExit.screenRow = 135;
        doorExit.screenCol = 202;
    }
    
    doorExit.active = 0;

    wall.height = 8;
    wall.width = 32;
    if(tutLevel == 10){
        wall.screenRow = 80;
        wall.screenCol = 88;
    }else{
         wall.screenRow = 119;
        wall.screenCol = 8;
    }
   
    wall.isHit = 0;
    wall.active = 0;


    wall2.height = 32;
    wall2.width = 8;
    if(tutLevel == 3){
         wall2.screenRow = 70;
         wall2.screenCol = 128;
    }else if(tutLevel == 10){
        wall2.screenRow = 130;
        wall2.screenCol = 48;
    }else{
        wall2.screenRow = 8;
        wall2.screenCol = 144;
    }
    
    wall2.isHit = 0;
    wall2.active = 0;

    chest.height = 13;
    chest.width = 14;
    if(tutLevel == 7){
        chest.screenRow = 76;
        chest.screenCol = 130;
    }else if(tutLevel == 10){
        chest.screenRow = 135;
        chest.screenCol = 60;
    }else{
        chest.screenRow = 17;
        chest.screenCol = 216;
    }
    
    chest.isHit = 0;
    chest.active = 0;

    lever.height = 8;
    lever.width = 8;
    if(tutLevel == 7){
        lever.screenRow = 75;
        lever.screenCol = 0;
    }else if(tutLevel == 10){
        lever.screenRow = 17;
        lever.screenCol = 200;
    }else{
        lever.screenRow = 15;
        lever.screenCol = 7;
    }
    
    lever.isHit = 0;
    lever.active = 0;

    button.height = 9;
    button.width = 9;
    if(tutLevel == 4){
         button.screenRow = 90;
         button.screenCol = 100;
    }else if(tutLevel == 10){
         button.screenRow = 138;
         button.screenCol = 137;
    }else{
         button.screenRow = 138;
         button.screenCol = 179;
    }
   
    button.active = 0;
    withKey = 0;
    blueDoorOpened = 0;

}

//swap which character is playing
void swapPlayers(){
    which++;
    if(which == 2){
        which = 0;
    }
}

//move depending on who is current
void actPlayers(int tutLevel){
    //temp
    int tempCol;
    int tempRow; 


    //once r is pressed set the location of players 
    //to the locaiton of the other player
    if(tutLevel != 3  && tutLevel != 4 && tutLevel !=6 && tutLevel !=7 && withKey != 1){
            if(BUTTON_PRESSED(BUTTON_L)){
            playSoundB(SwitchSfx, SWITCHSFXLEN, SWITCHSFXFREQ, 0);
            if(which == 0){
                tempCol = shooter.screenCol;
                shooter.screenCol = fighter.screenCol;
                fighter.screenCol = tempCol;

                tempRow = shooter.screenRow;
                shooter.screenRow = fighter.screenRow;
                fighter.screenRow = tempRow;

            }
            if(which == 1){
                tempCol = fighter.screenCol;
                fighter.screenCol = shooter.screenCol;
                shooter.screenCol = tempCol;

                tempRow = fighter.screenRow;
                fighter.screenRow = shooter.screenRow;
                shooter.screenRow = tempRow;
            }

            //swap them
            swapPlayers();

        }
    }
    

    //perform actions of each player
    if(tutLevel == 1){
        actTut1Shooter();
        actTut1Fighter();
        moveTut1Shooter();
        moveTut1Fighter();
    }else if(tutLevel == 3){
        actionsFighter();
        moveTut3Fighter();
    }else if(tutLevel == 4){
        actionsFighter();
        moveTut4Fighter();
    }else if(tutLevel == 6){
        actionsShooter();
        moveTut1Shooter();
    }else if(tutLevel == 7){
        actionsShooter();
        moveTut7Shooter();
    }else if(tutLevel == 10){
        actShooter();
        actFighter();
        moveGame2Shooter();
        moveGame2Fighter();
    }else{
        actShooter();
        actFighter();
        moveShooter();
        moveFighter();
    }
    
    
    
}

void actTut1Fighter(){
    actionsFighter();
}

void actTut1Shooter(){
    actionsShooter();
}

void moveTut1Fighter(){
    if(BUTTON_HELD(BUTTON_UP)){
          if(fighter.screenRow > 0){
            fighter.screenRow--;
        }
     }
     if(BUTTON_HELD(BUTTON_DOWN)){
           if(fighter.screenRow < 160 - fighter.height){
            fighter.screenRow++;
        }
 }
    if(BUTTON_HELD(BUTTON_LEFT)){
         if(fighter.screenCol> 0){
               fighter.screenCol--;
           }
     }
    if(BUTTON_HELD(BUTTON_RIGHT)){
           if(fighter.screenCol< 240){
             fighter.screenCol++;
               }
        }
}

void moveTut3Fighter(){
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMapTut3Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol +3 , 256)] == 0 
            && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width/2 +3, 256)] == 0 
                && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width -2, 256)] == 0)
                {
                
                    if(!wall2.active){
                        wall2Collision();
                    }
                    

                    if(fighter.screenRow > 0){
                        fighter.screenRow--;
                    }
                }
         }
    //if button held down move him chestCollision();down depending on screen location 
    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol +3, 256)] == 0 
             && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height, fighter.screenCol + fighter.width/2 +3 , 256)] == 0
                && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol + fighter.width - 2 , 256)] == 0)
                {
                    if(!wall2.active){
                        wall2Collision();
                    }

                    if(fighter.screenRow < 160 - fighter.height){
                        fighter.screenRow++;
                    }

                }
         }
         //"""
    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMapTut3Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + 2, 256)] == 0 
            && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + 2, 256)] == 0 
                && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + 2 , 256)] == 0)
                {

                    if(!wall2.active){
                        wall2Collision();
                    }
                
                    if(fighter.screenCol> 0){
                        fighter.screenCol--;
                    }
                }
         }
        //""
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMapTut3Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + fighter.width - 1, 256)] == 0
        && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + fighter.width - 1, 256)] == 0 
                && !collisionMapTut3Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + fighter.width - 1, 256)] == 0)
                {
                
                    if(!wall2.active){
                        wall2Collision();
                    }
                    
                    if(fighter.screenCol< 240){
                        fighter.screenCol++;
                    }
                }
         }
}

void moveTut4Fighter(){
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMapTut4Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol +3 , 256)] == 0 
            && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width/2 +3, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width -2, 256)] == 0)
                {

                    door1Collision(4);
                    if(fighter.screenRow > 0){
                        fighter.screenRow--;
                    }
                }
         }
    //if button held down move him chestCollision();down depending on screen location 
    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol +3, 256)] == 0 
             && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height, fighter.screenCol + fighter.width/2 +3 , 256)] == 0
                && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol + fighter.width - 2 , 256)] == 0)
                {
                    
                    door1Collision(4);
                    if(fighter.screenRow < 160 - fighter.height){
                        fighter.screenRow++;
                    }

                }
         }
         //"""
    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMapTut4Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + 2, 256)] == 0 
            && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + 2, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + 2 , 256)] == 0)
                {

                    door1Collision(4);
                    if(fighter.screenCol> 0){
                        fighter.screenCol--;
                    }
                }
         }
        //""
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMapTut4Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + fighter.width - 1, 256)] == 0
        && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + fighter.width - 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + fighter.width - 1, 256)] == 0)
                {
                
                    door1Collision(4);
                    if(fighter.screenCol< 240){
                        fighter.screenCol++;
                    }
                }
         }
}

void moveGame2Fighter(){
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMap2Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol +3 , 256)] == 0 
            && !collisionMap2Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width/2 +3, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width -2, 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    
                    door1Collision(0);
                    door2Collision(0);
                    if(fighter.screenRow > 0){
                        fighter.screenRow--;
                    }
                }
         }
    //if button held down move him chestCollision();down depending on screen location 
    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol +3, 256)] == 0 
             && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height, fighter.screenCol + fighter.width/2 +3 , 256)] == 0
                && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol + fighter.width - 2 , 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                     door1Collision(0);
                    door2Collision(0);

                    if(fighter.screenRow < 160 - fighter.height){
                        fighter.screenRow++;
                    }

                }
         }
         //"""
    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMap2Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + 2, 256)] == 0 
            && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + 2, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + 2 , 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                     door1Collision(0);
                    door2Collision(0);
                    leverCollision();
                    if(fighter.screenCol> 0){
                        fighter.screenCol--;
                    }
                }
         }
        //""
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMap2Bitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + fighter.width - 1, 256)] == 0
        && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + fighter.width - 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + fighter.width - 1, 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    chestCollision();
                    if(fighter.screenCol< 240){
                        fighter.screenCol++;
                    }
                }
         }
}

void moveTut1Shooter(){
    if(BUTTON_HELD(BUTTON_UP)){
          if(shooter.screenRow > 0){
            shooter.screenRow--;
        }
     }
     if(BUTTON_HELD(BUTTON_DOWN)){
           if(shooter.screenRow < 160 - shooter.height){
            shooter.screenRow++;
        }
 }
    if(BUTTON_HELD(BUTTON_LEFT)){
         if(shooter.screenCol> 0){
               shooter.screenCol--;
           }
     }
    if(BUTTON_HELD(BUTTON_RIGHT)){
           if(shooter.screenCol< 240){
             shooter.screenCol++;
               }
            }
}

void moveTut6Shooter(){
    if(BUTTON_HELD(BUTTON_UP)){
          if(shooter.screenRow > 0){
            shooter.screenRow--;
        }
     }
     if(BUTTON_HELD(BUTTON_DOWN)){
           if(shooter.screenRow < 160 - shooter.height){
            shooter.screenRow++;
        }
    }
    if(BUTTON_HELD(BUTTON_LEFT)){
         if(shooter.screenCol> 0){
               shooter.screenCol--;
           }
     }
    if(BUTTON_HELD(BUTTON_RIGHT)){
           if(shooter.screenCol< 240){
             shooter.screenCol++;
               }
            }
}

void moveTut7Shooter(){
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMapTut7Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + 5 , 256)] == 0 
            && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width/2 + 3 , 256)] == 0 
                && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                   
                    door2Collision(7);
                    if(shooter.screenRow > 0){
                        shooter.screenRow--;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + 5, 256)] == 0 
            && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width/2 + 3, 256)] == 0
                && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                  
                    door2Collision(7);
                    if(shooter.screenRow < 160 - shooter.height){
                        shooter.screenRow++;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMapTut7Bitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + 4 , 256)] == 0
            && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + 4 , 256)] == 0 
                && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height -1, shooter.screenCol + 4 , 256)] == 0)
                {
                   
                    door2Collision(7);
                    leverCollision();
                    if(shooter.screenCol> 0){
                        shooter.screenCol--;
                    }
                }
         }
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMapTut7Bitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + shooter.width , 256)] == 0 
            && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + shooter.width , 256)] == 0
                && !collisionMapTut7Bitmap[OFFSET(shooter.screenRow + shooter.height - 1, shooter.screenCol + shooter.width  , 256)] == 0)
                {
                  
                    door2Collision(7);
                    chestCollision();
                    if(shooter.screenCol< 240){
                        shooter.screenCol++;
                    }
                }
         }
}

void moveGame2Shooter(){
     if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMap2Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + 5 , 256)] == 0 
            && !collisionMap2Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width/2 + 3 , 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                   //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    if(shooter.screenRow > 0){
                        shooter.screenRow--;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + 5, 256)] == 0 
            && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width/2 + 3, 256)] == 0
                && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                    //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    if(shooter.screenRow < 160 - shooter.height){
                        shooter.screenRow++;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMap2Bitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + 4 , 256)] == 0
            && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + 4 , 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height -1, shooter.screenCol + 4 , 256)] == 0)
                {
                   // blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    leverCollision();
                    if(shooter.screenCol> 0){
                        shooter.screenCol--;
                    }
                }
         }
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMap2Bitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + shooter.width , 256)] == 0 
            && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + shooter.width , 256)] == 0
                && !collisionMap2Bitmap[OFFSET(shooter.screenRow + shooter.height - 1, shooter.screenCol + shooter.width  , 256)] == 0)
                {
                    //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    chestCollision();
                    if(shooter.screenCol< 240){
                        shooter.screenCol++;
                    }
                }
         }
}


//move the enemies
void moveEnemies(int tutLevel){
    
    if(tutLevel == 10){
        if(orb1.active){
            moveOrb1Game2();
        }
        if(orb2.active){
            moveOrb2Game2();
        }
        
    }else{
             if(tutLevel != 6){
            if(orb1.active){
                moveOrb1();
            }
        }
        
         
        if(orb2.active){
            moveOrb2();
        }
    }


   

    //cheath
    if(BUTTON_PRESSED(BUTTON_R)){
        
        orb1.active = 0;
        orb2.active = 0;
        wall.active = 1;
        wall2.active = 1;
        if(cheatPressed == 0){
            playSoundB(DestroySfx, DESTROYSFXLEN, DESTROYSFXFREQ, 0);
            cheatPressed = 1;
        }
        
     
    }
}



//move projectiles
void moveBullets(int tutLevel){
    
    if(tutLevel == 10){
        moveT2Bullets();
        movePBullets(10);
    }else{
        movePBullets(0);
        moveTBullets(0);
    }
    
}

void moveObjects(int tutLevel){
    if(which != 1){
        if(tutLevel == 4){
            moveBlockTut4();
        }else if(tutLevel == 10){
            moveBlockGame2();
        }else{
            moveBlock();
        }
        
    }

    
}

void moveFighter(){
    //if up button is held move the fighre up depending on screen collisions and borders
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMapBitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol +3 , 256)] == 0 
            && !collisionMapBitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width/2 +3, 256)] == 0 
                && !collisionMapBitmap[OFFSET(fighter.screenRow + 4, fighter.screenCol + fighter.width -2, 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    
                    door1Collision(0);
                    door2Collision(0);
                    if(fighter.screenRow > 0){
                        fighter.screenRow--;
                    }
                }
         }
    //if button held down move him chestCollision();down depending on screen location 
    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol +3, 256)] == 0 
             && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height, fighter.screenCol + fighter.width/2 +3 , 256)] == 0
                && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height , fighter.screenCol + fighter.width - 2 , 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                     door1Collision(0);
                    door2Collision(0);

                    if(fighter.screenRow < 160 - fighter.height){
                        fighter.screenRow++;
                    }

                }
         }
         //"""
    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMapBitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + 2, 256)] == 0 
            && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + 2, 256)] == 0 
                && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + 2 , 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                     door1Collision(0);
                    door2Collision(0);
                    leverCollision();
                    if(fighter.screenCol> 0){
                        fighter.screenCol--;
                    }
                }
         }
        //""
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMapBitmap[OFFSET(fighter.screenRow + 5, fighter.screenCol + fighter.width - 1, 256)] == 0
        && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height/2, fighter.screenCol + fighter.width - 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(fighter.screenRow + fighter.height - 1, fighter.screenCol + fighter.width - 1, 256)] == 0)
                {
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    chestCollision();
                    if(fighter.screenCol< 240){
                        fighter.screenCol++;
                    }
                }
         }

}

//same thing for shooter
void moveShooter(){
    if(BUTTON_HELD(BUTTON_UP)){
        if(!collisionMapBitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + 5 , 256)] == 0 
            && !collisionMapBitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width/2 + 3 , 256)] == 0 
                && !collisionMapBitmap[OFFSET(shooter.screenRow + 4, shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                   //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    if(shooter.screenRow > 0){
                        shooter.screenRow--;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_DOWN)){
        if(!collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + 5, 256)] == 0 
            && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width/2 + 3, 256)] == 0
                && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height , shooter.screenCol + shooter.width - 1, 256)] == 0)
                {
                    //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    if(shooter.screenRow < 160 - shooter.height){
                        shooter.screenRow++;
                    }
                }
         }

    if(BUTTON_HELD(BUTTON_LEFT)){
        if(!collisionMapBitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + 4 , 256)] == 0
            && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + 4 , 256)] == 0 
                && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height -1, shooter.screenCol + 4 , 256)] == 0)
                {
                   // blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    leverCollision();
                    if(shooter.screenCol> 0){
                        shooter.screenCol--;
                    }
                }
         }
    if(BUTTON_HELD(BUTTON_RIGHT)){
        if(!collisionMapBitmap[OFFSET(shooter.screenRow + 5, shooter.screenCol + shooter.width , 256)] == 0 
            && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height/2, shooter.screenCol + shooter.width , 256)] == 0
                && !collisionMapBitmap[OFFSET(shooter.screenRow + shooter.height - 1, shooter.screenCol + shooter.width  , 256)] == 0)
                {
                    //blockCollision();
                    if(!wall.active){
                        wallCollision();
                    }
                    if(!wall2.active){
                        wall2Collision();
                    }
                    door1Collision(0);
                    door2Collision(0);
                    chestCollision();
                    if(shooter.screenCol< 240){
                        shooter.screenCol++;
                    }
                }
         }
}


//perform fighter animations
void actFighter()
{   

    actionsFighter();
    //if not idle go to prev state and set to no animation
    
}

void actionsFighter(){
    if(fighter.aniState != IDLE){
        fighter.prevAniState = fighter.aniState;
        fighter.aniState = IDLE;
    }

    //3 frames of motion, so stop at 3 
    if(fighter.aniCounter % 20 == 0){
        fighter.currFrame++;
        fighter.currFrame %= 3;
    }
    
    if(BUTTON_HELD(BUTTON_UP))
    {
        fighter.aniState = BACK;
        fighter.direction = F_UP;
    }
    

    if(BUTTON_HELD(BUTTON_DOWN))
    {
        fighter.aniState = FRONT;
        fighter.direction = F_DOWN;
    }
   

    if(BUTTON_HELD(BUTTON_LEFT)){
        fighter.aniState = LEFT;
        fighter.direction = F_LEFT;
    }

    if(BUTTON_HELD(BUTTON_RIGHT)){
        fighter.aniState = RIGHT;
        fighter.direction = F_RIGHT;
    }

    if(BUTTON_PRESSED(BUTTON_A)){
        
        ifAttack = 1;
        if(which == 0 && dontPunch == 0){
            playSoundB(PunchSfx, PUNCHSFXLEN, PUNCHSFXFREQ, 0);
        }
        if(which == 0){
                if(wall.isHit == 1){
                    wall.active = 1;

            }

                if(wall2.isHit == 1){
                    wall2.active = 1;
            }
        }

       
        
    }
    //if idle set to 0 and prevstate
    if(fighter.aniState == IDLE){
        fighter.currFrame = 0;
        fighter.aniState = fighter.prevAniState;
    }

    if(fighter.aniState != IDLE){
        fighter.aniCounter++;
    }
}

//same stuff for shooter
void actShooter()
{

    actionsShooter();

    

}

void actionsShooter(){

    shooter.width = 11;
    shooter.height = 15;

    if(shooter.aniState != IDLE){
        shooter.prevAniState = shooter.aniState;
        shooter.aniState = IDLE;
    }

    if(shooter.aniCounter % 20 == 0){
        shooter.currFrame++;
        shooter.currFrame %= 3;
    }
    
    if(BUTTON_HELD(BUTTON_UP))
    {
        shooter.aniState = BACK;
        shooter.direction = S_UP;
    }
    

    if(BUTTON_HELD(BUTTON_DOWN))
    {
        shooter.aniState = FRONT;
        shooter.direction = S_DOWN;
    }
   

    //first shiftdown 
    if(BUTTON_HELD(BUTTON_LEFT)){
        shooter.aniState = LEFT;
        shooter.direction = S_LEFT;
    }

    if(BUTTON_HELD(BUTTON_RIGHT)){
        shooter.aniState = RIGHT;
        shooter.direction = S_RIGHT;
    }

    if(BUTTON_PRESSED(BUTTON_A)){
        ifAttack = 1;
        if(which == 1){
            playSoundB(LaserSfx, LASERSFXLEN, LASERSFXFREQ, 0);
        } 
    }

    if(chest.isHit == 1 && which == 1){
        if(BUTTON_PRESSED(BUTTON_B)){
                ifOpenChest = 1;
                chest.active = 1;
                withKey = 1;
                if(isChestOpen == 0){
                    playSoundB(OpenSfx, OPENSFXLEN, OPENSFXFREQ, 0);
                    isChestOpen = 1;
                    
                }
            }
        }
                
            
    if(lever.isHit == 1 && chest.active == 1 && withKey == 1 && isChestOpen == 1){
        if(BUTTON_PRESSED(BUTTON_B)){
            lever.active = 1;
            withKey = 0;
            doorExit.active = 1;
            doorExit.width = 4;
            //playSoundB(OpenSfx, OPENSFXLEN, OPENSFXFREQ, 0);
            if(greenDoorOpened == 0){
                playSoundB(DoorSfx, DOORSFXLEN, DOORSFXFREQ, 0);
                greenDoorOpened = 1;
                shooter.height = 15;
                shooter.width = 8;
            }
        }
            
            
    }
        
       
    

    if(shooter.aniState == IDLE){
        shooter.currFrame = 0;
        shooter.aniState = shooter.prevAniState;
    }

    if(shooter.aniState != IDLE){
        shooter.aniCounter++;
    }
}


void movePBullets(int tutLevel){
    if(which == 1){
        if(BUTTON_PRESSED(BUTTON_A)){
            for(int i = 0; i<bulletCount; i++){
                if(!pBullets[i].active){
                    if(shooter.direction == S_RIGHT){
                        pBullets[i].cdel = 1;
                        pBullets[i].rdel = 0;
                        pBullets[i].direction = bullet_h;
                        pBullets[i].screenRow = shooter.screenRow + 3;
                        pBullets[i].screenCol = shooter.screenCol + 8;
                    }
                    if(shooter.direction == S_LEFT){
                        pBullets[i].cdel = -1;
                        pBullets[i].rdel = 0;
                        pBullets[i].direction = bullet_h;
                        pBullets[i].screenRow = shooter.screenRow + 3;
                        pBullets[i].screenCol = shooter.screenCol + 2;
                    }
                    if(shooter.direction == S_UP){
                        pBullets[i].rdel = -1;
                        pBullets[i].cdel = 0;
                        pBullets[i].direction = bullet_v;
                        pBullets[i].screenRow = shooter.screenRow + 3;
                        pBullets[i].screenCol = shooter.screenCol + 8;
                    }
                    if(shooter.direction == S_DOWN){
                        pBullets[i].rdel = 1;
                        pBullets[i].cdel = 0;
                        pBullets[i].direction = bullet_v;
                        pBullets[i].screenRow = shooter.screenRow + 3;
                        pBullets[i].screenCol = shooter.screenCol + 2;
                    }
                   
                    pBullets[i].active = 1;
                    
                    break;
                }
            }
        }
    }

    //when active move it

    for(int i = 0; i<bulletCount; i++){
        if(pBullets[i].active){
            if(pBullets[i].cdel > 0){//if right
                //pBullets[i].screenCol+=1;
                if(tutLevel == 6){
                    pBullets[i].screenCol += 1;
                    if(pBullets[i].screenCol == 240){
                        pBullets[i].active = 0;
                    }
                }else if(tutLevel == 10){
                         if(pBullets[i].screenCol != 240 && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol, 256)] == 0 
                        && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width/2, 256)] == 0 
                        && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width, 256)] == 0){
                        pBullets[i].screenCol += 1;
                        
                    }else{
                        pBullets[i].active = 0;
                    } 
                }else{
                       if(pBullets[i].screenCol != 240 && !collisionMapBitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol, 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width/2, 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width, 256)] == 0){
                        pBullets[i].screenCol += 1;
                        
                    }else{
                        pBullets[i].active = 0;
                    } 
                }
                
            }
            if(pBullets[i].cdel < 0){//if left
                //pBullets[i].screenCol-=1;
                if(tutLevel == 6){
                    pBullets[i].screenCol -= 1;
                    if(pBullets[i].screenCol == 0 - pBullets[i].width){
                        pBullets[i].active = 0;
                    }
                }else if(tutLevel == 10){
                     if(pBullets[i].screenCol != 0 && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol , 256)] == 0
                        && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height/2, pBullets[i].screenCol , 256)] == 0 
                        && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height -1, pBullets[i].screenCol  , 256)] == 0){
                        //pBullets[i].active = 0;
                        pBullets[i].screenCol-=1;
                    }else{
                        pBullets[i].active = 0;
                    }
                }else{
                        if(pBullets[i].screenCol != 0 && !collisionMapBitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol , 256)] == 0
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height/2, pBullets[i].screenCol , 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height -1, pBullets[i].screenCol  , 256)] == 0){
                        //pBullets[i].active = 0;
                        pBullets[i].screenCol-=1;
                    }else{
                        pBullets[i].active = 0;
                    }
                }
                
            }
            if(pBullets[i].rdel > 0){//if down
                //pBullets[i].screenRow+=1;
                if(tutLevel == 6){
                    pBullets[i].screenRow+=1;
                    if(pBullets[i].screenRow == 160){
                        pBullets[i].active = 0;
                    }

                }else if(tutLevel == 10){
                    if(pBullets[i].screenRow != 160 && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol , 256)] == 0 
                    && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol + pBullets[i].width/2 , 256)] == 0
                    && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol + pBullets[i].width , 256)] == 0){   //pBullets[i].active = 0;
                        pBullets[i].screenRow+=1;
                    }else{
                        pBullets[i].active = 0;
                    }
                }else{
                        if(pBullets[i].screenRow != 160 && !collisionMapBitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol , 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol + pBullets[i].width/2 , 256)] == 0
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow + pBullets[i].height , pBullets[i].screenCol + pBullets[i].width , 256)] == 0){   //pBullets[i].active = 0;
                        pBullets[i].screenRow+=1;
                    }else{
                        pBullets[i].active = 0;
                    }
                }
                
            }
            if(pBullets[i].rdel < 0 ){//if up
                // pBullets[i].screenRow-=1;
                if(tutLevel == 6){
                    pBullets[i].screenRow-=1;
                    if(pBullets[i].screenRow == 0){
                        pBullets[i].active = 0;
                    }
                }else if(tutLevel == 10){
                    if(pBullets[i].screenRow != 0 && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow , pBullets[i].screenCol, 256)] == 0 
                    && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width/2, 256)] == 0 
                    && !collisionMap2Bitmap[OFFSET(pBullets[i].screenRow , pBullets[i].screenCol + pBullets[i].width , 256)] == 0){
                        //pBullets[i].active = 0;
                        pBullets[i].screenRow-=1;
                       
                    }else{
                        pBullets[i].active = 0;
                    }
                }else{
                        if(pBullets[i].screenRow != 0 && !collisionMapBitmap[OFFSET(pBullets[i].screenRow , pBullets[i].screenCol, 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow, pBullets[i].screenCol + pBullets[i].width/2, 256)] == 0 
                    && !collisionMapBitmap[OFFSET(pBullets[i].screenRow , pBullets[i].screenCol + pBullets[i].width , 256)] == 0){
                        //pBullets[i].active = 0;
                        pBullets[i].screenRow-=1;
                       
                    }else{
                        pBullets[i].active = 0;
                    }
                 }
             }
                
        }
    }

    //if active check collision
    for(int i = 0; i<bulletCount; i++){
        if(pBullets[i].active){
            if(tutLevel != 6){
                    if(orb1.active){
                        if(pBullets[i].screenCol < orb1.screenCol + orb1.width - 1 &&
                            pBullets[i].screenCol + pBullets[i].width -1 > orb1.screenCol &&
                            pBullets[i].screenRow < orb1.screenRow + orb1.height -1  &&
                            pBullets[i].screenRow + pBullets[i].height - 1> orb1.screenRow){

                            orb1.lives--;
                            if(orb1.lives == 0){
                                orb1.active = 0;
                                playSoundB(DestroySfx, DESTROYSFXLEN, DESTROYSFXFREQ, 0);
                            }
                            pBullets[i].active = 0;
                    }
                }
            }
            
                
            if(orb2.active){
                if(pBullets[i].screenCol < orb2.screenCol + orb2.width - 1 &&
                    pBullets[i].screenCol + pBullets[i].width - 1> orb2.screenCol &&
                    pBullets[i].screenRow < orb2.screenRow + orb2.height -1  &&
                    pBullets[i].screenRow + pBullets[i].height - 1 > orb2.screenRow){

                    orb2.lives--;
                    if(orb2.lives == 0){
                        orb2.active = 0;
                        playSoundB(DestroySfx, DESTROYSFXLEN, DESTROYSFXFREQ, 0);
                    }
                    pBullets[i].active = 0;
                }
            }
                
        }

    }
}


void moveTBullets(){
    if(!(++time % timeToNextTBullet)){

        for(int i = 0; i< 7; i++){
            if(!tBullets[i].active){
                tBullets[i].screenCol = 0;
                tBullets[i].screenRow = 0;
                tBullets[i].cdel = -1;
                tBullets[i].direction = tbullet_v;
                // breakpoint();
                break;
            }
        }
        for(int i = 7; i < 14; i++){
            if(!tBullets[i].active){
                
                tBullets[i].screenCol = 210;
                tBullets[i].screenRow = 61;
                tBullets[i].cdel = -1;
                tBullets[i].direction = tbullet_h;
                tBullets[i].active = 1;
            
                break;
            }
        }
        for(int i = 14; i < 21; i++){
            if(!tBullets[i].active){
               
                tBullets[i].screenCol = 161;
                tBullets[i].screenRow = 85;
                tBullets[i].cdel = 1;
                tBullets[i].direction = tbullet_h;
                 tBullets[i].active = 1;
                 // breakpoint();
                //timeToNextTBullet = rand()%25 + 56;
                break;
            }
        }
        for(int i = 21; i < 28; i++){
            if(!tBullets[i].active){
               
                tBullets[i].screenCol = 65;
                tBullets[i].screenRow = 71;
                tBullets[i].cdel = -1;
                tBullets[i].direction = tbullet_h;
                 tBullets[i].active = 1;
                //timeToNextTBullet = rand()%25 + 56;
                 // breakpoint();
                break;
            }
        }
        for(int i = 28; i < 35; i++){
            if(!tBullets[i].active){
                
                tBullets[i].screenCol = 61;
                tBullets[i].screenRow = 18;
                tBullets[i].rdel = 1;
                tBullets[i].direction = tbullet_v;
                tBullets[i].active = 1;
                //timeToNextTBullet = rand()%25 + 56;
                // breakpoint();
                break;
            }
        }
        timeToNextTBullet = rand()%25 + 125;
    }



    for(int i = 7; i < tBulletCount; i++){
        if(tBullets[i].active){
            tBullets[i].screenCol += tBullets[i].cdel;

            if(i >= 7 && i <= 14){
                if(tBullets[i].screenCol == 153){
                    tBullets[i].active = 0;
                }
            }

            if(tBullets[i].screenCol == 5 || tBullets[i].screenCol == 230 || playerBulletCollision(tBullets[i].screenRow, tBullets[i].screenCol, tBullets[i].width, tBullets[i].height, 
                fighter.screenCol, fighter.screenRow, fighter.width, fighter.height)){
                tBullets[i].active = 0;
            }
            tBullets[i].screenRow += tBullets[i].rdel;
            if(tBullets[i].screenRow == 5 || tBullets[i].screenRow == 150 || playerBulletCollision(tBullets[i].screenRow, tBullets[i].screenCol, tBullets[i].width, tBullets[i].height, 
                shooter.screenCol, shooter.screenRow, shooter.width, shooter.height)){
                tBullets[i].active = 0;
            }
        }
    }
}

void moveT2Bullets(){
    if(!(++time % timeToNextTBullet)){

        for(int i = 0; i< 7; i++){
            if(!tBullets[i].active){
                tBullets[i].screenCol = 0;
                tBullets[i].screenRow = 0;
                tBullets[i].cdel = -1;
                tBullets[i].direction = tbullet_v;

                break;
            }
        }
        for(int i = 7; i < 14; i++){
            if(!tBullets[i].active){
                
                tBullets[i].screenCol = 232;
                tBullets[i].screenRow = 140;
                tBullets[i].cdel = -1;
                tBullets[i].direction = tbullet_h;
                tBullets[i].active = 1;

                break;
            }
        }
        for(int i = 14; i < 21; i++){
            if(!tBullets[i].active){
               
                tBullets[i].screenCol = 169;
                tBullets[i].screenRow = 10;
                tBullets[i].rdel = 1;
                tBullets[i].direction = tbullet_v;
                 tBullets[i].active = 1;

                //timeToNextTBullet = rand()%25 + 56;
                break;
            }
        }
        for(int i = 21; i < 28; i++){
            if(!tBullets[i].active){
               
                tBullets[i].screenCol = 5;
                tBullets[i].screenRow = 80;
                tBullets[i].rdel = 1;
                tBullets[i].direction = tbullet_v;
                 tBullets[i].active = 1;
                //timeToNextTBullet = rand()%25 + 56;
                break;
            }
        }
        for(int i = 28; i < 35; i++){
            if(!tBullets[i].active){
                
                tBullets[i].screenCol = 5;
                tBullets[i].screenRow = 110;
                tBullets[i].cdel = 1;
                tBullets[i].direction = tbullet_h;
                tBullets[i].active = 1;
                //timeToNextTBullet = rand()%25 + 56;
                break;
            }
        }
        timeToNextTBullet = rand()%25 + 125;
    }



    for(int i = 7; i < tBulletCount; i++){
        if(tBullets[i].active){
            tBullets[i].screenCol += tBullets[i].cdel;

            if(i >= 7 && i < 14){
                if(tBullets[i].screenCol == 140){
                    tBullets[i].active = 0;
                }
            }

            if(i >= 14 && i < 28){
                if(tBullets[i].screenRow == 82){
                    tBullets[i].active = 0;
                }
            }


            if(i >= 28 && i < 35){
                if(tBullets[i].screenCol == 75){
                    tBullets[i].active = 0;
                }
            }

            if(tBullets[i].screenCol == 5 || tBullets[i].screenCol == 230 || playerBulletCollision(tBullets[i].screenRow, tBullets[i].screenCol, tBullets[i].width, tBullets[i].height, 
                fighter.screenCol, fighter.screenRow, fighter.width, fighter.height)){
                tBullets[i].active = 0;
            }
            tBullets[i].screenRow += tBullets[i].rdel;
            if(tBullets[i].screenRow == 5 || tBullets[i].screenRow == 150 || playerBulletCollision(tBullets[i].screenRow, tBullets[i].screenCol, tBullets[i].width, tBullets[i].height, 
                shooter.screenCol, shooter.screenRow, shooter.width, shooter.height)){
                tBullets[i].active = 0;
            }
        }
    }
}

//move the orb based ond direciton and current state
void moveOrb1(){
    if(orb1.direction == E_RIGHT){
        orb1.screenCol += orb1.cdel;
    }else if(orb1.direction == E_UP){
        orb1.screenRow -= orb1.rdel;
    }else if(orb1.direction == E_LEFT){
        orb1.screenCol -= orb1.cdel;
    }else if(orb1.direction == E_DOWN){
        orb1.screenRow += orb1.rdel;
    }


//4 different states for bouncing
    if(orb1.stateCount % 30 == 0){
        orb1.state++;
        orb1.state %= 4;
    }
    if(orb1.screenCol <= 60 && orb1.screenRow > 130 && orb1.direction == E_DOWN){
        orb1.screenCol = 60;
        orb1.screenRow = 130;
        orb1.direction = E_RIGHT;
    }
    if(orb1.screenCol > 160 && orb1.screenRow >= 130 && orb1.direction == E_RIGHT){
        orb1.screenCol = 160;
        orb1.screenRow = 130;
        orb1.direction = E_UP;
    }
    if(orb1.screenCol >= 160 && orb1.screenRow < 100 && orb1.direction == E_UP){
        orb1.screenCol = 160;
        orb1.screenRow = 100;
        orb1.direction = E_LEFT;
    }
    if(orb1.screenCol < 60 && orb1.screenRow <= 100 && orb1.direction == E_LEFT){
        orb1.screenCol = 60;
        orb1.screenRow = 100;
        orb1.direction = E_DOWN;
    }
    if(orb1.active){
       playerObjectCollision(orb1.screenRow, orb1.screenCol, orb1.width, orb1.height, 
        fighter.screenRow, fighter.screenCol, fighter.width, fighter.height);
       playerObjectCollision(orb1.screenRow, orb1.screenCol, orb1.width, orb1.height, 
        shooter.screenRow, shooter.screenCol, shooter.width, shooter.height);
     
    }
   

}
//same for orb 2
void moveOrb2(){
    if(orb2.direction == E_RIGHT){
        orb2.screenCol += orb2.cdel;
    }else if(orb2.direction == E_LEFT){
        orb2.screenCol -= orb2.cdel;
    }
    

    if(orb2.stateCount % 30 == 0){
      
        orb2.state++;
        orb2.state %= 4;
    }

    if(orb2.screenCol < 150){
        orb2.screenCol = 150;
        orb2.direction = E_RIGHT;
    }
    if(orb2.screenCol > 200){
        orb2.screenCol = 200;
        orb2.direction = E_LEFT;
    }
    if(orb2.active){
        playerObjectCollision(orb2.screenRow, orb2.screenCol, orb2.width, orb2.height, 
            fighter.screenRow, fighter.screenCol, fighter.width, fighter.height);
        playerObjectCollision(orb2.screenRow, orb2.screenCol, orb2.width, orb2.height, 
            shooter.screenRow, shooter.screenCol, shooter.width, shooter.height);
        
    }
    

}

void moveBlock(){
    if(block.screenCol < fighter.screenCol + fighter.width - 2 &&
        block.screenCol + block.width > fighter.screenCol &&
        block.screenRow < fighter.screenRow + fighter.height - 2 &&
        block.screenRow + block.height > fighter.screenRow ){

            withBlock = 1;
            dontPunch = 1;
            ifAttack = 0;
            if(fighter.direction == F_RIGHT){
                if(withBlock == 1){
                    fighter.width = 18;
                }
                
                if(!collisionMapBitmap[OFFSET(block.screenRow + 3, block.screenCol + block.width - 1, 256)] == 0
                && !collisionMapBitmap[OFFSET(block.screenRow -1  + block.height/2, block.screenCol + block.width - 1 , 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow - 4 + block.height, block.screenCol + block.width  - 1, 256)] == 0)
                {


                    block.screenCol++;
                }else{
                    
                    fighter.screenCol--;
                }

            }else if(fighter.direction == F_LEFT){
                if(withBlock == 1){
                    block.width = 10;
                }
               
                if(!collisionMapBitmap[OFFSET(block.screenRow + 3, block.screenCol + 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow - 1 + block.height/2, block.screenCol + 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow - 4 + block.height , block.screenCol + 1, 256)] == 0)
                { block.screenCol--;
                }else{
                    
                    fighter.screenCol++;

                }
            }else if(fighter.direction == F_UP){
                if(!collisionMapBitmap[OFFSET(block.screenRow + 1, block.screenCol + 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width/2 - 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width - 1 , 256)] == 0)
                {block.screenRow--;
                }else{
                   
                    fighter.screenRow++;
                }
            }else{
                if(!collisionMapBitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + 1, 256)] == 0 
                && !collisionMapBitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width/2 - 1, 256)] == 0
                && !collisionMapBitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width - 1, 256)] == 0)
                {block.screenRow++;
                }else{
                    
                    fighter.screenRow--;
                }
            }

    }else{
        dontPunch = 0;

    }

     if(block.screenCol < button.screenCol + button.width &&
        block.screenCol + block.width > button.screenCol &&
        block.screenRow < button.screenRow + button.height &&
        block.screenRow + button.height > button.screenRow ){

            button.active = 1;
            doorA.active = 1;
            doorA.width = 4;
            
           if(which == 0 && blueDoorOpened == 0){
                playSoundB(DoorSfx, DOORSFXLEN, DOORSFXFREQ, 0);
                blueDoorOpened = 1;
            }


     }


}

void moveBlockTut4(){
    if(block.screenCol < fighter.screenCol + fighter.width - 2 &&
        block.screenCol + block.width > fighter.screenCol &&
        block.screenRow < fighter.screenRow + fighter.height - 2 &&
        block.screenRow + block.height > fighter.screenRow ){

            withBlock = 1;
            dontPunch = 1;
            ifAttack = 0;
            if(fighter.direction == F_RIGHT){
                if(withBlock == 1){
                    fighter.width = 15;
                }
                
                if(!collisionMapTut4Bitmap[OFFSET(block.screenRow + 3, block.screenCol + block.width - 1, 256)] == 0
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow -1  + block.height/2, block.screenCol + block.width - 1 , 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow - 4 + block.height, block.screenCol + block.width  - 1, 256)] == 0)
                {


                    block.screenCol++;
                }else{
                    
                    fighter.screenCol--;
                }

            }else if(fighter.direction == F_LEFT){
                if(withBlock == 1){
                    block.width = 10;
                }
               
                if(!collisionMapTut4Bitmap[OFFSET(block.screenRow + 3, block.screenCol + 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow - 1 + block.height/2, block.screenCol + 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow - 4 + block.height , block.screenCol + 1, 256)] == 0)
                { block.screenCol--;
                }else{
                    
                    fighter.screenCol++;

                }
            }else if(fighter.direction == F_UP){
                if(!collisionMapTut4Bitmap[OFFSET(block.screenRow + 1, block.screenCol + 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width/2 - 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width - 1 , 256)] == 0)
                {block.screenRow--;
                }else{
                   
                    fighter.screenRow++;
                }
            }else{
                if(!collisionMapTut4Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + 1, 256)] == 0 
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width/2 - 1, 256)] == 0
                && !collisionMapTut4Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width - 1, 256)] == 0)
                {block.screenRow++;
                }else{
                    
                    fighter.screenRow--;
                }
            }

    }else{
        dontPunch = 0;

    }

     if(block.screenCol < button.screenCol + button.width &&
        block.screenCol + block.width > button.screenCol &&
        block.screenRow < button.screenRow + button.height &&
        block.screenRow + button.height > button.screenRow ){

            button.active = 1;
            doorA.active = 1;
            doorA.width = 4;
            
           if(which == 0 && blueDoorOpened == 0){
                playSoundB(DoorSfx, DOORSFXLEN, DOORSFXFREQ, 0);
                blueDoorOpened = 1;
            }
      }      
}

void moveBlockGame2(){
    if(block.screenCol < fighter.screenCol + fighter.width - 2 &&
        block.screenCol + block.width > fighter.screenCol &&
        block.screenRow < fighter.screenRow + fighter.height - 2 &&
        block.screenRow + block.height > fighter.screenRow ){

            withBlock = 1;
            dontPunch = 1;
            ifAttack = 0;
            if(fighter.direction == F_RIGHT){
                if(withBlock == 1){
                    fighter.width = 18;
                }
                
                if(!collisionMap2Bitmap[OFFSET(block.screenRow + 3, block.screenCol + block.width - 1, 256)] == 0
                && !collisionMap2Bitmap[OFFSET(block.screenRow -1  + block.height/2, block.screenCol + block.width - 1 , 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow - 4 + block.height, block.screenCol + block.width  - 1, 256)] == 0)
                {


                    block.screenCol++;
                }else{
                    
                    fighter.screenCol--;
                }

            }else if(fighter.direction == F_LEFT){
                if(withBlock == 1){
                    block.width = 10;
                }
               
                if(!collisionMap2Bitmap[OFFSET(block.screenRow + 3, block.screenCol + 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow - 1 + block.height/2, block.screenCol + 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow - 4 + block.height , block.screenCol + 1, 256)] == 0)
                { block.screenCol--;
                }else{
                    
                    fighter.screenCol++;

                }
            }else if(fighter.direction == F_UP){
                if(!collisionMap2Bitmap[OFFSET(block.screenRow + 1, block.screenCol + 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width/2 - 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow + 1, block.screenCol + block.width - 1 , 256)] == 0)
                {block.screenRow--;
                }else{
                   
                    fighter.screenRow++;
                }
            }else{
                if(!collisionMap2Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + 1, 256)] == 0 
                && !collisionMap2Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width/2 - 1, 256)] == 0
                && !collisionMap2Bitmap[OFFSET(block.screenRow + block.height - 2 , block.screenCol + block.width - 1, 256)] == 0)
                {block.screenRow++;
                }else{
                    
                    fighter.screenRow--;
                }
            }

    }else{
        dontPunch = 0;

    }

     if(block.screenCol < button.screenCol + button.width &&
        block.screenCol + block.width > button.screenCol &&
        block.screenRow < button.screenRow + button.height &&
        block.screenRow + button.height > button.screenRow ){

            button.active = 1;
            doorA.active = 1;
            doorA.width = 4;
            
           if(which == 0 && blueDoorOpened == 0){
                playSoundB(DoorSfx, DOORSFXLEN, DOORSFXFREQ, 0);
                blueDoorOpened = 1;
            }


     }
}

void moveOrb1Game2(){

}

void moveOrb2Game2(){

}

//before doors are open you can't pass them
void door1Collision(int tutLevel){
    if(doorA.screenCol < fighter.screenCol + fighter.width - 1&&
        doorA.screenCol + doorA.width -1 > fighter.screenCol &&
        doorA.screenRow < fighter.screenRow + fighter.height - 1 &&
        doorA.screenRow + doorA.height - 1> fighter.screenRow ){
            
            if(tutLevel == 4){
                fighter.screenRow--;
            }else{
                fighter.screenRow++;
            }
            

    }


    if(doorA.screenCol < shooter.screenCol + shooter.width - 1&&
        doorA.screenCol + doorA.width -1  > shooter.screenCol &&
        doorA.screenRow < shooter.screenRow + shooter.height - 1&&
        doorA.screenRow + doorA.height - 1> shooter.screenRow ){
        if(tutLevel == 4){
                shooter.screenRow--;
            }else{
                shooter.screenRow++;
            }
    }

    
}

void door2Collision(int tutLevel){
    if(doorExit.screenCol < fighter.screenCol + fighter.width -1  &&
        doorExit.screenCol + doorExit.width - 1> fighter.screenCol &&
        doorExit.screenRow < fighter.screenRow + fighter.height -1  &&
        doorExit.screenRow + doorExit.height - 1> fighter.screenRow ){
            
            if(tutLevel == 7){
                fighter.screenRow++;
        
            }else{
                fighter.screenRow--;
            }
        }
            

    if(doorExit.screenCol < shooter.screenCol + shooter.width - 1 &&
        doorExit.screenCol + doorExit.width - 1> shooter.screenCol &&
        doorExit.screenRow < shooter.screenRow + shooter.height -1  &&
        doorExit.screenRow + doorExit.height - 1> shooter.screenRow ){
        
            if(tutLevel == 7){
                shooter.screenRow++;
            }else{
                shooter.screenRow--;
            }
            
    }
}

void wallCollision(){
    if(wall.screenCol < fighter.screenCol + fighter.width - 1 &&
        wall.screenCol + wall.width - 1> fighter.screenCol &&
        wall.screenRow < fighter.screenRow + fighter.height -1 &&
        wall.screenRow + wall.height - 1> fighter.screenRow ){
            fighter.screenRow++;
            if(which == 0){
                wall.isHit = 1;
            }
        
            
    }
    if(wall.screenCol < shooter.screenCol + shooter.width - 1&&
        wall.screenCol + wall.width - 1> shooter.screenCol &&
        wall.screenRow < shooter.screenRow + shooter.height - 1&&
        wall.screenRow + wall.height - 1> shooter.screenRow ){
            shooter.screenRow++;
    }
    
}

void wall2Collision(){
    if(wall2.screenCol < fighter.screenCol + fighter.width  &&
        wall2.screenCol + wall2.width > fighter.screenCol &&
        wall2.screenRow < fighter.screenRow + fighter.height &&
        wall2.screenRow + wall2.height   > fighter.screenRow ){
            
            fighter.screenCol--;
          
            
            if(which == 0){
             wall2.isHit = 1;
            }
       
            
    }
    if(wall2.screenCol < shooter.screenCol + shooter.width &&
        wall2.screenCol + wall2.width > shooter.screenCol &&
        wall2.screenRow < shooter.screenRow + shooter.height &&
        wall2.screenRow + wall2.height > shooter.screenRow ){
          
         shooter.screenCol--;
            
    }
}

void chestCollision(){


    if(chest.screenCol < fighter.screenCol + fighter.width - 1 &&
        chest.screenCol + chest.width -1  > fighter.screenCol &&
        chest.screenRow < fighter.screenRow + fighter.height - 1&&
        chest.screenRow + chest.height - 1> fighter.screenRow){
            fighter.screenCol--;
        }

    if(chest.screenCol < shooter.screenCol + shooter.width -1 &&
        chest.screenCol + chest.width - 1> shooter.screenCol &&
        chest.screenRow < shooter.screenRow + shooter.height - 1 &&
        chest.screenRow + chest.height - 1> shooter.screenRow ){

            shooter.screenCol--;
            if(which == 1){
                chest.isHit = 1;
            }
            
    }
}

void leverCollision(){
     if(lever.screenCol < fighter.screenCol + fighter.width &&
        lever.screenCol + lever.width > fighter.screenCol &&
        lever.screenRow < fighter.screenRow + fighter.height &&
        lever.screenRow + lever.height > fighter.screenRow){
            fighter.screenCol++;
        }

    if(lever.screenCol < shooter.screenCol + shooter.width &&
        lever.screenCol + lever.width > shooter.screenCol &&
        lever.screenRow < shooter.screenRow + shooter.height &&
        lever.screenRow + lever.height > shooter.screenRow ){

            shooter.screenCol++;
            if(which == 1 && withKey == 1){
                lever.isHit = 1;
            }
            
    }
}

int playerBulletCollision(int bulletRow, int bulletCol, int bWidth, int bHeight, 
    int pCol, int pRow, int pWidth, int pHeight){


    
   if(bulletCol < pCol + pWidth - 1 &&
        bulletCol + bWidth - 1> pCol &&
        bulletRow < pRow + pHeight - 1 &&
        bulletRow + bHeight - 1 > pRow) {
            if(which == 1){
                shooter.lives--;
                playSoundB(DamageSfx, DAMAGESFXLEN, DAMAGESFXFREQ, 0);
                shooter.isHit = 1;
                
               
            }else{
                fighter.lives--;
                playSoundB(DamageSfx, DAMAGESFXLEN, DAMAGESFXFREQ, 0);
                fighter.isHit = 1;
              
              
            }
                
                return 1;
    }
    
      return 0;
    
}

int playerObjectCollision(int orbRow, int orbCol, int orbWidth, int orbHeight, int row, int col,int width, int height){
    //if(which == 1){
    if(orbCol < col + width -2 && 
        orbCol + orbWidth - 2 > col &&
        orbRow < row + height - 2 && 
        orbRow + orbHeight - 2 > row){

        if(which == 0){//shooter.lives-= 5;
            fighter.lives-=10;
        }else{
            shooter.lives-= 5;
        }
        
        return 1;
    }
    



    return 0;
}

int checkWin(){
    if(fighter.screenRow > 140 || shooter.screenRow > 140){
        return 1;
    }
    return 0;
}

int checkNoLives(){
    if(fighter.lives <= 0 || shooter.lives <= 0){
        return 1;
    }
    return 0;
}


void drawCharacters(){
   
    if(which == 1){
        drawShooter();
    }else{
        drawFighter();
    }

   


}

void drawEnemies(){
    drawOrb1();
    drawOrb2();
}

void drawObjects(){
    drawBlock();
    drawDoor1();
    drawDoor2();
    drawWall();
    drawWall2();
    drawChest();
    drawLever();
    drawButton();

}

void drawBullets(){
    drawPBullets();
    drawTBullets();
}

void drawFighter(){
    
    shadowOAM[1].attr0 = ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr0 = (ROWMASK & fighter.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = ATTR1_SIZE16 | (COLMASK & (fighter.screenCol + 2));
    if(ifAttack == 1){
        shadowOAM[0].attr2 = SPRITEOFFSET16(F_ATTACK,fighter.aniState*2);
        waitForVblank();
        ifAttack = 0;


    }else if(withBlock == 1){
        shadowOAM[0].attr2 = SPRITEOFFSET16((6 + fighter.currFrame*2),fighter.aniState*2);
        withBlock = 0;
        fighter.width = 11;
        fighter.height = 15;
        shooter.width = 8;
        shooter.height = 16;
        
    }else {
        shadowOAM[0].attr2 = SPRITEOFFSET16(fighter.currFrame*2,fighter.aniState*2);
    }

}

void drawShooter(){
   
    shadowOAM[0].attr0 = ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr0 = (ROWMASK & shooter.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[1].attr1 = ATTR1_SIZE16 | (COLMASK & (shooter.screenCol+2));

    if(ifAttack == 1){
        shadowOAM[1].attr2 = SPRITEOFFSET16(S_ATTACK,shooter.aniState*2);
        waitForVblank();
        ifAttack = 0;
        
    }else if(ifOpenChest == 1){
        shadowOAM[1].attr2 = SPRITEOFFSET16(S_HACK,shooter.aniState*2);
        waitForVblank();
        ifOpenChest = 0;
        
    }else{
        shadowOAM[1].attr2 = SPRITEOFFSET16(14 + (shooter.currFrame*2),shooter.aniState*2);
    }
    
}

void drawOrb1(){
    shadowOAM[2].attr0 = (ROWMASK & orb1.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[2].attr1 = ATTR1_SIZE16 | (COLMASK & (orb1.screenCol));
    
    if(!orb1.active){
        shadowOAM[2].attr2 = SPRITEOFFSET16(30,0);
    }else{
        shadowOAM[2].attr2 = SPRITEOFFSET16(orb_loc,orb1.state*2);
    }
}

void drawOrb2(){
    shadowOAM[3].attr0 = (ROWMASK & orb2.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[3].attr1 = ATTR1_SIZE16 | (COLMASK & (orb2.screenCol));
    if(!orb2.active){
        shadowOAM[3].attr2 = SPRITEOFFSET16(30,0);
    }else{
        shadowOAM[3].attr2 = SPRITEOFFSET16(orb_loc,orb2.state*2);
    }
}

//draw the player bullets
void drawPBullets(){
    for(int i = 0; i<bulletCount; i++){
        if(!pBullets[i].active){
            shadowOAM[4 + i].attr0 = ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[4 + i].attr1 = (COLMASK & pBullets[i].screenCol) |ATTR1_SIZE16;
            shadowOAM[4 + i].attr2 = SPRITEOFFSET16(bullet_loc,pBullets[i].direction);
        }
        else if(pBullets[i].active){
            shadowOAM[4 + i].attr0 = (ROWMASK & pBullets[i].screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[4 + i].attr1 = (COLMASK & pBullets[i].screenCol) | ATTR1_SIZE16;

            shadowOAM[4 + i].attr2 = SPRITEOFFSET16(bullet_loc,pBullets[i].direction);
        }
            
    }
}

void drawTBullets(){
     for(int i = 0; i<tBulletCount; i++){
        if(!tBullets[i].active){
            shadowOAM[9 + i].attr0 = ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[9 + i].attr1 = (COLMASK & tBullets[i].screenCol) | ATTR1_SIZE16;
            shadowOAM[9 + i].attr2 = SPRITEOFFSET16(bullet_loc,tBullets[i].direction);
        }
        else if(tBullets[i].active){
            shadowOAM[9 + i].attr0 = (ROWMASK & tBullets[i].screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[9 + i].attr1 = (COLMASK & tBullets[i].screenCol) | ATTR1_SIZE16;

            shadowOAM[9 + i].attr2 = SPRITEOFFSET16(bullet_loc,tBullets[i].direction);
        }
            
    }
}

void drawBlock(){
    shadowOAM[46].attr0 = (ROWMASK & block.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[46].attr1 = ATTR1_SIZE16 | (COLMASK & (block.screenCol));
    shadowOAM[46].attr2 = SPRITEOFFSET16(blockButton_loc,blockloc);


}

void drawDoor1(){
    shadowOAM[47].attr0 = (ROWMASK & doorA.screenRow) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[47].attr1 = ATTR1_SIZE16|  (COLMASK & (doorA.screenCol));
    if(doorA.active == 1){
        shadowOAM[47].attr2 = SPRITEOFFSET16(doorOpenRow,doorAloc);
    }else{
        shadowOAM[47].attr2 = SPRITEOFFSET16(doorClosedRow,doorAloc);
    }

}

void drawDoor2(){
    shadowOAM[48].attr0 = (ROWMASK & doorExit.screenRow) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[48].attr1 = ATTR1_SIZE16| (COLMASK & (doorExit.screenCol));
    
    if(doorExit.active == 1){
       shadowOAM[48].attr2 = SPRITEOFFSET16(doorOpenRow,doorExitloc); 
    }else{
        shadowOAM[48].attr2 = SPRITEOFFSET16(doorClosedRow,doorExitloc);
    }
}

void drawWall(){
    shadowOAM[49].attr0 = (ROWMASK & wall.screenRow) | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[49].attr1 = ATTR1_SIZE16| (COLMASK & (wall.screenCol));
   
    if(wall.active == 1){
         shadowOAM[49].attr2 = SPRITEOFFSET16(doorOpenRow ,wallDown);
    }
    if(!wall.active){
        shadowOAM[49].attr2 = SPRITEOFFSET16(doorClosedRow,wallOK);
    }
   
    

}

void drawWall2(){
    if(wall2.active == 1){
         shadowOAM[50].attr2 = SPRITEOFFSET16(doorOpenRow ,wallTwoDown);
    }
    if(!wall2.active){
        shadowOAM[50].attr2 = SPRITEOFFSET16(doorClosedRow,wallTwoOk);
    }

    shadowOAM[50].attr0 = (ROWMASK & wall2.screenRow) | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[50].attr1 = ATTR1_SIZE16| (COLMASK & (wall2.screenCol));
}

void drawChest(){
    shadowOAM[51].attr0 = (ROWMASK & chest.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[51].attr1 = ATTR1_SIZE16| (COLMASK & (chest.screenCol));

    if(chest.active == 1){
        shadowOAM[51].attr2 = SPRITEOFFSET16(onOffObjectLoc,chestOpen);
    }else{
        shadowOAM[51].attr2 = SPRITEOFFSET16(onOffObjectLoc,chestClosed);
    }
    

}

void drawLever(){
    shadowOAM[52].attr0 = (ROWMASK & lever.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[52].attr1 = ATTR1_SIZE16| (COLMASK & (lever.screenCol));
    
    if(lever.active == 1 && chest.active == 1){
        shadowOAM[52].attr2 = SPRITEOFFSET16(onOffObjectLoc,leverOn);
    }else{
        shadowOAM[52].attr2 = SPRITEOFFSET16(onOffObjectLoc,leverOff);
    }

}

void drawButton(){
    shadowOAM[53].attr0 = (ROWMASK & button.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[53].attr1 = ATTR1_SIZE16| (COLMASK & (button.screenCol));

    if(button.active == 1){
        shadowOAM[53].attr2 = SPRITEOFFSET16(blockButton_loc,buttonDown);

    }else{
        shadowOAM[53].attr2 = SPRITEOFFSET16(blockButton_loc,buttonUp);
    }
    
}

void updateLives(){
    if(which == 0){
        shadowOAM[54].attr0 = (ROWMASK & livesNum.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[54].attr1 = ATTR1_SIZE16| (COLMASK & (livesNum.screenCol));
        shadowOAM[54].attr2 = SPRITEOFFSET16(20, (14 - fighter.lives)*2);

    }
    if(which == 1){
        shadowOAM[54].attr0 = (ROWMASK & livesNum.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[54].attr1 = ATTR1_SIZE16| (COLMASK & (livesNum.screenCol));
        shadowOAM[54].attr2 = SPRITEOFFSET16(22,(14 - shooter.lives)*2);

    }
        
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
    
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;

        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.loops = loops;
        soundB.isPlaying = 1;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.vbCount = 0;
        
}

