//AudioEngine.c

typedef unsigned char uchar;

void setupAudio(void);
void audioUpdate(void);
void audioBeep(void);

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
