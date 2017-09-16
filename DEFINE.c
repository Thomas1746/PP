#ifndef DEFINE_H
#define DEFINE_H
// let's define some things



#define PPU_CTRL		*((unsigned char*)0x2000)
#define PPU_MASK		*((unsigned char*)0x2001)
#define PPU_STATUS		*((unsigned char*)0x2002)
#define OAM_ADDRESS		*((unsigned char*)0x2003)
#define SCROLL			*((unsigned char*)0x2005)
#define PPU_ADDRESS		*((unsigned char*)0x2006)
#define PPU_DATA		*((unsigned char*)0x2007)
#define OAM_DMA			*((unsigned char*)0x4014)


#define RIGHT		0x01
#define LEFT		0x02
#define DOWN		0x04
#define UP			0x08
#define START		0x10
#define SELECT		0x20
#define B_BUTTON	0x40
#define A_BUTTON	0x80


enum {TITLE_MODE, RUN_GAME_MODE, PAUSE_MODE, GAME_OVER_MODE, VICTORY_MODE, BOSS_MODE};

// Globals
// our startup code initialized all values to zero
#pragma bss-name(push, "ZEROPAGE")
unsigned char NMI_flag;
unsigned char Frame_Count;
unsigned char index;
unsigned char index2;
unsigned char index3;
unsigned char index4;
unsigned char lives;
unsigned char X1;
unsigned char Y1;
unsigned char state;
unsigned char state4;
unsigned char joypad1;
unsigned char joypad1old;
unsigned char joypad1test; 
unsigned char joypad2; 
unsigned char joypad2old;
unsigned char joypad2test;
unsigned char Room;
unsigned char RoomB;
unsigned char RoomPlus;
const unsigned char *Room_Address; // is an int pointer, points to chars
unsigned char Horiz_scroll; 
unsigned char Horiz_scroll_Old; 
unsigned char Horiz_scroll_Plus; 
unsigned int Scroll_Adjusted_X;
unsigned char Game_Mode; // see above for enum
// got rid of Vscroll, now always 0
unsigned char Nametable;
unsigned char NametableB;
unsigned char Nametable_Plus;
unsigned char walk_count;
signed char X_speed; // signed char = -128 to 127
signed char Y_speed; // signed char = -128 to 127
unsigned char direction; // 0 = R, 1 = L
unsigned char collision_Index;
unsigned char high_byte;
unsigned char collision;
unsigned char collisionBot;
unsigned char collisionOld;
unsigned char temp;
unsigned char temp2;
unsigned char temp3;
unsigned char temp4;
unsigned char PPU_ADDRESS_High;
unsigned char PPU_ADDRESS_Low;
unsigned char A;
unsigned char PPU_flag;
unsigned char PPU_flag2;

unsigned char dummy;


#pragma bss-name(push, "OAM")
unsigned char SPRITE_ZERO[4];
unsigned char SPRITES[252];
// OAM equals ram addresses 200-2ff

#pragma bss-name(push, "MAP")
unsigned char C_MAP[256];
unsigned char C_MAP2[256];
// MAP equals ram addresses 300-4ff, collision map, metatiles

#pragma bss-name(push, "BSS")
unsigned char BUFFER1[32];	// left column 1
unsigned char BUFFER2[32];	// right column 1
unsigned char BUFFER3[32];	// left column 2
unsigned char BUFFER4[32];	// right column 2

unsigned char BUFFER5[8];	// 1/2 bits of attribute table
unsigned char BUFFER6[8];	// 1/2 bits of attribute table
unsigned char BUFFER7[8];	// final attribute table buffer

#include "Levels/L1.csv"
#include "Levels/L2.csv"
#include "Levels/L3.csv"
#include "Levels/L4.csv"
#include "BG/Title.h"
#include "BG/death.h"

const unsigned char * const ROOMS[]={L1, L2, L3, L4};

// collision maps called A1-A4
// now their value is 0-11, which will index to this array...

const unsigned char PLATFORM[]={ // which metatiles act like platforms
	0, 1, 1, 1, 1, 2, 2, 2,
	0, 6, 6, 6, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	1, 50, 1, 50, 0, 50, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0
};

