/*	for cc65, for NES
 *	updated 2/20/2016
 *	
 *	simple platformer game, with sprite zero trick
 *	'start' makes the zero sprite disappear, see note on 'start'
 *	doug fraker 2015
 *	feel free to reuse any code here
 *	
 *	what this code does, is generate a bg image dynamically
 *	using a metatile system, based on the collision map.
 *	let's say it gets metatile #1, ground = tiles 2, 2, 2, 2
 *	it will put the left tiles into the left buffer, 
 *	the right tiles into the right buffer, and fill the buffers... 
 *	2 columns of metatiles is converted into 4 columns of tiles
 *	
 *	each metatile is associated with a BG palette, so it stores a column
 *	of palette numbers, and combines them at the end to form a set of
 *	attribute table data
 *	then, it quickly writes this data to the screen, during v-blank
 *	it's a lot of writes to do during v-blank, so I wrote a special
 *	unrolled loop in ASM, to do it as quickly as possible.
 *	
 *	Note, as it scrolls, it writes new tiles to the nametable
 *	and new data to the collision map
 */

#include "DEFINE.c"
#include "BufferMT.c"
#include "AudioEngine.c"

void main(void)
{
	All_Off(); // turn off screen
	Draw_Title();
	X1 = 0x80; // starting position
	Y1 = 0x70; // middle of screen
	Set_Sprite_Zero();
	Load_Palette();
	Reset_Scroll();
	
	setupAudio();
	Wait_Vblank();
	All_On(); // turn on screen
	while (1)
	{	 // infinite loopwhile (Game_Mode == TITLE_MODE)
		while (Game_Mode == TITLE_MODE){ // Title Screen
			while (NMI_flag == 0); // wait till v-blank
			Reset_Scroll();

			Get_Input();

			if (((joypad1old & START) == 0) && ((joypad1 & START) != 0))
			{
				NMI_flag = 0;
				while (NMI_flag == 0); // wait till v-blank
				Game_Mode = RUN_GAME_MODE;
				// init game mode
				All_Off(); // turn off screen
				PPU_CTRL = 0x90; // rightward increments to PPU
				Load_HUD();
				Draw_Background();
				X1 = 0x80; // starting position
				Y1 = 0x70; // middle of screen
				Reset_Scroll();
				
				// was All_On(); changed to...
				PPU_CTRL = 0x91;
				lives = 3;
			}

			NMI_flag = 0;
		}

		while (Game_Mode == RUN_GAME_MODE)
		{ // Game Mode
			while (NMI_flag == 0)
				; // wait till NMI

				PPU_ADDRESS = 0x20;
				PPU_ADDRESS = 0x49;
				PPU_DATA = lives+'0'+32;
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
			PPU_flag2 = 0;					   // makes it 'disappear'

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
				RoomPlus &= 3;
				Nametable_Plus &= 1;
			}

			if ((Horiz_scroll_Plus & 0x1e) == 0)
				New_Room(); // 6245 cycles

			Should_We_Buffer(); // 4422 cycles
			NMI_flag = 0;
		}
		while (Game_Mode == GAME_OVER_MODE){ // Title Screen
			while (NMI_flag == 0); // wait till v-blank
			Reset_Scroll();

			Get_Input();

			if (((joypad1old & START) == 0) && ((joypad1 & START) != 0))
			{
				NMI_flag = 0;
				while (NMI_flag == 0); // wait till v-blank
				Game_Mode = TITLE_MODE;
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
	}
}

// inside the startup code, the NMI routine will ++NMI_flag and ++Frame_Count at each V-blank

void All_Off(void)
{
	PPU_CTRL = 0;
	PPU_MASK = 0;
}

void All_On(void)
{
	PPU_CTRL = 0x94; // screen is on, NMI on
	PPU_MASK = 0x1e;
}

void Reset_Scroll(void)
{
	PPU_ADDRESS = 0;
	PPU_ADDRESS = 0;
	SCROLL = 0;
	SCROLL = 0;
}

void Load_Palette(void)
{
	PPU_ADDRESS = 0x3f;
	PPU_ADDRESS = 0x00;
	for (index = 0; index < sizeof(PALETTE); ++index)
	{
		PPU_DATA = PALETTE[index];
	}
}

void update_Sprites(void)
{
	state4 = state << 2; // shift left 2 = multiply 4
	index4 = 0;
	if (direction == 0)
	{ // right
		for (index = 0; index < 4; ++index)
		{
			SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
			++index4;
			SPRITES[index4] = MetaSprite_Tile_Right[index + state4]; // tile numbers
			++index4;
			SPRITES[index4] = MetaSprite_Attrib_Right[index]; // attributes, all zero here
			++index4;
			SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
			++index4;
			SPRITES[index4] = MetaSprite_Y[index] + Y1 + 16; // relative y + master y
			++index4;
			SPRITES[index4] = MetaSprite_Tile_Right[index + state4] + 32; // tile numbers
			++index4;
			SPRITES[index4] = MetaSprite_Attrib_Right[index]; // attributes, all zero here
			++index4;
			SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
			++index4;
		}
	}
	else
	{ // left
		for (index = 0; index < 4; ++index)
		{
			SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
			++index4;
			SPRITES[index4] = MetaSprite_Tile_Left[index + state4]; // tile numbers
			++index4;
			SPRITES[index4] = MetaSprite_Attrib_Left[index]; // attributes, all zero here
			++index4;
			SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
			++index4;
			SPRITES[index4] = MetaSprite_Y[index] + Y1 + 16; // relative y + master y
			++index4;
			SPRITES[index4] = MetaSprite_Tile_Left[index + state4] + 32; // tile numbers
			++index4;
			SPRITES[index4] = MetaSprite_Attrib_Left[index]; // attributes, all zero here
			++index4;
			SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
			++index4;
		}
	}
}

void Collision_Down(void)
{
	if (NametableB == 0)
	{ // first collision map
		temp = C_MAP[collision_Index];
		collision += PLATFORM[temp];
	}
	else
	{ // second collision map
		temp = C_MAP2[collision_Index];
		collision += PLATFORM[temp];
	}
}
void move_logic(void)
{
	if ((joypad1 & (RIGHT | LEFT)) == 0)
	{ // no L or R
		walk_count = 0;
		// apply friction, if no L or R
		if (X_speed >= 0)
		{ // if positive, going right
			if (X_speed >= 4)
			{
				X_speed -= 4;
			}
			else
			{
				X_speed = 0; // just stop
			}
		}
		else
		{ // going left
			if (X_speed <= (-4))
			{ // -4
				X_speed += 4;
			}
			else
			{
				X_speed = 0; // just stop
			}
		}
	}

	if ((joypad1 & RIGHT) != 0)
	{
		++walk_count;
		direction = 0;
		if (X_speed >= 0)
		{ // going right
			X_speed += 2;
		}
		else
		{				  // going left
			X_speed += 8; // just stop
			if (X_speed >= 0)
				X_speed = 0;
		}
	}

	if ((joypad1 & LEFT) != 0)
	{
		++walk_count;
		direction = 1;
		if (X_speed <= 0)
		{ // was <, produced error, couldn't go left
			X_speed -= 2;
		}
		else
		{				  // going right
			X_speed -= 8; //just stop
			if (X_speed < 0)
				X_speed = 0;
		}
	}

	// collision check, platform

	// first check the bottom left corner of character
	// which nametable am I in?
	NametableB = Nametable;
	Scroll_Adjusted_X = (X1 + Horiz_scroll + 3); // left
	high_byte = Scroll_Adjusted_X >> 8;
	if (high_byte != 0)
	{					 // if H scroll + Sprite X > 255, then we should use
		++NametableB;	// the other nametable's collision map
		NametableB &= 1; // keep it 0 or 1
	}
	collision = 0;
	collisionBot = 0;
	// we want to find which metatile in the collision map this point is in...is it solid?
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 32) & 0xf0)); //bottom left
	Collision_Down();
	collisionBot += collision;										  // if on platform, ++collision
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top left
	Collision_Down();
	NametableB = Nametable;
	Scroll_Adjusted_X = (X1 + Horiz_scroll + 13); // left
	high_byte = Scroll_Adjusted_X >> 8;
	if (high_byte != 0)
	{					 // if H scroll + Sprite X > 255, then we should use
		++NametableB;	// the other nametable's collision map
		NametableB &= 1; // keep it 0 or 1
	}
	collisionOld = collision;
	collision = 0;
	// we want to find which metatile in the collision map this point is in...is it solid?
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 32) & 0xf0)); //bottom right
	Collision_Down();														 // if on platform, ++collision
	collisionBot += collision;
	collision = collisionOld + collision;
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top right
	Collision_Down();												  // if on platform, ++collision
	if (collision >= 50)
	{
		Y1 = 0x70;
		Horiz_scroll = 0x80;
		NametableB = Nametable;
		--lives;
		if (lives == 0) {
			NMI_flag = 0;
			while (NMI_flag == 0); // wait till v-blank
			Game_Mode = GAME_OVER_MODE;
			

			All_Off(); // turn off screen
			Draw_Death();
			
			X1 = 0x80; // starting position
			Y1 = 0x70; // middle of screen
			Set_Sprite_Zero();
			PPU_CTRL = 0x90; // rightward increments to PPU
			Load_Palette();
			Reset_Scroll();
			
			setupAudio();
			Wait_Vblank();
			All_On(); // turn on screen
		}
		return;
	} // if on platform, ++collision

	if (Y_speed >= 0)
	{
		if ((Y1 & 0x0f) > 1) // only platform collide if nearly aligned to a metatile
			collisionBot = 0;

		if (collisionBot == 0)
		{
			Y_speed += 4; // gravity
		}
		else
		{
			Y_speed = 0; // collision = stop falling
			Y1 &= 0xf0;  // align to the metatile
		}
	}
	else
	{
		Y_speed += 4;
		if (collision < 5 && collision > 0)
		{
			Y_speed = 1;
			Y1 += 2;
		}
	}

	// Jump - we already figured if we are on a platform, only jump if on a platform
	if (collision > 0)
	{
		if (((joypad1 & A_BUTTON) != 0) && ((joypad1old & A_BUTTON) == 0))
		{
			Y_speed = -0x68; // 0xc8
			if (collision > 0)
			{
				audioBeep();
			}
		}
	}


	// max speeds
	if (X_speed >= 0)
	{ // going right
		if (X_speed > 0x20)
			X_speed = 0x20;
	}
	else
	{
		if (X_speed < -0x20)
			X_speed = -0x20; // -0x20
	}

	if (Y_speed >= 0)
	{
		if (Y_speed > 0x20)
			Y_speed = 0x20;
	}

	// move
	Horiz_scroll_Old = Horiz_scroll;
	if (X_speed != 0)
	{
		// move player
		Horiz_scroll_Old = Horiz_scroll;
		Horiz_scroll += (X_speed >> 4); // use the high nibble
		// which nametable am I in?
		NametableB = Nametable;
		Scroll_Adjusted_X = (X1 + Horiz_scroll + (X_speed < 0 ? 3 : 13)); // left
		high_byte = Scroll_Adjusted_X >> 8;
		if (high_byte != 0)
		{					 // if H scroll + Sprite X > 255, then we should use
			++NametableB;	// the other nametable's collision map
			NametableB &= 1; // keep it 0 or 1
		}
		// we want to find which metatile in the collision map this point is in...is it solid?
		collision = 0;																				   // if on platform, ++collision
		collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 31) & 0xf0)); //top left if on ground / falling, bottom left if in air
		Collision_Down();
		collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 16) & 0xf0)); //top left if on ground / falling, bottom left if in air
		Collision_Down();
		collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top left if on ground / falling, bottom left if in air
		Collision_Down();
		if (collision > 0)
		{
			Horiz_scroll = Horiz_scroll_Old;
			X_speed = 0;
		}
		else
		{
			if (X_speed >= 0)
			{										 // going right
				if (Horiz_scroll_Old > Horiz_scroll) { // if pass 0, switch nametables
					++Nametable;
					++Room;
				}
			}
			else
			{ // going left
				if (Horiz_scroll_Old < Horiz_scroll) {
					++Nametable; // if pass 0, switch nametables
					--Room;
				}
			}
		}
	}

	Nametable &= 1; // keep it 1 or 0
	Room &= 3;		// keep it 0-3

	if (Y_speed >= 0)
	{						  // positive = falling
		Y1 += (Y_speed >> 4); // use the high nibble
	}
	else
	{						  // jumping
		Y1 += (Y_speed >> 4); // use the high nibble
	}

	if (walk_count > 0x15) // walk_count forced 0-29
		walk_count = 0;

	state = Walk_Moves[(walk_count >> 2)]; // if not jumping
	if (X_speed == 0 && Y_speed == 0) 
		state = 2;
	if (Y_speed < 0) // negative = jumping
		state = 5;
	if (Y_speed > 0) // negative = jumping
		state = 6;
}

