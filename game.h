typedef struct {
	int row;
	int col;
    int rdel;
	int width;
    int height;
    int active;
    int spriteSheetCol;
    int character;
    int curFrame;
    int numFrames;
    int aniCounter;
    int talking;
    int palleteRow;
    int curPalette;
    int invis;
    int invisPaletteRow;
    int invisCount;
} PLAYER;

typedef struct {
	int row;
	int col;
    int cdel;

    //does this character move
    //int mover;
	int width;
    int height;
    int active;
    int spriteSheetCol;

    //which character
    int type;
    int curFrame;
    int numFrames;
    int aniCounter;
    //int walking;
    int palleteRow;
    int helpAnimate;
    int helpAnimateTimer;
    int helpAnimateStop;

    //skipped by player
    int skipped;

    int justTalked;
    int trolleyCollision;

    int afterTalkFrame;
} FRIEND;

typedef struct {
	int row;
	int col;
    int cdel;
	int width;
    int height;
    int full;
    int spriteSheetRow;
    int spriteSheetCol;
    int passed;
    int type;
    int curFrame;
    int numFrames;
    int aniCounter;
    int walking;
    int palleteRow;
} DISTANCE;

typedef struct {
	int row;
	int col;
	int width;
    int height;
    int active;
    int spriteSheetRow;
    int character;
    int curFrame;
    int numFrames;
    int aniCounter;
    int full;
    int currentFill;
    int walking;
    int palleteRow;
} FOODBAR;

typedef struct {
	int row;
	int col;
	int width;
    int height;
    int active;
    int spriteSheetRow;
    int palleteRow;
} FRIENDLY;

typedef struct {
	int row;
	int col;
	int rdel;
	int width;
    int height;
    int active;
    int spriteSheetRow;
    int spriteSheetCol;
    int curFrame;
    int numFrames;
    int aniCounter;
    int palleteRow;
} TROLLEY;

typedef struct {
    int row;
    int col;
    int width;
    int height;
    int active;
    int spriteSheetRow;
    int spriteSheetCol;
    int curFrame;
    int numFrames;
    int aniCounter;
    int palleteRow;
} CLOCK;

typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int active;
    int spriteSheetCol;
    int spriteSheetRow;
    int character;
    int curFrame;
    int numFrames;
    int aniCounter;
    int talking;
    int palleteRow;
} INVIS;



//Keeps the total number of each type of sprite
#define PLAYERCNT 1
#define FRIENDCNT 7 //max 7
#define DISTANCECNT 10
#define FOODBARCNT 1
#define FRIENDLYCNT 5
#define TROLLEYCNT 1
#define CLOCKCNT 1
#define INVISCNT 5

//Macros to keep track of where in the OAM each of the sprite types can be found
#define PLAYER_OAM 0
#define FRIEND_OAM 1 //7
#define DISTANCE_OAM 8 //18
#define FOODBAR_OAM 19
#define FRIENDLY_OAM 20 //
#define TROLLEY_OAM 25
#define CLOCK_OAM 26
#define INVIS_OAM 27

//Arrays that hold the different sprite types
extern FRIEND friends[FRIENDCNT];
extern DISTANCE distance[DISTANCECNT];
extern FRIENDLY friendly[FRIENDLYCNT];
extern PLAYER player;
extern CLOCK clock;
extern INVIS invis[INVISCNT];
extern TROLLEY trolley;

extern int friendlyCurrCount;
extern int foodCurrCount;
extern int numActiveFriends;
extern int removeClockTime;

//Vars to end game
extern int endGame;
extern int winGame;

//REMOVEEEEE
extern int walkBegin; //36
extern int walkEnd; //160 - 16

extern int characterSelected;


extern int foodMarker;

extern int randRow;

extern int currActiveChar;

extern int makeMeActive;

extern int randCounter;
extern int randTime;
extern int randFri;

extern int distanceCounter;
extern int distanceFull;

extern int currTalking;

extern int friendMarker;

extern int invisRandTime;

extern int playerOn;
//int trolleyOn;

extern int trolleyCounter;

extern int trolleyClashing;
extern int trolleyColliding;

extern int distanceTracker;

//Prototypes
void initGame();
void updateGame();
void drawGame();

void initMainPlayer();
void updateMainPlayer();

void initOtherPlayer();
void updateOtherPlayer();

void initDistance();
void updateDistance();

void initFriendBar();
void updateFriendBar();

void initTrolley();
void updateTrolley();

void initClock();
void updateClock();

void initInvis();
void updateInvis();