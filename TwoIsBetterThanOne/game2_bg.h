
//{{BLOCK(game2_bg)

//======================================================================
//
//	game2_bg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 40 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1280 + 2048 = 3840
//
//	Time-stamp: 2017-04-24, 22:43:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME2_BG_H
#define GRIT_GAME2_BG_H

#define game2_bgTilesLen 1280
extern const unsigned short game2_bgTiles[640];

#define game2_bgMapLen 2048
extern const unsigned short game2_bgMap[1024];

#define game2_bgPalLen 512
extern const unsigned short game2_bgPal[256];

#endif // GRIT_GAME2_BG_H

//}}BLOCK(game2_bg)
