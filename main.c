/*
I have most of the game play done - I have the friendliness bar and the timer up. The exception is the fruits

Bugs:

I'm having trouble with the fruits - theyre initated and all but I'm having trouble having them come 
randomly from the right while also not colliding with the friends
Another bug - when the game starts three friends start coming (I want it so that they come in intervals)

So the game works such that:
if you stop infront of the friends - you dont lose a friendliness count
Also there is a timer running
If you lose all the friendliness points you lose
if you make it to the end of the timer - YOU WIN
I have to work on the timing - its really off right now (not really fun to play)
Also artwork still needs to be done

*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "startScreen.h"
#include "instructScreen1.h"
#include "instructScreen2.h"
#include "instructScreen3.h"
#include "instructScreen4.h"
#include "instructScreen5.h"
#include "charScreen.h"
#include "loseScreen.h"
#include "winScreen.h"
#include "pauseScreen.h"
#include "gameBG1.h"
#include "gameBG2.h"
#include "game.h"
#include "spritesheet.h"
#include "sound.h"
#include "GameSong.h"
#include "ticking.h"
#include "titleSong.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();

void goToInstructions2();
void instructions2();

void goToInstructions3();
void instructions3();

void goToInstructions4();
void instructions4();

void goToInstructions5();
void instructions5();

void goToCharacter();
void character();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
void (*state)();

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

//background offset vars
int hOff = 0;
int vOff = 0;

//Number of frames before the h0ff increments
int hOffCounter = 3;

int characterSelected;

int main() {

    initialize();

    setupSounds();
    setupInterrupts();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        state();
               
    }
}

void initialize() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    buttons = BUTTONS;

    goToStart();
}

void goToStart() {

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    playSoundA(titleSong,TITLESONGLEN,TITLESONGFREQ, 1);

    drawFullscreenImage3(startScreenBitmap);

    waitForVBlank();

    state = start;
    seed = 0;
}

void start() {

    seed++;

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToCharacter();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        srand(seed);
        goToInstructions();
    }

}

void goToInstructions() {

    drawFullscreenImage3(instructScreen2Bitmap);

    waitForVBlank();

    state = instructions;
}

void instructions() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions2();
    }

}

void goToInstructions2() {

    drawFullscreenImage3(instructScreen1Bitmap);

    waitForVBlank();

    state = instructions2;
}

void instructions2() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions3();
    }

}

void goToInstructions3() {

    drawFullscreenImage3(instructScreen3Bitmap);

    waitForVBlank();

    state = instructions3;
}

void instructions3() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions4();
    }

}

void goToInstructions4() {

    drawFullscreenImage3(instructScreen4Bitmap);

    waitForVBlank();

    state = instructions4;
}

void instructions4() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions5();
    }

}

void goToInstructions5() {

    drawFullscreenImage3(instructScreen5Bitmap);

    waitForVBlank();

    state = instructions5;
}

void instructions5() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToCharacter();
    }

}

void goToCharacter() {

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    drawFullscreenImage3(charScreenBitmap);

    waitForVBlank();

    state = character;
}

void character() {

    if (BUTTON_PRESSED(BUTTON_A)) {
        characterSelected = 0;
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_B)) {
        characterSelected = 1;
        goToGame();
    }
}

void goToGame() {

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    stopSound();

    playSoundA(GameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    playSoundB(ticking, TICKINGLEN, TICKINGFREQ, 0);

    DMANow(3, gameBG1Tiles, &CHARBLOCK[0], gameBG1TilesLen/2);
    DMANow(3, gameBG1Map, &SCREENBLOCK[28], gameBG1MapLen/2);

    DMANow(3, gameBG2Tiles, &CHARBLOCK[1], gameBG2TilesLen/2);
    DMANow(3, gameBG2Map, &SCREENBLOCK[25], gameBG2MapLen/2);

    DMANow(3, gameBG1Pal, PALETTE, 256);

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0CNT = BG_SCREENBLOCK(28) | BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | 1;
    REG_BG1CNT = BG_SCREENBLOCK(25) | BG_CHARBLOCK(1) | BG_4BPP | BG_SIZE_WIDE | 1;

    initGame();

    state = game;
}

void goToGamePause() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    unpauseSound();

    DMANow(3, gameBG1Tiles, &CHARBLOCK[0], gameBG1TilesLen/2);
    DMANow(3, gameBG1Map, &SCREENBLOCK[28], gameBG1MapLen/2);

    DMANow(3, gameBG2Tiles, &CHARBLOCK[1], gameBG2TilesLen/2);
    DMANow(3, gameBG2Map, &SCREENBLOCK[25], gameBG2MapLen/2);

    DMANow(3, gameBG1Pal, PALETTE, 256);

    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);

    //hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0CNT = BG_SCREENBLOCK(28) | BG_CHARBLOCK(0) | BG_4BPP | BG_SIZE_WIDE | 1;
    REG_BG1CNT = BG_SCREENBLOCK(25) | BG_CHARBLOCK(1) | BG_4BPP | BG_SIZE_WIDE | 1;

    state = game;
}

void game() {

    updateGame();
    drawGame();

    waitForVBlank();

    if (hOffCounter == 0) {
            hOff++;
            hOffCounter = 3;
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } else if (winGame) {
        goToWin();
    } else if (endGame) {
        goToLose();
    }

    hOffCounter--;
    REG_BG0HOFF = hOff * 2;
    REG_BG1HOFF = hOff;
}

void goToPause() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;

    pauseSound();

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    //REG_DISPCTL = 0;
    //REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BLDMOD = BG1_A | BG0_B | OBJ_B | NORMAL_TRANS;
    REG_COLEV = WEIGHTOFA(8) | WEIGHTOFB(8);

    DMANow(3, pauseScreenTiles, &CHARBLOCK[1], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[25], pauseScreenMapLen/2);
    //DMANow(3, pauseScreenPal, PALETTE, 256);

    REG_BG1CNT = BG_SCREENBLOCK(25) | BG_CHARBLOCK(1) | BG_4BPP | BG_SIZE_SMALL | 0;

    waitForVBlank();

    state = pause;
}

void pause() {

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGamePause();
    }
}

void goToWin() {

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    stopSound();
    //0 is bg, 1 is the win screen
    //win screen
    drawFullscreenImage3(winScreenBitmap);

    waitForVBlank();

    state = win;
}

void win() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {

    REG_DISPCTL = 0;
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    stopSound();

    drawFullscreenImage3(loseScreenBitmap);

    waitForVBlank();

    state = lose;
}

void lose() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

}