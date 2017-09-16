//AudioEngine.c

#include "AudioDefine.h"

uchar bassLine[] = {D3, A2, D3, A2};
uchar bassNote = 0;

void setupAudio()
{
	//start audio
	*((unsigned char*)0x4015) = 0x0f;
}

void audioUpdate()
{
	++currentTick;
	if(currentTick >= 24)
	{
		currentTick = 0;
		++bassNote;
		playSquare(bassLine[bassNote], SQUARE_ONE);
		
		if(bassNote > 3) 
		{
			bassNote = 0;
		}
		if(bassNote == 1)
		{
			sneezeSound();
			isSneezing = 1;
		} 
		else isSneezing = false;
		
	}
}
  
void audioBeep() 
{
	//Quick beep –
	if ((joypad1 & A_BUTTON) != 0){
	*((unsigned char*)0x4000) = 0x0f;
	*((unsigned char*)0x4003) = 0x01;
	}
}

//to change note len introduce |

void playSquare(uchar note, uchar voice)
{
	voice *= 4;
	*((unsigned char*)(0x4000 + voice)) = 0x8f;
	*((unsigned char*)(0x4001 + voice)) = 0x00;
	*((unsigned char*)(0x4002 + voice)) = notes[note];
	if(note < 5) 		*((unsigned char*)(0x4003 + voice)) = 0x13;
	else if(note < 12) 	*((unsigned char*)(0x4003 + voice)) = 0x12;
	else if(note < 24) 	*((unsigned char*)(0x4003 + voice)) = 0x11;
	else 				*((unsigned char*)(0x4003 + voice)) = 0x10;
}

void playTri(uchar note)
{
	*((unsigned char*)0x4008) = 0x7f;
	*((unsigned char*)0x400a) = notes[note];
	if(note < 5) 		*((unsigned char*)0x400b) = 0x13;
	else if(note < 12) 	*((unsigned char*)0x400b) = 0x12;
	else if(note < 24) 	*((unsigned char*)0x400b) = 0x11;
	else 				*((unsigned char*)0x400b) = 0x10;
}

void playNoise(uchar note)
{
	*((uchar*)0x400c) = 0x0f;
	*((uchar*)0x400e) = note | 0x40;
	*((uchar*)0x400f) = 0xF8;
}

void sneezeSound()
{
	*((uchar*)0x400c) = 0x0f;
	*((uchar*)0x400e) = 13 | 0x40;
	*((uchar*)0x400f) = 0xF0;
}
