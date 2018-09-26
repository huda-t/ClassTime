
//{{BLOCK(gameBG2)

//======================================================================
//
//	gameBG2, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 51 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1632 + 4096 = 6240
//
//	Time-stamp: 2018-04-13, 12:15:24
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG2_H
#define GRIT_GAMEBG2_H

#define gameBG2TilesLen 1632
extern const unsigned short gameBG2Tiles[816];

#define gameBG2MapLen 4096
extern const unsigned short gameBG2Map[2048];

#define gameBG2PalLen 512
extern const unsigned short gameBG2Pal[256];

#endif // GRIT_GAMEBG2_H

//}}BLOCK(gameBG2)
