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
	if(currentState == SONG_TEST)
	{
		//songTest();
		bossaSong();
	}
}

void songTest()
{
	if(currentTick >= 15)
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
			//isSneezing = 1;
		} 
		//else isSneezing = false;
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
	if(note >= NOTE_CHOICE_MAX) return;
	voice *= 4;
	//volume, cycle, loop, and duty
	*((unsigned char*)(0x4000 + voice)) = 0x0f | melodyOneTone;
	*((unsigned char*)(0x4001 + voice)) = 0x00;
	*((unsigned char*)(0x4002 + voice)) = notes[note];
	if(note < 5) 		*((unsigned char*)(0x4003 + voice)) = 0x13;
	else if(note < 12) 	*((unsigned char*)(0x4003 + voice)) = 0x12;
	else if(note < 24) 	*((unsigned char*)(0x4003 + voice)) = 0x11;
	else 				*((unsigned char*)(0x4003 + voice)) = 0x10;
}

void playTri(uchar note)
{
	if(note >= NOTE_CHOICE_MAX) return;
	*((unsigned char*)0x4008) = 0x7f;
	*((unsigned char*)0x400a) = notes[note];
	if(note < 5) 		*((unsigned char*)0x400b) = 0x03 | bassLen;
	else if(note < 12) 	*((unsigned char*)0x400b) = 0x02 | bassLen;
	else if(note < 24) 	*((unsigned char*)0x400b) = 0x01 | bassLen;
	else 				*((unsigned char*)0x400b) = 0x00 | bassLen;
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

void bossaSong()
{
	if(currentTick == 12) 
	{
		currentTick = 0;

		switch(currentBar)
		{
			///////////////verse///////////////
			case 0:
			case 4:
			case 12:
			melodyOneTone = 0x80;
			if(currentSemiQ == bossaBassA[bossaBassPos][1]){
				playTri(bossaBassA[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyA[bossaMelodyAPos][1]){
				playSquare(bossaMelodyA[bossaMelodyAPos][0], SQUARE_ONE);
				++bossaMelodyAPos;
			}
			break;

			case 1:
			case 5:
			case 13:
			if(currentSemiQ == bossaBassA[bossaBassPos][1]){
				playTri(bossaBassA[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyB[bossaMelodyAPos][1])
			{
				playSquare(bossaMelodyB[bossaMelodyAPos][0], SQUARE_ONE);
				++bossaMelodyAPos;
			}
			break;

			case 2:
			case 6:
			case 14:
			if(currentSemiQ == bossaBassB[bossaBassPos][1]){
				playTri(bossaBassB[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyC[bossaMelodyCPos][1])
			{
				playSquare(bossaMelodyC[bossaMelodyCPos][0], SQUARE_ONE);
				++bossaMelodyCPos;
			}
			break;

			case 3:
			case 7:
			case 15:
			if(currentSemiQ == bossaBassA[bossaBassPos][1]){
				playTri(bossaBassA[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyD[bossaMelodyDPos][1])
			{
				playSquare(bossaMelodyD[bossaMelodyDPos][0], SQUARE_ONE);
				++bossaMelodyDPos;
			}
			break;

			///////////////bridge///////////////
			case 8:
			case 10:
			melodyOneTone = 0x40;
			if(currentSemiQ == bossaBassC[bossaBassPos][1]){
				playTri(bossaBassC[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyE[bossaMelodyEPos][1])
			{
				playSquare(bossaMelodyE[bossaMelodyEPos][0], SQUARE_ONE);
				++bossaMelodyEPos;
			}
			break;
			case 9:
			if(currentSemiQ == bossaBassD[bossaBassPos][1]){
				playTri(bossaBassD[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyF[bossaMelodyFPos][1])
			{
				playSquare(bossaMelodyF[bossaMelodyFPos][0], SQUARE_ONE);
				++bossaMelodyFPos;
			}
			break;
			
			case 11:
			if(currentSemiQ == bossaBassE[bossaBassPos][1]){
				playTri(bossaBassE[bossaBassPos][0]);
				++bossaBassPos;
			}
			if(currentSemiQ == bossaMelodyG[bossaMelodyGPos][1])
			{
				playSquare(bossaMelodyG[bossaMelodyGPos][0], SQUARE_ONE);
				++bossaMelodyGPos;
			}
			break;
		}

		if(currentSemiQ == 0)
		{
			sneezeSound();
			isSneezing = 1;
		} else {
			isSneezing = 0;
		}
		//loops
		if(bossaBassPos >= 8) bossaBassPos = 0;
		if(bossaMelodyAPos >= 8) bossaMelodyAPos = 0;
		if(bossaMelodyCPos >= 5) bossaMelodyCPos = 0;
		if(bossaMelodyDPos >= 3) bossaMelodyDPos = 0;
		if(bossaMelodyEPos >= 9) bossaMelodyEPos = 0;
		if(bossaMelodyFPos >= 7) bossaMelodyFPos = 0;
		if(bossaMelodyGPos >= 5) bossaMelodyGPos = 0;

		if((currentBar == 0 || currentBar == 1 || currentBar == 3))
		{
			if(currentSemiQ == bossaMelodyB[bossaMelodyAPos][1] && currentBar == 1)
			{
				playSquare(bossaMelodyB[bossaMelodyAPos][0], SQUARE_ONE);
				++bossaMelodyAPos;
				if(bossaMelodyAPos >= 8) bossaMelodyAPos = 0; //loop
			}
		}
		
		++currentSemiQ;
		if(currentSemiQ == 16)
		{
			currentSemiQ = 0;
			++currentBar;
			if(currentBar == 16) currentBar = 0;
		}
	}
}
