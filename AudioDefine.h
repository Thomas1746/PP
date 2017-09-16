//AudioDefine.c

#ifndef AudioDefine
#define AudioDefine

#define NOTE_Ab2	0xE0
#define OCT_Ab2 	0x03
#define NOTE_A2 	0xA0
#define OCT_A20 	0x03
#define NOTE_Bb2	0x80
#define OCT_Bb2		0x03
#define NOTE_B2		0x3E
#define OCT_B2		0x03
#define NOTE_C3		0x0C
#define OCT_C3		0x03
#define NOTE_Db3	0xE3
#define OCT_Db3		0x02
#define NOTE_D3		0xB3
#define OCT_D3		0x02
#define NOTE_Eb3	0x92
#define OCT_Eb3		0x02
#define NOTE_E3		0x6F
#define OCT_E3		0x02
#define NOTE_F3		0x4C
#define OCT_F3		0x02
#define NOTE_Gb3	0x29
#define OCT_Gb3		0x02
#define NOTE_G3		0x0A
#define OCT_G3		0x02
#define NOTE_Ab3	0xEE
#define OCT_Ab3		0x01
#define NOTE_A3		0xD2
#define OCT_A3		0x01
#define NOTE_Bb3	0xB7
#define OCT_Bb3		0x01
#define NOTE_B3		0x9F
#define OCT_B3		0x01
#define NOTE_C4		0x88
#define OCT_C4		0x01
#define NOTE_Db4	0x70
#define OCT_Db4		0x01
#define NOTE_D4		0x5B
#define OCT_D4		0x01
#define NOTE_Eb4	0x48
#define OCT_Eb4		0x01
#define NOTE_E4		0x36
#define OCT_E4		0x01
#define NOTE_F4		0x24
#define OCT_F4		0x01
#define NOTE_Gb4	0x14
#define OCT_Gb4		0x01
#define NOTE_G4		0x05
#define OCT_G4		0x03
#define NOTE_Ab4	0xF6
#define OCT_Ab4		0x00
#define NOTE_A4		0xE8
#define OCT_A4		0x00
#define NOTE_Bb4	0xDB
#define OCT_Bb4		0x00
#define NOTE_B4		0xCF
#define OCT_B4		0x00
#define NOTE_C5		0xC3
#define OCT_C5		0x00
#define NOTE_Db5	0xB8
#define OCT_Db5		0x00
#define NOTE_D5		0xAF
#define OCT_D5		0x00
#define NOTE_Eb5	0xA4
#define OCT_Eb5		0x00
#define NOTE_E5		0x9B
#define OCT_E5		0x00
#define NOTE_F5		0x92
#define OCT_F5		0x00
#define NOTE_Gb5	0x8B
#define OCT_Gb5		0x00
#define NOTE_Ab5	0x7B
#define OCT_Ab5		0x00


typedef unsigned char uchar;

void setupAudio(void);
void audioUpdate(void);
void audioBeep(void);
void playScale(void);

#endif
