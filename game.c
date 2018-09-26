#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

OBJ_ATTR shadowOAM[128];

FRIEND friends[FRIENDCNT];
DISTANCE distance[DISTANCECNT];
FRIENDLY friendly[FRIENDLYCNT];
INVIS invis[INVISCNT];
PLAYER player;
CLOCK clock;
TROLLEY trolley;

int walkBegin;
int walkEnd;
int numActiveFriends;

int friendlyCurrCount;
int foodCurrCount;
int foodMarker;

int endGame;
int winGame;
int randRow;

int characterSelected;
int currActiveChar;

int makeMeActive;

int randCounter;
int randTime;
int randFri;

int distanceCounter;
int distanceFull;

int currTalking;

int friendMarker;

int invisRandTime;

int playerOn;
//int trolleyOn;

int trolleyCounter;

int trolleyClashing;
int trolleyColliding;

int distanceTracker;

void initGame() {
	distanceTracker = 0;
	trolleyClashing = 0;
	trolleyColliding = 0;
	//trolleyOn = 0;
	trolleyCounter = 0;
	friendMarker = 0;
	distanceFull = 0;
	distanceCounter = 0;
	randTime = rand() % 50 + 23; //MAKE 0 for start
	invisRandTime = rand() % 76 + 120; //rand() % 76 + 1000;
	randCounter = 0;
	endGame = 0;
	winGame = 0;
	walkBegin = 36;
	walkEnd = 160 - 16;
	foodMarker = 600;
	playerOn = 1;
	initMainPlayer();
	initDistance();
	initOtherPlayer();
	initFriendBar();
	initClock();
	initInvis();
	initTrolley();

	DMANow(3, shadowOAM, OAM, 128*4);
}

void updateGame() {

	if (playerOn) {
		updateMainPlayer();
	}
	updateOtherPlayer();
	updateFriendBar();
	updateClock();
	updateDistance();
	updateInvis();
	updateTrolley();

}

void drawGame() {

	DMANow(3, shadowOAM, OAM, 128*4);
}

void initMainPlayer() {
	player.row = 64;
	player.col = 18;
	player.width = 16;
	player.height = 32;
	player.rdel = 2;
	player.active = 1;
	//change later
	player.character = characterSelected;
	player.spriteSheetCol = player.character;
	player.invis = 0;
	player.invisPaletteRow = 14 + player.character;
	player.invisCount = 180;

	player.curFrame = 0;
	//change if needed
	player.numFrames = 3;
	player.aniCounter = 30;
	player.talking = 0;
	player.palleteRow = characterSelected==0?1:2;
	player.curPalette = player.palleteRow;

	shadowOAM[PLAYER_OAM].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL | ATTR0_REGULAR;
	shadowOAM[PLAYER_OAM].attr1 = player.col | ATTR1_MEDIUM;
	shadowOAM[PLAYER_OAM].attr2 = ATTR2_PALROW(player.curPalette) | ATTR2_TILEID(player.curFrame * 4, (player.spriteSheetCol * 4) + (player.talking * 2));
}

void updateMainPlayer() {

	if (player.invisCount == 0) {
		player.invis = 0;
		player.curPalette = player.palleteRow;
		player.invisCount = 180;
	}

	if (!player.talking) {
		distanceCounter++;
	}

	if(player.aniCounter == 0) {
		//distanceCounter++;
		player.curFrame++;
		if (player.curFrame >= player.numFrames) {
			player.curFrame = 0;
		}
	}

	if (BUTTON_HELD(BUTTON_UP) && !player.talking) {
		if (player.row > walkBegin) {
			player.row = player.row - player.rdel;
		}
	}

	if (BUTTON_HELD(BUTTON_DOWN) && !player.talking) {
		if (player.row < walkEnd - player.height) {
			player.row = player.row + player.rdel;
		}
	}

	for (int i = 0; i < FRIENDCNT; i++) {
		if (/* player.col + player.width + 1 == friends[i].col
			&& player.row >= friends[i].row - friends[i].height && player.row <= friends[i].row + friends[i].height */
		collision(friends[i].row, friends[i].col, friends[i].height, friends[i].width, player.row, player.col, player.height, player.width)) {
			if (friends[i].active && !friends[i].helpAnimateStop && !currTalking && !friends[i].justTalked && !player.invis) {
				friends[i].helpAnimate = 1;
				player.talking = 1;
				currActiveChar = i;
				currTalking = 1;
			}
		} else if (player.col + player.width + 1 == friends[i].col) {
			if (friends[i].active && friendlyCurrCount != 0 && !player.invis) {
				//friendlyCurrCount--;
			}
		}
	}

	for (int i = 0; i < INVISCNT; i++) {
		if (collision(invis[i].row, invis[i].col, invis[i].height, invis[i].width, player.row, player.col, player.height, player.width)) {
			if (invis[i].active) {
				invis[i].active = 0;
				player.curPalette = player.invisPaletteRow;
				player.invis = 1;}
		}
	}	

	shadowOAM[PLAYER_OAM].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL | ATTR0_REGULAR;
	shadowOAM[PLAYER_OAM].attr1 = player.col | ATTR1_MEDIUM;
	shadowOAM[PLAYER_OAM].attr2 = ATTR2_PALROW(player.curPalette) | ATTR2_TILEID(player.curFrame * 4, (player.spriteSheetCol * 4) + (player.talking * 2));

	if (player.aniCounter == 0) {
		player.aniCounter = 30;
	}
	player.aniCounter--;

	if (player.invis) {
		player.invisCount--;
	}
}

