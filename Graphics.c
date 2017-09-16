#include "DEFINE.c"
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
void Clear_Sprite_Zero(void)
{
	SPRITE_ZERO[1] = 0x00; // tile
	for (index = 0; index < 64; ++index)
	{
		SPRITES[index] = 0x00;
	}
}

void Set_Sprite_Zero(void)
{
	SPRITE_ZERO[0] = 0x15; // y
	SPRITE_ZERO[1] = 0x9C; // tile
	SPRITE_ZERO[2] = 0x20;	// attributes
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
	Clear_Sprite_Zero();
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
	Clear_Sprite_Zero();
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