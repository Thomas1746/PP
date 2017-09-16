//AudioEngine.c

#include "AudioDefine.h"

void setupAudio()
{
	//start audio
	*((unsigned char*)0x4015) = 0x0f;
}

void audioUpdate()
{
}

void audioBeep() 
{
	//Quick beep –
	if ((joypad1 & A_BUTTON) != 0){
	*((unsigned char*)0x4000) = 0x0f;
	*((unsigned char*)0x4003) = 0x01;
	}
}

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
