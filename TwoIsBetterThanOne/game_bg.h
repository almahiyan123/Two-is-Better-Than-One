
//{{BLOCK(game_bg)

//======================================================================
//
//	game_bg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 69 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2208 + 2048 = 4768
//
//	Time-stamp: 2017-04-24, 17:47:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME_BG_H
#define GRIT_GAME_BG_H

#define game_bgTilesLen 2208
extern const unsigned short game_bgTiles[1104];

#define game_bgMapLen 2048
extern const unsigned short game_bgMap[1024];

#define game_bgPalLen 512
extern const unsigned short game_bgPal[256];

#endif // GRIT_GAME_BG_H

//}}BLOCK(game_bg)
