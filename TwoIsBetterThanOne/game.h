#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)


typedef struct{
	const unsigned char* data;
	int length;
	int frequency;
	int isPlaying;
	int loops;
	int duration;
	int priority;
	int vbCount;
}SOUND;

SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

typedef struct
{
	int screenRow;
	int screenCol;
	int height;
	int width;
	int rdel; 
	int cdel;
	int aniCounter;
	int aniState;
	int prevAniState;
	int currFrame;
	int direction;
	int lives;
	int isHit;
} PLAYER;

typedef struct 
{
	int screenRow;
	int screenCol;
	int width;
	int height;
	int size;
	int rdel; 
	int cdel;
	int direction;
	int state;
	int stateCount;
	int lives;
	int active;
	int isHit;
} ENEMY;

typedef struct 
{
	int screenRow;
	int screenCol;
	int cdel;
	int rdel; 
	int direction;
	int width; 
	int height;
	int active;
} BULLET;

typedef struct 
{
	int screenRow;
	int screenCol;
	int cdel;
	int rdel;
	int width;
	int height;
	int active;
	int isHit;
} OBJECT;

//main.c prototypes
void hideSprites();
void copyShadowOAM();

void gameFunctions();

void actPlayers(int);
void moveBullets(int);
void moveEnemies(int);
void moveObjects(int);

void playerCollisions();
void enemyCollisions();

void drawCharacters();
void drawEnemies();
void drawBullets();
void drawObjects();

//game.c
void swapPlayers();

void actFighter();
void actionsFighter();
void actFighterWithBlock();
void actShooter();
void actionsShooter();
void moveFighter();
void moveShooter();
void moveOrb1();
void moveOrb2();
void movePBullets(int);
void moveTBullets();
void moveT2Bullets();
void moveBlock();
void moveBlockTut4();
void moveBlockGame2();
void moveOrb1Game2();
void moveOrb2Game2();

//tutorialprototypes
void actTut1Shooter();
void actTut1Fighter();
void moveTut1Shooter();
void moveTut1Fighter();
void moveTut3Fighter();
void moveTut4Fighter();
void moveTut7Shooter();
void moveGame2Shooter();
void moveGame2Fighter();


int playerEnemyCollision();
int playerObjectCollision(int, int, int, int, int, int, int, int);
int playerBulletCollision(int, int, int, int, int, int, int, int);
int enemyBulletCollision();
void door1Collision(int);
void door2Collision(int);
void wallCollision();
void blockCollision();
void chestCollision();
void leverCollision();
void wall2Collision();


int genericCollision(int colA, int rowA, int heightA, int widthA, int colB, int rowB, int heightB, int widthB);

int checkNoLives();
int checkWin();

void drawFighter();
void drawShooter();
void drawPBullets();
void drawOrb1();
void drawOrb2();
void drawTBullets();
void drawBlock();
void drawChest();
void drawDoor1();
void drawDoor2();
void drawWall();
void drawWall2();
void drawLever();
void drawButton();
void updateLives();