// tl, tr, bl, br = tiles for each metatile
const unsigned char METATILES[]={
	0x00, 0x01, 0x10, 0x11, 
	0x02, 0x03, 0x12, 0x13, 
	0x04, 0x05, 0x14, 0x15, 
	0x06, 0x07, 0x16, 0x17, 
	0x08, 0x09, 0x18, 0x19, 
	0x0A, 0x0B, 0x1A, 0x1B, 
	0x0C, 0x0D, 0x1C, 0x1D, 
	0x0E, 0x0F, 0x1E, 0x1F, 
	
	0x20, 0x21, 0x30, 0x31, 
	0x22, 0x23, 0x32, 0x33, 
	0x24, 0x25, 0x34, 0x35, 
	0x26, 0x27, 0x36, 0x37, 
	0x28, 0x29, 0x38, 0x39, 
	0x2A, 0x2B, 0x3A, 0x3B, 
	0x2C, 0x2D, 0x3C, 0x3D, 
	0x2E, 0x2F, 0x3E, 0x3F, 

	0xA0, 0xA1, 0xB0, 0xB1, 
	0xA2, 0xA3, 0xB2, 0xB3, 
	0xA4, 0xA5, 0xB4, 0xB5, 
	0xA6, 0xA7, 0xB6, 0xB7, 
	0xA8, 0xA9, 0xB8, 0xB9, 
	0xAA, 0xAB, 0xBA, 0xBB, 
	0xAC, 0xAD, 0xBC, 0xBD, 
	0xAE, 0xAF, 0xBE, 0xBF, 

	0xC0, 0xC1, 0xD0, 0xD1, 
	0xC2, 0xC3, 0xD2, 0xD3, 
	0xC4, 0xC5, 0xD4, 0xD5, 
	0xC6, 0xC7, 0xD6, 0xD7, 
	0xC8, 0xC9, 0xD8, 0xD9, 
	0xCA, 0xCB, 0xDA, 0xDB, 
	0xCC, 0xCD, 0xDC, 0xDD, 
	0xCE, 0xCF, 0xDE, 0xDF, 
	
	0xE0, 0xE1, 0xF0, 0xF1, 
	0xE2, 0xE3, 0xF2, 0xF3, 
	0xE4, 0xE5, 0xF4, 0xF5, 
	0xE6, 0xE7, 0xF6, 0xF7, 
	0xE8, 0xE9, 0xF8, 0xF9, 
	0xEA, 0xEB, 0xFA, 0xFB, 
	0xEC, 0xED, 0xFC, 0xFD, 
	0xEE, 0xEF, 0xFE, 0xFF,

	0x26, 0x27, 0x36, 0x37, 
	0x28, 0x29, 0x38, 0x39, 
	0x2A, 0x2B, 0x3A, 0x3B, 
	0x2C, 0x2D, 0x3C, 0x3D,
};

// color palette for each metatile
const unsigned char MT_color[]={
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
	1, 2, 3, 3, 3, 3, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0};
	
const unsigned char HUD[]={" Lives:  "}; // add tile 3 after this
// note, use palette 2 = 0xaa for first 8
const unsigned char PALETTE[]={
0x21, 0x08, 0x0A, 0x0f, //grass
0x21, 0X07, 0X17, 0x0F, //barrel
0x21, 0x00, 0x10, 0x1D, //spike
0x21, 0x07, 0x17, 0x27,	//box, rake, nails
0x21, 0x17, 0x28, 0x39, //character
0, 0, 0, 0,
0, 0, 0, 0,
0, 0, 5, 0x15
};

const unsigned char Walk_Moves[] = {
	0, 0, 1, 1, 2, 2, 3, 3, 4, 4}; // just a way to reuse the #0 state tiles
	
const unsigned char MetaSprite_Y[] = {0, 0, 8, 8}; // relative y coordinates

const unsigned char MetaSprite_Tile_Right[] = { // tile numbers, right
	0, 1, 0x10, 0x11, 	// walk 0
	2, 3, 0x12, 0x13, 	// walk 1
	4, 5, 0x14, 0x15, 	// walk 2
	6, 7, 0x16, 0x17, 	// walk 3
	8, 9, 0x18, 0x19,   // walk 4
	10, 11, 0x1A, 0x1B,	// jump 1
	12, 13, 0x1C, 0x1D, // jump 2
	14, 15, 0x1E, 0x1F, // jump 3
};	// jump

const unsigned char MetaSprite_Attrib_Right[] = {0, 0, 0, 0}; // attributes = not flipped

const unsigned char MetaSprite_X[] = {0, 8, 0, 8}; // relative x coordinates
// we are using 4 sprites, each one has a relative position from the top left sprite

const unsigned char MetaSprite_Tile_Left[] = { // tile numbers, left
	1, 0, 0x11, 0x10, 	// walk 0
	3, 2, 0x13, 0x12, 	// walk 1
	5, 4, 0x15, 0x14, 	// walk 2
	7, 6, 0x17, 0x16, 	// walk 3
	9, 8, 0x19, 0x18, 	// walk 4
	11, 10, 0x1B, 0x1A, 	// jump 1
	13, 12, 0x1D, 0x1C,	// jump 2
	15, 14, 0x1F, 0x1E, // jump 3
}; 	

const unsigned char MetaSprite_Attrib_Left[] = {0x40, 0x40, 0x40, 0x40}; // attributes = H flipped

// Prototypes
void All_Off (void);
void All_On (void);
void Rotate_Palette(void);
void Reset_Scroll (void);
void Load_Palette (void);
void update_Sprites (void);
void Collision_Down (void);
void move_logic (void);
void Do_Buffer (void);
void Do_Buffer2 (void);
void Do_Buffer3 (void);
void Draw_Title(void);
void Draw_Death(void);
void Draw_Background (void);
void Set_Sprite_Zero (void);
void Load_HUD (void);
void Should_We_Buffer (void);
void New_Room (void);

void __fastcall__ memcpy (void* dest, const void* src, int count);
void __fastcall__ UnRLE(const unsigned char *data);
void Wait_Vblank(void);
void Get_Input(void);
void Sprite_Zero(void);
void Super_Fast_Write_PPU(void);
void Super_Fast_Write_PPU2(void);
#endif