void initOtherPlayer() {

	makeMeActive = rand() % 3;
	currActiveChar = makeMeActive; 

	for (int i = 0; i < FRIENDCNT; i++) {
		friends[i].skipped = 0;
		friends[i].height = 32;
		friends[i].width = 32;
		friends[i].row = (rand() % 76) + 36;
		friends[i].col = SCREENWIDTH; //- friends[i].width - 1;
		friends[i].cdel = 1;
		friends[i].active = 0;

		if (i == 1 || i == 4) {
			friends[i].spriteSheetCol = 0;
			friends[i].type = 0;
			friends[i].palleteRow = 5;
		} else if (i == 0 || i == 2 || i == 5) {
			friends[i].spriteSheetCol = 4;
			friends[i].type = 1;
			friends[i].palleteRow = 4;
		} else {
			friends[i].spriteSheetCol = 8;
			friends[i].type = 2;
			friends[i].palleteRow = 3;
		}

		friends[i].curFrame = 0;
		friends[i].numFrames = 2;
		friends[i].aniCounter = 30;
		friends[i].helpAnimate = 0;
		friends[i].helpAnimateTimer = 3;
		friends[i].helpAnimateStop = 0;
		friends[i].justTalked = 0;
		friends[i].trolleyCollision = 0;
		friends[i].afterTalkFrame = 0;

		shadowOAM[FRIEND_OAM + i].attr0 = friends[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		shadowOAM[FRIEND_OAM + i].attr1 = COLMASK & friends[i].col | ATTR1_MEDIUM;
		shadowOAM[FRIEND_OAM + i].attr2 = ATTR2_PALROW(friends[i].palleteRow) | ATTR2_TILEID(friends[i].curFrame, (friends[i].spriteSheetCol) + 8);
	}
	numActiveFriends = 3;
}

void updateOtherPlayer() {
	//int randColDist = rand() % 55 + 20;

	for (int i = 0; i < FRIENDCNT; i++) {

		if (friends[i].helpAnimateStop = 1) {
			friends[i].helpAnimateStop = 0;
		}

		if (friends[i].active && !friends[i].helpAnimate && !friends[i].trolleyCollision) {
			friends[i].col = friends[i].col - friends[i].cdel;
			shadowOAM[FRIEND_OAM + i].attr1 = friends[i].col & COLMASK | ATTR1_MEDIUM;
			shadowOAM[FRIEND_OAM + i].attr0 = friends[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;

			if (friends[i].col + friends[i].width - 1 <= 0) {
				friends[i].col = SCREENWIDTH - friends[i].width - 1;
				friends[i].row = (rand() % 76) + 36;
				friends[i].active = 0;
				shadowOAM[FRIEND_OAM + i].attr1 = friends[i].col & COLMASK| ATTR1_MEDIUM;
				shadowOAM[FRIEND_OAM + i].attr0 = friends[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
				numActiveFriends--;
				if (!friends[i].justTalked && !player.invis && playerOn) {
					friendlyCurrCount--;
				}
				friends[i].justTalked = 0;
				friends[i].afterTalkFrame = 0;
			} else {
				if (friends[i].aniCounter == 0) {
					friends[i].curFrame++;
					if (friends[i].curFrame == 2) {
						friends[i].curFrame = 0;
					}
					if (friends[i].aniCounter == 0) {
						friends[i].aniCounter = 30;
					}
					shadowOAM[FRIEND_OAM + i].attr2 = ATTR2_PALROW(friends[i].palleteRow) | ATTR2_TILEID(friends[i].curFrame * 4 + friends[i].afterTalkFrame, (friends[i].spriteSheetCol) + 8);
				}
				friends[i].aniCounter--;
			}
		} else if (friends[i].active && friends[i].helpAnimate) {
			shadowOAM[FRIEND_OAM + i].attr2 = ATTR2_PALROW(friends[i].palleteRow) | ATTR2_TILEID(friends[i].curFrame * 4 + friends[i].afterTalkFrame, (friends[i].spriteSheetCol) + 20);
			friends[i].numFrames = 3;
			friends[i].aniCounter--;
			if (friends[i].aniCounter == 0) {
				friends[i].curFrame++;
				if (friends[i].curFrame == 3) {
					friends[i].curFrame = 0;
				}
				friends[i].helpAnimateTimer--;
				if (friends[i].aniCounter == 0) {
					friends[i].aniCounter = 30;
				}
			}
			if (friends[i].helpAnimateTimer == 0) {
				friends[i].helpAnimate = 0;
				friends[i].helpAnimateTimer = 3;
				friends[i].curFrame = 0;
				friends[i].numFrames = 2;
				friends[i].helpAnimateStop = 1;
				if (friends[i].type == 1) {
					friends[i].afterTalkFrame = 8;
				}
				currTalking = 0;
				player.talking = 0;
				friends[i].justTalked = 1;
				shadowOAM[FRIEND_OAM + i].attr2 = ATTR2_PALROW(friends[i].palleteRow) | ATTR2_TILEID(friends[i].curFrame * 4 + friends[i].afterTalkFrame, (friends[i].spriteSheetCol) + 8);
			}
		}
	}

	if (randTime == 0) {
		friends[friendMarker].active = 1;
		if (friendMarker + 1 == FRIENDCNT) {
			friendMarker = 0;
		} else {
			friendMarker++;
		}
		randTime = rand() % 50 + 76;
	}
	randTime--;
}

void initDistance() {
	//start at eight
	for (int i = 0; i < DISTANCECNT; i++) {
		distance[i].width = 16;
		distance[i].height = 32; 
		distance[i].col = i * 16 + 8;
		distance[i].row = 160 - 25;
		distance[i].spriteSheetRow = 16;
		distance[i].spriteSheetCol = 21;
		distance[i].curFrame = 0;
		distance[i].numFrames = 2;
		distance[i].palleteRow = 8;
		distance[i].full = 0;

		shadowOAM[DISTANCE_OAM + i].attr0 = distance[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[DISTANCE_OAM + i].attr1 = distance[i].col | ATTR1_SMALL;
		shadowOAM[DISTANCE_OAM + i].attr2 = ATTR2_PALROW(distance[i].palleteRow) | ATTR2_TILEID(distance[i].spriteSheetRow, distance[i].spriteSheetCol);
	}

	shadowOAM[DISTANCE_OAM + DISTANCECNT].attr0 = 119 | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[DISTANCE_OAM + DISTANCECNT].attr1 = 119 + 33 + 15 | ATTR1_MEDIUM;
	shadowOAM[DISTANCE_OAM + DISTANCECNT].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(16, 23);

}

void updateDistance() {

	if (distance[DISTANCECNT - 1].spriteSheetRow == 18) {

		distanceTracker++;
		if (distanceTracker == 30) {
			winGame = 1;
		}
	}

	if (distanceCounter != 0) {
		if (distanceCounter == 180) {
			distance[distanceFull].full = 1;
			distance[distanceFull].spriteSheetRow = 18;
			distanceFull++;
			distanceCounter = 0;
		}
	}

	for (int i; i < DISTANCECNT; i++) {
		shadowOAM[DISTANCE_OAM + i].attr0 = distance[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[DISTANCE_OAM + i].attr1 = distance[i].col | ATTR1_SMALL;
		shadowOAM[DISTANCE_OAM + i].attr2 = ATTR2_PALROW(distance[i].palleteRow) | ATTR2_TILEID(distance[i].spriteSheetRow, distance[i].spriteSheetCol);
	}
}


void initFriendBar() {

	friendlyCurrCount = 5;

	for (int i = 0; i < FRIENDLYCNT; i++) {
		friendly[i].row = 15;
		friendly[i].col = 10 + 16 * i + 5;
		friendly[i].width = 16;
		friendly[i].height = 16;
		friendly[i].active = 1;
		friendly[i].palleteRow = 5;
		friendly[i].spriteSheetRow = 16;

		shadowOAM[FRIENDLY_OAM + i].attr0 = friendly[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
		shadowOAM[FRIENDLY_OAM + i].attr1 = friendly[i].col | ATTR1_SMALL;
		shadowOAM[FRIENDLY_OAM + i].attr2 = ATTR2_PALROW(friendly[i].palleteRow) | ATTR2_TILEID(friendly[i].spriteSheetRow, 17);
	}

}

void updateFriendBar() {

	if (!friendlyCurrCount) {
		endGame = 1;
	}

	for (int i = 0; i < FRIENDLYCNT - friendlyCurrCount; i++) {

		shadowOAM[FRIENDLY_OAM + 5 - 1 - i].attr0 = friendly[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		shadowOAM[FRIENDLY_OAM + 5 - 1 - i].attr1 = friendly[i].col | ATTR1_SMALL;
		shadowOAM[FRIENDLY_OAM + 5 - 1 - i].attr2 = ATTR2_PALROW(friendly[i].palleteRow) | ATTR2_TILEID(friendly[i].spriteSheetRow, 17);
	}
}

void initTrolley() { 
	trolley.row = player.row;
	trolley.col = player.col;
	trolley.rdel = player.rdel;
	trolley.width = 64;
    trolley.height = 32;
    trolley.active = 0;
    trolley.spriteSheetRow = 16;
    trolley.spriteSheetCol = 0;
    trolley.curFrame = 0;
    trolley.numFrames = 2;
    trolley.aniCounter = 30;
    trolley.palleteRow = 9;

    shadowOAM[TROLLEY_OAM].attr0 = trolley.row | ATTR0_4BPP | ATTR0_WIDE | ATTR0_HIDE;
	shadowOAM[TROLLEY_OAM].attr1 = trolley.col | ATTR1_LARGE;
	shadowOAM[TROLLEY_OAM].attr2 = ATTR2_PALROW(trolley.palleteRow) | ATTR2_TILEID(trolley.spriteSheetRow, trolley.spriteSheetCol);

}

void updateTrolley() {

	if (trolleyCounter < 21) {
		trolleyCounter++;
	}

	if (BUTTON_HELD(BUTTON_A) && trolleyCounter > 20) {
		trolley.active = 1;
		playerOn = 0;
		shadowOAM[TROLLEY_OAM].attr0 = trolley.row | ATTR0_4BPP | ATTR0_WIDE | ATTR0_REGULAR;
		shadowOAM[PLAYER_OAM].attr0 = player.row | ATTR0_4BPP | ATTR0_TALL | ATTR0_HIDE;
	}

	if (trolley.active) {
		//distanceCounter++;

		for (int i = 0; i < FRIENDCNT; i++) {
			if (friends[i].active && collision(friends[i].row, friends[i].col, friends[i].height, friends[i].width, trolley.row, trolley.col, trolley.height, trolley.width))
			{
				friends[i].trolleyCollision = 1;
				trolleyColliding++;
			} else {
				friends[i].trolleyCollision = 0;
			}

			if (friends[i].active && clashing(friends[i].row, friends[i].col, friends[i].height, friends[i].width, trolley.row, trolley.col, trolley.height, trolley.width)) {
				trolleyClashing = 1;
				friends[i].trolleyCollision = 0;
				trolleyColliding--;
			}
		}

		if (BUTTON_HELD(BUTTON_UP) && !trolleyClashing) {
			if (trolley.row > walkBegin) {
				trolley.row = trolley.row - trolley.rdel;
			}
		}

		if (BUTTON_HELD(BUTTON_DOWN) && !trolleyClashing) {
			if (trolley.row < walkEnd - trolley.height) {
				trolley.row = trolley.row + trolley.rdel;
			}
		}

		if (trolley.aniCounter == 0) {
			trolley.curFrame++;
			if (trolley.curFrame == 2) {
				trolley.curFrame = 0;
			}
			trolley.aniCounter = 30;
		}

		shadowOAM[TROLLEY_OAM].attr0 = trolley.row | ATTR0_4BPP | ATTR0_WIDE | ATTR0_REGULAR;
		shadowOAM[TROLLEY_OAM].attr1 = trolley.col | ATTR1_LARGE;
		shadowOAM[TROLLEY_OAM].attr2 = ATTR2_PALROW(trolley.palleteRow) | ATTR2_TILEID(trolley.curFrame * 4 + trolley.spriteSheetRow, trolley.spriteSheetCol);
		
		if (!trolleyColliding) {
			distanceCounter++;
			trolley.aniCounter--;
		}

		trolleyClashing = 0;
		trolleyColliding = 0;
	}

}

void initClock() {
	clock.row = 5;
	clock.col = 192;
	clock.width = 32;
	clock.height = 32;
	clock.active = 1;
	clock.spriteSheetRow = 24;
	clock.spriteSheetCol = 0;
	clock.curFrame = 0;
	clock.numFrames = 16;
	clock.aniCounter = 200;
	clock.palleteRow = 8;

	shadowOAM[CLOCK_OAM].attr0 = clock.row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
	shadowOAM[CLOCK_OAM].attr1 = clock.col | ATTR1_MEDIUM;
	shadowOAM[CLOCK_OAM].attr2 = ATTR2_PALROW(clock.palleteRow) | ATTR2_TILEID(clock.spriteSheetRow, clock.spriteSheetCol);
}

void updateClock() {

	if (clock.aniCounter == 0) {
		if (clock.spriteSheetCol + 4 >= 27 && clock.spriteSheetRow == 24) {
			clock.spriteSheetRow += 4;
			clock.spriteSheetCol = 0;
			shadowOAM[CLOCK_OAM].attr2 = ATTR2_PALROW(clock.palleteRow) | ATTR2_TILEID(clock.spriteSheetRow, clock.spriteSheetCol);
			clock.aniCounter = 200;
		} else if (clock.spriteSheetCol >= 27 && clock.spriteSheetRow == 28) {
			//endGame = 1;
			//if (friendlyCurrCount == 0) {
				endGame = 1;
			//} else if (distance[DISTANCECNT - 1].spriteSheetRow == 18) {
				//winGame = 1;
			//}
		} else {
			clock.spriteSheetCol += 4;
			shadowOAM[CLOCK_OAM].attr2 = ATTR2_PALROW(clock.palleteRow) | ATTR2_TILEID(clock.spriteSheetRow, clock.spriteSheetCol);
			clock.aniCounter = 200;
		}
	}

	clock.aniCounter--;

}

void initInvis() {
	for (int i = 0; i < INVISCNT; i++) {
    	    invis[i].row = (rand() % 76) + 36;
    		invis[i].col = SCREENWIDTH;//- friends[i].width - 1;
    		invis[i].cdel = 1;
    		invis[i].width = 32;
    		invis[i].height = 32;
    		invis[i].active = 0;
    		invis[i].spriteSheetCol = 28;
    		invis[i].spriteSheetRow = 16;
    		invis[i].curFrame = 0;
    		invis[i].numFrames = 3;
    		invis[i].aniCounter = 30;
    		invis[i].palleteRow = 6;

    		shadowOAM[INVIS_OAM + i].attr0 = invis[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
			shadowOAM[INVIS_OAM + i].attr1 = COLMASK & invis[i].col | ATTR1_SMALL;
			shadowOAM[INVIS_OAM + i].attr2 = ATTR2_PALROW(invis[i].palleteRow) | ATTR2_TILEID(invis[i].spriteSheetRow, invis[i].spriteSheetCol);
    }
}

void updateInvis() {

	if (invisRandTime == 0) {
		for (int i = 0; i < INVISCNT; i++) {
			if (!invis[i].active) {
				invis[i].active = 1;
				invis[i].col = SCREENWIDTH - invis[i].width - 1;
				shadowOAM[INVIS_OAM + i].attr0 = invis[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_REGULAR;
				break;
			}
		}
		invisRandTime = rand() % 76 + 700;
	}

	for (int i = 0; i < INVISCNT; i++) {
		if (invis[i].active) {
			invis[i].col = invis[i].col - invis[i].cdel;

			invis[i].aniCounter--;
			if (invis[i].aniCounter == 0) {
				invis[i].curFrame++;
				if (invis[i].curFrame == 3) {
					invis[i].curFrame = 0;
				}
				invis[i].aniCounter = 30;
			}
		} else {
			shadowOAM[INVIS_OAM + i].attr0 = invis[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		}

		if (invis[i].col + invis[i].width - 1 <= 0) {
				invis[i].col = SCREENWIDTH - invis[i].width - 1;
				invis[i].row = (rand() % 76) + 36;
				invis[i].active = 0;
				shadowOAM[INVIS_OAM + i].attr0 = invis[i].row | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_HIDE;
		}

		shadowOAM[INVIS_OAM + i].attr1 = invis[i].col & COLMASK| ATTR1_SMALL;
		shadowOAM[INVIS_OAM + i].attr2 = ATTR2_PALROW(invis[i].palleteRow) | ATTR2_TILEID(invis[i].spriteSheetRow + invis[i].curFrame * 2, invis[i].spriteSheetCol);
	}

	invisRandTime--;

}

