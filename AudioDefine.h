//AudioDefine.c

#ifndef AudioDefine
#define AudioDefine

typedef unsigned char uchar;

uchar currentNote = 0;
uchar currentTick = 0;
uchar currentBar = 0;
uchar currentBeat = 0;
uchar currentSemiQ = 0;

bool isSneezing = 0;

enum {
	Ab2, A2, Bb2, B2, C3, Db3, D3, Eb3, E3, F3,
	Gb3, G3, Ab3, A3, Bb3, B3, C4, Db4, D4, Eb4, 
	E4, F4, Gb4, G4, Ab4, A4, Bb4, B4, C5, Db5, 
	D5, Eb5, E5, F5, Gb5, NOTE_CHOICE_MAX
};

enum {SQUARE_ONE, SQUARE_TWO};

// 0 - 4 is 03
// 5 - 11 is 02
// 12 - 23 is 01
// 24 - 35 is 0
uchar notes[] = {
	0xE0, 0xA0, 0x80, 0x3E, 0x0C, 0xE3, 0xB3, 0x92, 0x6F, 0x4C,
	0x29, 0x0A, 0xEE, 0xD2, 0xB7, 0x9F, 0x88, 0x70, 0x5B, 0x48,
	0x36, 0x24, 0x14, 0x05, 0xF6, 0xE8, 0xDB, 0xCF, 0xC3, 0xB8, 
	0xAF, 0xA4, 0x9B, 0x92, 0x8B
};

void setupAudio(void);
void audioUpdate(void);
void audioBeep(void);
void playSquare(uchar /*note*/, uchar /*voice*/);
void playTri(uchar /*note*/);
void playNoise(uchar /*note*/);
void sneezeSound(void);

#endif
