#include "DEFINE.c"
#include "BufferMT.c"
#include "AudioEngine.c"
#include "Graphics.c"
#include "Movement.c"
void title_loop(void);
void game_loop(void);
void death_loop(void);
void main(void)
{
	All_Off(); // turn off screen
	Draw_Title();
	X1 = 0x80; // starting position
	Y1 = 0x70; // middle of screen
	Load_Palette();
	Reset_Scroll();

	setupAudio();
	Wait_Vblank();
	All_On(); // turn on screen
	while (1)
	{ // infinite loopwhile (Game_Mode == TITLE_MODE)
		while (Game_Mode == TITLE_MODE)
		{ // Title Screen
			title_loop();
		}

		while (Game_Mode == RUN_GAME_MODE)
		{
			game_loop();
		}
		while (Game_Mode == GAME_OVER_MODE)
		{ // Title Screen
			death_loop();
		}
	}
}
void title_loop()
{
	while (NMI_flag == 0)
		; // wait till v-blank
	Reset_Scroll();
	audioUpdate();
	Get_Input();
	Clear_Sprites();

	if (((joypad1old & START) == 0) && ((joypad1 & START) != 0))
	{
		NMI_flag = 0;
		while (NMI_flag == 0)
			; // wait till v-blank
		Game_Mode = RUN_GAME_MODE;
		audioReset();
		// init game mode
		All_Off();		 // turn off screen
		PPU_CTRL = 0x90; // rightward increments to PPU
		Load_HUD();
		
		Set_Sprite_Zero();
		Draw_Background();
		X1 = 0x80; // starting position
		Y1 = 0x70; // middle of screen
		Room = 0;
		Nametable = 0;
		Reset_Scroll();

		// was All_On(); changed to...
		PPU_CTRL = 0x91;
		lives = 3;
	}

	NMI_flag = 0;
}
void game_loop()
{
	// Game Mode
	while (NMI_flag == 0)
		; // wait till NMI

	PPU_ADDRESS = 0x20;
	PPU_ADDRESS = 0x49;
	PPU_DATA = lives + '0' + 32;
	if (PPU_flag != 0)
		Do_Buffer2();
	PPU_CTRL = 0x94;
	SCROLL = 0;
	SCROLL = 0; // resetting scroll position, again

	if (PPU_flag2 != 0)
		Do_Buffer3();
	PPU_CTRL = 0x94;
	SCROLL = 0;
	SCROLL = 0; // resetting scroll position, again

	//every_frame();	// moved this to the nmi code in reset.s for greater stability
	Get_Input();
	PPU_flag = 0;
	PPU_flag2 = 0; // makes it 'disappear'

	// wait till sprite zero hit
	Sprite_Zero();
	// set new scroll position
	SCROLL = Horiz_scroll;
	SCROLL = 0; // setting the new scroll position
	PPU_CTRL = (0x94 + Nametable);

	move_logic();
	audioUpdate();
	update_Sprites();

	// originally, I was drawing to opposite nametable, at the same
	// position as Horiz_scroll, but I could see the changes a little, so I
	// fixed that by drawing 0x20 pixels to the right of that
	RoomPlus = Room; // make a copy of variables, but 20 pixels right
	Nametable_Plus = Nametable;
	Horiz_scroll_Plus = Horiz_scroll + 0x20;
	if (Horiz_scroll_Plus < 0x20)
	{
		++RoomPlus;
		++Nametable_Plus;
		RoomPlus %= NUM_LEVELS - 1;
		Nametable_Plus &= 1;
	}

	if ((Horiz_scroll_Plus & 0x1e) == 0)
		New_Room(); // 6245 cycles

	Should_We_Buffer(); // 4422 cycles
	NMI_flag = 0;
}

void death_loop()
{
	while (NMI_flag == 0)
		; // wait till v-blank
	Reset_Scroll();
	audioUpdate();
	Get_Input();
	Clear_Sprite_Zero();

	if (((joypad1old & START) == 0) && ((joypad1 & START) != 0))
	{
		NMI_flag = 0;
		while (NMI_flag == 0)
			; // wait till v-blank
		Game_Mode = TITLE_MODE;
		//audioReset();
		// init game mode
		All_Off(); // turn off screen
		Draw_Title();
		X1 = 0x80; // starting position
		Y1 = 0x70; // middle of screen
		Reset_Scroll();
		Wait_Vblank();
		// was All_On(); changed to...
		PPU_CTRL = 0x91;
		lives = 3;
	}

	NMI_flag = 0;
}