// do 4 columns, 1 at every 0x20 pixel moves. do half, then half.
void Do_Buffer(void)
{ // puts from cmap to buffer

	Buffer_Tiles();

	Horiz_scroll_Plus += 0x10;

	Buffer_Tiles2();

	Horiz_scroll_Plus -= 0x10;
}

void Do_Buffer2(void)
{ // first pass
	if (Nametable_Plus == 0)
	{ // write to right screen
		PPU_ADDRESS_High = 0x24;
	}
	else
	{ // write to the left screen
		PPU_ADDRESS_High = 0x20;
	}
	PPU_ADDRESS_Low = ((Horiz_scroll_Plus & 0xf0) >> 3) + 0x80; // +80 because we're skipping the top
	PPU_ADDRESS = PPU_ADDRESS_High;
	PPU_ADDRESS = PPU_ADDRESS_Low;
	Super_Fast_Write_PPU();
}

void Do_Buffer3(void)
{ // second pass
	if (Nametable_Plus == 0)
	{ // write to right screen
		PPU_ADDRESS_High = 0x24;
	}
	else
	{ // write to the left screen
		PPU_ADDRESS_High = 0x20;
	}
	PPU_ADDRESS_Low = ((Horiz_scroll_Plus & 0xf0) >> 3) + 0x80; // +80 because we're skipping the top
	PPU_ADDRESS = PPU_ADDRESS_High;
	PPU_ADDRESS = PPU_ADDRESS_Low;
	Super_Fast_Write_PPU2();
}

