#include "DEFINE.c"
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
		playSpikes();
		--lives;
		if (lives == 0)
		{
			NMI_flag = 0;
			while (NMI_flag == 0)
				; // wait till v-blank
			Game_Mode = GAME_OVER_MODE;
			audioReset();
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
		} else {
			NMI_flag = 0;
			while (NMI_flag == 0)
				; // wait till v-blank
			audioReset();
			// init game mode
			All_Off();		 // turn off screen
			PPU_CTRL = 0x90; // rightward increments to PPU
			Load_HUD();
			
			Set_Sprite_Zero();
			Draw_Background();
			X1 = 0x80; // starting position
			Y1 = 0x70; // middle of screen
			Reset_Scroll();
	
			// was All_On(); changed to...
			PPU_CTRL = 0x91;
			Room = 0;
			Nametable = 0;
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
	if (collisionBot > 0)
	{
		if (isSneezing)
		{
			Y_speed = -0x68; // 0xc8
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
	X1_Old = X1;
	if (X_speed > 0)
	{
		if (X1 < 0x80)
		{
			X1 += (X_speed >> 4); // use the high nibble
			if (X1 > 0x80)
				X1 = 0x80;
		}
		else
		{
			Horiz_scroll += (X_speed >> 4); // use the high nibble
		}
	}
	else
	{						  // going left
		X1 += (X_speed >> 4); // use the high nibble
		if (X1 > 0xc0)
			X1 = 0;
	}
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
	collision = 0;															 // if on platform, ++collision
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 31) & 0xf0)); //top left if on ground / falling, bottom left if in air
	Collision_Down();
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 16) & 0xf0)); //top left if on ground / falling, bottom left if in air
	Collision_Down();
	collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top left if on ground / falling, bottom left if in air
	Collision_Down();
	if (collision > 0)
	{
		X_speed = 0;
		X1 = X1_Old;
		Horiz_scroll = Horiz_scroll_Old;
	}
	else
	{
		// going right
		if (Horiz_scroll_Old > Horiz_scroll)
		{ // if pass 0, switch nametables
			++Nametable;
			++Room;
		}
	}

	Nametable &= 1; // keep it 1 or 0
	Room %= NUM_LEVELS;		// keep it 0-3

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
		state = 7;
	if (Y_speed > 0) // negative = jumping
		state = 6;
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