// note, screen is off, this only runs at startup
void Draw_Background(void)
{
	// load the collisions map into the RAM
	memcpy(C_MAP, L1, 240);
	memcpy(C_MAP2, L2, 240);

	// these bits draws the background 2 columns at a time
	Nametable_Plus = 1;
	PPU_CTRL = 4; // sets to downward increments when writing to PPU
	for (A = 0; A < 8; ++A)
	{
		Do_Buffer();  // fill buffer
		Do_Buffer2(); // draw to ppu
		Horiz_scroll_Plus += 0x10;
		Do_Buffer3(); // draw to ppu
		Horiz_scroll_Plus += 0x10;
	}
	--Nametable_Plus;
	for (A = 0; A < 8; ++A)
	{
		Do_Buffer();  // fill buffer
		Do_Buffer2(); // draw to ppu
		Horiz_scroll_Plus += 0x10;
		Do_Buffer3(); // draw to ppu
		Horiz_scroll_Plus += 0x10;
	}
}

void Set_Sprite_Zero(void)
{
	SPRITE_ZERO[0] = 0x15; // y
	SPRITE_ZERO[1] = 0x9C; // tile
	SPRITE_ZERO[2] = 0;	// attributes
	SPRITE_ZERO[3] = 0x13; // x
}

void Load_HUD(void)
{
	PPU_ADDRESS = 0x20;
	PPU_ADDRESS = 0x42;
	for (index = 0; index < sizeof(HUD); ++index)
	{
		PPU_DATA = HUD[index] + 32;
	}
}

/*	I split these up, so that we don't have too many
 *	things happening at the same time and run into the
 *	next frame, which would slowdown, and potentially
 *	glitch our screen, since our sprite zero scroll would
 *	still be in effect when the PPU goes to render the HUD
 */
void Should_We_Buffer(void)
{
	if (direction == 0)
	{ // right
		if ((Horiz_scroll_Plus & 0x1e) == 0x02)
		{ // it was == 0
			Buffer_Tiles();
			++PPU_flag;
		}
		if ((Horiz_scroll_Plus & 0x1e) == 0x10)
		{
			Buffer_Tiles2();
			++PPU_flag2;
		}
	}
}
void Draw_Death(void)
{
	PPU_ADDRESS = 0x20; // address of nametable #0 = 0x2000
	PPU_ADDRESS = 0x00;
	UnRLE(death); // uncompresses our data

	// attribute table HUD
	PPU_ADDRESS = 0x27;
	PPU_ADDRESS = 0xc0;
	for (index = 0; index < 8; ++index)
	{
		PPU_DATA = 0xff;
	}
}
void Draw_Title(void)
{
	PPU_ADDRESS = 0x20; // address of nametable #0 = 0x2000
	PPU_ADDRESS = 0x00;
	UnRLE(Title); // uncompresses our data

	// attribute table HUD
	PPU_ADDRESS = 0x27;
	PPU_ADDRESS = 0xc0;
	for (index = 0; index < 8; ++index)
	{
		PPU_DATA = 0xff;
	}
}
// this function gets new data to put in the collision map
// as we go right it fetches 2 columns of data at a time
// each byte of data is a 16x16 square on the screen

void New_Room(void)
{ // left column
	RoomB = RoomPlus + 1;
	RoomB &= 3;					 // keep it 0-3, we only have 4 rooms
	Room_Address = ROOMS[RoomB]; // get the address of the room data
	A = Horiz_scroll_Plus >> 4;
	if (Nametable_Plus == 0)
	{ // load to right cmap
		for (index = 0; index < 15; ++index)
		{
			C_MAP2[A] = Room_Address[A];
			A += 0x10;
		}
	}
	else
	{ // load to the left cmap
		for (index = 0; index < 15; ++index)
		{
			C_MAP[A] = Room_Address[A];
			A += 0x10;
		}
	}

	// second column
	// Room_Address = ROOMS[RoomB]; //duplicate
	A = (Horiz_scroll_Plus + 0x10) >> 4;
	if (Nametable_Plus == 0)
	{ // load to right cmap
		for (index = 0; index < 15; ++index)
		{
			C_MAP2[A] = Room_Address[A];
			A += 0x10;
		}
	}
	else
	{ // load to the left cmap
		for (index = 0; index < 15; ++index)
		{
			C_MAP[A] = Room_Address[A];
			A += 0x10;
		}
	}
}
