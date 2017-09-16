;
; File generated by cc65 v 2.16 - Git cdca644
;
	.fopt		compiler,"cc65 v 2.16 - Git cdca644"
	.setcpu		"6502"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.export		_NMI_flag
	.export		_Frame_Count
	.export		_index
	.export		_index4
	.export		_X1
	.export		_Y1
	.export		_state
	.export		_state4
	.export		_joypad1
	.export		_joypad1old
	.export		_joypad1test
	.export		_joypad2
	.export		_joypad2old
	.export		_joypad2test
	.export		_Horiz_scroll
	.export		_Horiz_scroll_Old
	.export		_Scroll_Adjusted_X
	.export		_Game_Mode
	.export		_Nametable
	.export		_NametableB
	.export		_walk_count
	.export		_X_speed
	.export		_Y_speed
	.export		_direction
	.export		_collision_Index
	.export		_high_byte
	.export		_collision
	.export		_collisionBot
	.export		_collisionOld
	.export		_temp
	.export		_SPRITES
	.export		_C_MAP
	.export		_C_MAP2
	.export		_HUD
	.export		_HUD2
	.export		_N1
	.export		_N2
	.export		_C1
	.export		_C2
	.export		_Title
	.export		_PLATFORM
	.export		_PALETTE
	.export		_Walk_Moves
	.export		_MetaSprite_Y
	.export		_MetaSprite_Tile_R
	.export		_MetaSprite_Attrib_R
	.export		_MetaSprite_X
	.export		_MetaSprite_Tile_L
	.export		_MetaSprite_Attrib_L
	.export		_Rotate_Palette
	.export		_All_Off
	.export		_All_On
	.export		_Reset_Scroll
	.export		_Load_Palette
	.export		_update_Sprites
	.export		_Collision_Down
	.export		_move_logic
	.export		_Draw_Background
	.export		_Draw_Title
	.import		_memcpy
	.import		_Wait_Vblank
	.import		_UnRLE
	.import		_Get_Input
	.export		_setupAudio
	.export		_audioUpdate
	.export		_audioBeep
	.export		_playScale
	.export		_main
	.export		_Palette_Fade

.segment	"RODATA"

_HUD:
	.byte	$53,$43,$4F,$52,$45,$3A,$00
_HUD2:
	.byte	$4C,$49,$56,$45,$53,$3A,$00
_N1:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$42
	.byte	$02
	.byte	$01
	.byte	$0D
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$01
	.byte	$1D
	.byte	$0B
	.byte	$0C
	.byte	$02
	.byte	$01
	.byte	$1D
	.byte	$1B
	.byte	$1C
	.byte	$02
	.byte	$01
	.byte	$2F
	.byte	$F0
	.byte	$01
	.byte	$06
	.byte	$00
	.byte	$01
	.byte	$11
	.byte	$50
	.byte	$01
	.byte	$02
	.byte	$00
	.byte	$40
	.byte	$50
	.byte	$50
	.byte	$00
	.byte	$05
	.byte	$55
	.byte	$45
	.byte	$55
	.byte	$51
	.byte	$50
	.byte	$15
	.byte	$00
	.byte	$54
	.byte	$51
	.byte	$54
	.byte	$55
	.byte	$55
	.byte	$05
	.byte	$45
	.byte	$F0
	.byte	$F5
	.byte	$F5
	.byte	$35
	.byte	$F5
	.byte	$F1
	.byte	$F0
	.byte	$F0
	.byte	$0F
	.byte	$01
	.byte	$02
	.byte	$03
	.byte	$0F
	.byte	$01
	.byte	$02
	.byte	$0F
	.byte	$01
	.byte	$00
_N2:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$90
	.byte	$14
	.byte	$01
	.byte	$09
	.byte	$00
	.byte	$01
	.byte	$15
	.byte	$14
	.byte	$01
	.byte	$09
	.byte	$00
	.byte	$01
	.byte	$8D
	.byte	$05
	.byte	$06
	.byte	$01
	.byte	$09
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$13
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$09
	.byte	$17
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$09
	.byte	$17
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$01
	.byte	$05
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$09
	.byte	$17
	.byte	$00
	.byte	$01
	.byte	$13
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$08
	.byte	$14
	.byte	$01
	.byte	$05
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$08
	.byte	$14
	.byte	$01
	.byte	$05
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$09
	.byte	$0A
	.byte	$00
	.byte	$01
	.byte	$13
	.byte	$18
	.byte	$19
	.byte	$01
	.byte	$09
	.byte	$1A
	.byte	$00
	.byte	$01
	.byte	$0B
	.byte	$02
	.byte	$01
	.byte	$80
	.byte	$00
	.byte	$01
	.byte	$20
	.byte	$50
	.byte	$01
	.byte	$02
	.byte	$00
	.byte	$01
	.byte	$04
	.byte	$55
	.byte	$55
	.byte	$15
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$F0
	.byte	$F0
	.byte	$F5
	.byte	$01
	.byte	$02
	.byte	$F0
	.byte	$01
	.byte	$02
	.byte	$0F
	.byte	$01
	.byte	$07
	.byte	$01
	.byte	$00
_C1:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$0C
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
_C2:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$03
	.byte	$04
	.byte	$04
	.byte	$04
	.byte	$04
	.byte	$05
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$06
	.byte	$07
	.byte	$07
	.byte	$07
	.byte	$07
	.byte	$08
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$06
	.byte	$07
	.byte	$07
	.byte	$07
	.byte	$07
	.byte	$02
	.byte	$02
	.byte	$02
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$09
	.byte	$0A
	.byte	$0A
	.byte	$0A
	.byte	$0A
	.byte	$0B
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
_Title:
	.byte	$01
	.byte	$00
	.byte	$01
	.byte	$FE
	.byte	$00
	.byte	$01
	.byte	$08
	.byte	$05
	.byte	$06
	.byte	$01
	.byte	$0D
	.byte	$07
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$0D
	.byte	$17
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$15
	.byte	$16
	.byte	$01
	.byte	$0D
	.byte	$17
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$18
	.byte	$19
	.byte	$01
	.byte	$0D
	.byte	$1A
	.byte	$00
	.byte	$01
	.byte	$D1
	.byte	$70
	.byte	$92
	.byte	$85
	.byte	$93
	.byte	$93
	.byte	$00
	.byte	$00
	.byte	$73
	.byte	$94
	.byte	$81
	.byte	$92
	.byte	$94
	.byte	$00
	.byte	$01
	.byte	$72
	.byte	$70
	.byte	$85
	.byte	$97
	.byte	$94
	.byte	$85
	.byte	$92
	.byte	$00
	.byte	$70
	.byte	$89
	.byte	$87
	.byte	$85
	.byte	$8F
	.byte	$8E
	.byte	$93
	.byte	$00
	.byte	$01
	.byte	$34
	.byte	$80
	.byte	$01
	.byte	$0A
	.byte	$00
	.byte	$01
	.byte	$10
	.byte	$80
	.byte	$01
	.byte	$0D
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$32
	.byte	$30
	.byte	$31
	.byte	$37
	.byte	$00
	.byte	$01
	.byte	$B4
	.byte	$00
	.byte	$01
	.byte	$00
_PLATFORM:
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$05
	.byte	$05
	.byte	$05
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$32
_PALETTE:
	.byte	$22
	.byte	$16
	.byte	$36
	.byte	$0F
	.byte	$00
	.byte	$08
	.byte	$18
	.byte	$39
	.byte	$00
	.byte	$00
	.byte	$10
	.byte	$20
	.byte	$00
	.byte	$0A
	.byte	$1A
	.byte	$2A
	.byte	$22
	.byte	$37
	.byte	$16
	.byte	$0F
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$05
	.byte	$15
_Walk_Moves:
	.byte	$00
	.byte	$01
	.byte	$00
	.byte	$02
_MetaSprite_Y:
	.byte	$00
	.byte	$00
	.byte	$08
	.byte	$08
_MetaSprite_Tile_R:
	.byte	$00
	.byte	$01
	.byte	$10
	.byte	$11
	.byte	$02
	.byte	$03
	.byte	$12
	.byte	$13
	.byte	$04
	.byte	$05
	.byte	$14
	.byte	$15
	.byte	$06
	.byte	$07
	.byte	$16
	.byte	$17
_MetaSprite_Attrib_R:
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
_MetaSprite_X:
	.byte	$00
	.byte	$08
	.byte	$00
	.byte	$08
_MetaSprite_Tile_L:
	.byte	$01
	.byte	$00
	.byte	$11
	.byte	$10
	.byte	$03
	.byte	$02
	.byte	$13
	.byte	$12
	.byte	$05
	.byte	$04
	.byte	$15
	.byte	$14
	.byte	$07
	.byte	$06
	.byte	$17
	.byte	$16
_MetaSprite_Attrib_L:
	.byte	$40
	.byte	$40
	.byte	$40
	.byte	$40
_Palette_Fade:
	.byte	$24
	.byte	$14
	.byte	$04
	.byte	$14

.segment	"BSS"

.segment	"ZEROPAGE"
_NMI_flag:
	.res	1,$00
_Frame_Count:
	.res	1,$00
_index:
	.res	1,$00
_index4:
	.res	1,$00
_X1:
	.res	1,$00
_Y1:
	.res	1,$00
_state:
	.res	1,$00
_state4:
	.res	1,$00
_joypad1:
	.res	1,$00
_joypad1old:
	.res	1,$00
_joypad1test:
	.res	1,$00
_joypad2:
	.res	1,$00
_joypad2old:
	.res	1,$00
_joypad2test:
	.res	1,$00
_Horiz_scroll:
	.res	1,$00
_Horiz_scroll_Old:
	.res	1,$00
_Scroll_Adjusted_X:
	.res	2,$00
_Game_Mode:
	.res	1,$00
_Nametable:
	.res	1,$00
_NametableB:
	.res	1,$00
_walk_count:
	.res	1,$00
_X_speed:
	.res	1,$00
_Y_speed:
	.res	1,$00
_direction:
	.res	1,$00
_collision_Index:
	.res	1,$00
_high_byte:
	.res	1,$00
_collision:
	.res	1,$00
_collisionBot:
	.res	1,$00
_collisionOld:
	.res	1,$00
_temp:
	.res	1,$00
.segment	"OAM"
_SPRITES:
	.res	256,$00
.segment	"MAP"
_C_MAP:
	.res	256,$00
_C_MAP2:
	.res	256,$00

; ---------------------------------------------------------------
; void __near__ Rotate_Palette (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Rotate_Palette: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x3f;
;
	lda     #$3F
	sta     $2006
;
; PPU_ADDRESS = 0x0b;
;
	lda     #$0B
	sta     $2006
;
; PPU_DATA = Palette_Fade[(Frame_Count >> 2) & 0x03];
;
	lda     _Frame_Count
	lsr     a
	lsr     a
	and     #$03
	sta     ptr1
	lda     #$00
	clc
	adc     #>(_Palette_Fade)
	sta     ptr1+1
	ldy     #<(_Palette_Fade)
	lda     (ptr1),y
	sta     $2007
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ All_Off (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_Off: near

.segment	"CODE"

;
; PPU_CTRL = 0;
;
	lda     #$00
	sta     $2000
;
; PPU_MASK = 0;
;
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ All_On (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_All_On: near

.segment	"CODE"

;
; PPU_CTRL = 0x90; // screen is on, NMI on
;
	lda     #$90
	sta     $2000
;
; PPU_MASK = 0x1e;
;
	lda     #$1E
	sta     $2001
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Reset_Scroll (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Reset_Scroll: near

.segment	"CODE"

;
; PPU_ADDRESS = 0;
;
	lda     #$00
	sta     $2006
;
; PPU_ADDRESS = 0;
;
	sta     $2006
;
; SCROLL = 0;
;
	sta     $2005
;
; SCROLL = 0;
;
	sta     $2005
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Load_Palette (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Load_Palette: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x3f;
;
	lda     #$3F
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; for (index = 0; index < sizeof(PALETTE); ++index)
;
	sta     _index
L0639:	lda     _index
	cmp     #$20
	bcs     L05DA
;
; PPU_DATA = PALETTE[index];
;
	ldy     _index
	lda     _PALETTE,y
	sta     $2007
;
; for (index = 0; index < sizeof(PALETTE); ++index)
;
	inc     _index
	jmp     L0639
;
; }
;
L05DA:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ update_Sprites (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_update_Sprites: near

.segment	"CODE"

;
; state4 = state << 2; // shift left 2 = multiply 4
;
	lda     _state
	asl     a
	asl     a
	sta     _state4
;
; index4 = 0;
;
	lda     #$00
	sta     _index4
;
; if (direction == 0)
;
	lda     _direction
	jne     L0649
;
; for (index = 0; index < 4; ++index)
;
	sta     _index
L0648:	lda     _index
	cmp     #$04
	bcc     L064B
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L064B:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L03E1
	inx
L03E1:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Y,y
	clc
	adc     _Y1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Tile_R[index + state4]; // tile numbers
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L03E8
	inx
L03E8:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L063B
	inx
L063B:	sta     ptr1
	txa
	clc
	adc     #>(_MetaSprite_Tile_R)
	sta     ptr1+1
	ldy     #<(_MetaSprite_Tile_R)
	lda     (ptr1),y
	ldy     #$00
	sta     (sreg),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Attrib_R[index]; // attributes, all zero here
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L03EE
	inx
L03EE:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Attrib_R,y
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L03F5
	inx
L03F5:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_X,y
	clc
	adc     _X1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;   
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1 + 16; // relative y + master y
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L03FC
	inx
L03FC:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Y,y
	clc
	adc     _Y1
	bcc     L0646
	clc
L0646:	adc     #$10
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Tile_R[index + state4]; // tile numbers
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0404
	inx
L0404:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L063E
	inx
L063E:	sta     ptr1
	txa
	clc
	adc     #>(_MetaSprite_Tile_R)
	sta     ptr1+1
	ldy     #<(_MetaSprite_Tile_R)
	lda     (ptr1),y
	ldy     #$00
	sta     (sreg),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Attrib_R[index]; // attributes, all zero here
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L040A
	inx
L040A:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Attrib_R,y
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0411
	inx
L0411:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_X,y
	clc
	adc     _X1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; for (index = 0; index < 4; ++index)
;
	inc     _index
	jmp     L0648
;
; for (index = 0; index < 4; ++index)
;
L0649:	lda     #$00
	sta     _index
L064A:	lda     _index
	cmp     #$04
	bcc     L064C
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L064C:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0421
	inx
L0421:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Y,y
	clc
	adc     _Y1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Tile_L[index + state4]; // tile numbers
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0428
	inx
L0428:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L0641
	inx
L0641:	sta     ptr1
	txa
	clc
	adc     #>(_MetaSprite_Tile_L)
	sta     ptr1+1
	ldy     #<(_MetaSprite_Tile_L)
	lda     (ptr1),y
	ldy     #$00
	sta     (sreg),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Attrib_L[index]; // attributes, all zero here
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L042E
	inx
L042E:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Attrib_L,y
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0435
	inx
L0435:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_X,y
	clc
	adc     _X1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;  
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1 + 16; // relative y + master y
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L043C
	inx
L043C:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Y,y
	clc
	adc     _Y1
	bcc     L0647
	clc
L0647:	adc     #$10
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Tile_L[index + state4]; // tile numbers
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0444
	inx
L0444:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L0644
	inx
L0644:	sta     ptr1
	txa
	clc
	adc     #>(_MetaSprite_Tile_L)
	sta     ptr1+1
	ldy     #<(_MetaSprite_Tile_L)
	lda     (ptr1),y
	ldy     #$00
	sta     (sreg),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_Attrib_L[index]; // attributes, all zero here
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L044A
	inx
L044A:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_Attrib_L,y
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;
;
	inc     _index4
;
; SPRITES[index4] = MetaSprite_X[index] + X1; // relative x + master x
;
	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0451
	inx
L0451:	sta     ptr1
	stx     ptr1+1
	ldy     _index
	lda     _MetaSprite_X,y
	clc
	adc     _X1
	ldy     #$00
	sta     (ptr1),y
;
; ++index4;  
;
	inc     _index4
;
; for (index = 0; index < 4; ++index)
;
	inc     _index
	jmp     L064A

.endproc

; ---------------------------------------------------------------
; void __near__ Collision_Down (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Collision_Down: near

.segment	"CODE"

;
; if (NametableB == 0)
;
	lda     _NametableB
	bne     L0457
;
; temp = C_MAP[collision_Index];
;
	ldy     _collision_Index
	lda     _C_MAP,y
;
; else
;
	jmp     L0652
;
; temp = C_MAP2[collision_Index];
;
L0457:	ldy     _collision_Index
	lda     _C_MAP2,y
L0652:	sta     _temp
;
; collision += PLATFORM[temp];
;
	ldy     _temp
	lda     _PLATFORM,y
	clc
	adc     _collision
	sta     _collision
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ move_logic (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_move_logic: near

.segment	"CODE"

;
; if ((joypad1 & (RIGHT | LEFT)) == 0)
;
	lda     _joypad1
	and     #$03
	bne     L0664
;
; walk_count = 0;
;
	sta     _walk_count
;
; if (X_speed >= 0)
;
	ldx     _X_speed
	bmi     L0472
;
; if (X_speed >= 4)
;
	lda     _X_speed
	sec
	sbc     #$04
	bvs     L0478
	eor     #$80
L0478:	asl     a
	lda     #$00
	bcc     L0663
;
; X_speed -= 4;
;
	lda     _X_speed
	sec
	sbc     #$04
	sta     _X_speed
	bpl     L0664
;
; else
;
	jmp     L0664
;
; if (X_speed <= (-4))
;
L0472:	lda     _X_speed
	sec
	sbc     #$FD
	bvc     L0484
	eor     #$80
L0484:	asl     a
	lda     #$00
	bcc     L0663
;
; X_speed += 4;
;
	lda     #$04
	clc
	adc     _X_speed
	sta     _X_speed
	bpl     L0664
;
; else
;
	jmp     L0664
;
; X_speed = 0;
;
L0663:	sta     _X_speed
;
; if ((joypad1 & RIGHT) != 0)
;
L0664:	lda     _joypad1
	and     #$01
	beq     L0665
;
; ++walk_count;
;
	inc     _walk_count
;
; direction = 0;
;
	lda     #$00
	sta     _direction
;
; if (X_speed >= 0)
;
	ldx     _X_speed
	bmi     L0492
;
; X_speed += 2;
;
	lda     #$02
	clc
	adc     _X_speed
	sta     _X_speed
	bpl     L0665
;
; else
;
	jmp     L0665
;
; X_speed += 8; // double friction
;
L0492:	lda     #$08
	clc
	adc     _X_speed
	sta     _X_speed
;
; if ((joypad1 & LEFT) != 0)
;
L0665:	lda     _joypad1
	and     #$02
	beq     L0667
;
; ++walk_count;
;
	inc     _walk_count
;
; direction = 1;
;
	lda     #$01
	sta     _direction
;
; if (X_speed <= 0)
;
	lda     _X_speed
	sec
	sbc     #$01
	bvc     L04A6
	eor     #$80
L04A6:	bpl     L0666
;
; X_speed -= 2;
;
	lda     _X_speed
	sec
	sbc     #$02
	sta     _X_speed
	bpl     L0667
;
; else
;
	jmp     L0667
;
; X_speed -= 8; // double friction
;
L0666:	lda     _X_speed
	sec
	sbc     #$08
	sta     _X_speed
;
; NametableB = Nametable;
;
L0667:	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 3); // left
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L065E
	inx
	clc
L065E:	adc     #$03
	bcc     L04B3
	inx
L04B3:	sta     _Scroll_Adjusted_X
	stx     _Scroll_Adjusted_X+1
;
; high_byte = Scroll_Adjusted_X >> 8;
;
	lda     _Scroll_Adjusted_X+1
	sta     _high_byte
;
; if (high_byte != 0)
;
	lda     _high_byte
	beq     L0669
;
; ++NametableB; // the other nametable's collision map
;
	inc     _NametableB
;
; NametableB &= 1; // keep it 0 or 1
;
	lda     _NametableB
	and     #$01
	sta     _NametableB
;
; collision = 0;
;
	lda     #$00
L0669:	sta     _collision
;
; collisionBot = 0;
;
	sta     _collisionBot
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 32) & 0xf0)); //bottom left
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	clc
	adc     #$20
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();
;
	jsr     _Collision_Down
;
; collisionBot += collision;            // if on platform, ++collision
;
	lda     _collision
	clc
	adc     _collisionBot
	sta     _collisionBot
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top left
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();
;
	jsr     _Collision_Down
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 13); // left
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L065F
	inx
	clc
L065F:	adc     #$0D
	bcc     L04D5
	inx
L04D5:	sta     _Scroll_Adjusted_X
	stx     _Scroll_Adjusted_X+1
;
; high_byte = Scroll_Adjusted_X >> 8;
;
	lda     _Scroll_Adjusted_X+1
	sta     _high_byte
;
; if (high_byte != 0)
;
	lda     _high_byte
	beq     L066A
;
; ++NametableB; // the other nametable's collision map
;
	inc     _NametableB
;
; NametableB &= 1; // keep it 0 or 1
;
	lda     _NametableB
	and     #$01
	sta     _NametableB
;
; collisionOld = collision;
;
L066A:	lda     _collision
	sta     _collisionOld
;
; collision = 0;
;
	lda     #$00
	sta     _collision
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 32) & 0xf0)); //bottom right
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	clc
	adc     #$20
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();               // if on platform, ++collision
;
	jsr     _Collision_Down
;
; collisionBot += collision;
;
	lda     _collision
	clc
	adc     _collisionBot
	sta     _collisionBot
;
; collision = collisionOld+collision;
;
	lda     _collisionOld
	clc
	adc     _collision
	sta     _collision
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1)&0xf0)); //top right
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();              // if on platform, ++collision
;
	jsr     _Collision_Down
;
; if (collision >= 50)
;
	lda     _collision
	cmp     #$32
	bcc     L066B
;
; Y1 = 0x70;
;
	lda     #$70
	sta     _Y1
;
; Horiz_scroll = 0x80;
;
	lda     #$80
	sta     _Horiz_scroll
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; return;
;
	rts
;
; if (Y_speed >= 0)
;
L066B:	ldx     _Y_speed
	bmi     L04FC
;
; if ((Y1 & 0x0f) > 1) // only platform collide if nearly aligned to a metatile
;
	lda     _Y1
	and     #$0F
	cmp     #$02
	bcc     L066C
;
; collisionBot = 0;
;
	lda     #$00
	sta     _collisionBot
;
; if (collisionBot == 0)
;
L066C:	lda     _collisionBot
	bne     L066D
;
; Y_speed += 4; // gravity
;
	lda     #$04
	clc
	adc     _Y_speed
	sta     _Y_speed
	bpl     L0671
;
; else
;
	jmp     L0671
;
; Y_speed = 0; // collision = stop falling
;
L066D:	lda     #$00
	sta     _Y_speed
;
; Y1 &= 0xf0;  // align to the metatile
;
	lda     _Y1
	and     #$F0
;
; else
;
	jmp     L0688
;
; Y_speed += 4;
;
L04FC:	lda     #$04
	clc
	adc     _Y_speed
	sta     _Y_speed
;
; if (collision < 5 && collision > 0)
;
	lda     _collision
	cmp     #$05
	bcs     L0671
	lda     _collision
	beq     L0671
;
; Y_speed = 1;
;
	lda     #$01
	sta     _Y_speed
;
; Y1 += 2;
;
	lda     #$02
	clc
	adc     _Y1
L0688:	sta     _Y1
;
; if (collision > 0)
;
L0671:	lda     _collision
	beq     L0675
;
; if (((joypad1 & A_BUTTON) != 0) && ((joypad1old & A_BUTTON) == 0))
;
	lda     _joypad1
	and     #$80
	beq     L0675
	lda     _joypad1old
	and     #$80
	bne     L0675
;
; Y_speed = -0x48; // 0xc8
;
	lda     #$B8
	sta     _Y_speed
;
; if(collision > 0)
;
	lda     _collision
	beq     L0675
;
; audioBeep();
;
	jsr     _audioBeep
;
; if (X_speed >= 0)
;
L0675:	ldx     _X_speed
	bmi     L052B
;
; if (X_speed > 0x20)
;
	lda     _X_speed
	sec
	sbc     #$21
	bvs     L0531
	eor     #$80
L0531:	bpl     L0676
;
; X_speed = 0x20;
;
	lda     #$20
;
; else
;
	jmp     L065C
;
; if (X_speed < (-0x20))
;
L052B:	lda     _X_speed
	sec
	sbc     #$E0
	bvc     L0539
	eor     #$80
L0539:	bpl     L0676
;
; X_speed = (-0x20); // 0xe0
;
	lda     #$E0
L065C:	sta     _X_speed
;
; if (Y_speed >= 0)
;
L0676:	ldx     _Y_speed
	bmi     L0677
;
; if (Y_speed > 0x20)
;
	lda     _Y_speed
	sec
	sbc     #$21
	bvs     L0543
	eor     #$80
L0543:	bpl     L0677
;
; Y_speed = 0x20;
;
	lda     #$20
	sta     _Y_speed
;
; if (X_speed != 0)
;
L0677:	lda     _X_speed
	jeq     L0580
;
; Horiz_scroll_Old = Horiz_scroll;
;
	lda     _Horiz_scroll
	sta     _Horiz_scroll_Old
;
; Horiz_scroll += (X_speed >> 4); // use the high nibble
;
	ldx     #$00
	lda     _X_speed
	bpl     L054E
	dex
L054E:	jsr     asrax4
	clc
	adc     _Horiz_scroll
	sta     _Horiz_scroll
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + (X_speed < 0 ? 3 : 13)); // left
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L0656
	inx
L0656:	sta     ptr1
	stx     ptr1+1
	lda     _X_speed
	asl     a
	bcc     L0678
	lda     #$03
	jmp     L0558
L0678:	lda     #$0D
L0558:	clc
	adc     ptr1
	ldx     ptr1+1
	bcc     L0657
	inx
L0657:	sta     _Scroll_Adjusted_X
	stx     _Scroll_Adjusted_X+1
;
; high_byte = Scroll_Adjusted_X >> 8;
;
	lda     _Scroll_Adjusted_X+1
	sta     _high_byte
;
; if (high_byte != 0)
;
	lda     _high_byte
	beq     L067A
;
; ++NametableB; // the other nametable's collision map
;
	inc     _NametableB
;
; NametableB &= 1; // keep it 0 or 1
;
	lda     _NametableB
	and     #$01
	sta     _NametableB
;
; collision = 0;                      // if on platform, ++collision
;
	lda     #$00
L067A:	sta     _collision
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + (Y_speed <= 0 ? 15 : 16)) & 0xf0)); //top left if on ground / falling, bottom left if in air
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y_speed
	sec
	sbc     #$01
	bvc     L056B
	eor     #$80
L056B:	bpl     L067B
	lda     #$0F
	jmp     L056E
L067B:	lda     #$10
L056E:	clc
	adc     _Y1
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();
;
	jsr     _Collision_Down
;
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1) & 0xf0)); //top left if on ground / falling, bottom left if in air
;
	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down();
;
	jsr     _Collision_Down
;
; if (collision < 5 && collision > 0)
;
	lda     _collision
	cmp     #$05
	bcs     L067F
	lda     _collision
	beq     L067F
;
; Horiz_scroll = Horiz_scroll_Old;
;
	lda     _Horiz_scroll_Old
	sta     _Horiz_scroll
;
; X_speed = 0;
;
	ldx     #$00
	stx     _X_speed
;
; else
;
	jmp     L0681
;
; if (X_speed >= 0)
;
L067F:	ldx     _X_speed
	bmi     L0581
;
; if (Horiz_scroll_Old > Horiz_scroll) // if pass 0, switch nametables
;
	lda     _Horiz_scroll_Old
	sec
	sbc     _Horiz_scroll
	bcc     L0680
	beq     L0680
;
; else
;
	jmp     L0689
;
; if (Horiz_scroll_Old < Horiz_scroll)
;
L0581:	lda     _Horiz_scroll_Old
	cmp     _Horiz_scroll
	bcs     L0680
;
; ++Nametable; // if pass 0, switch nametables
;
L0689:	inc     _Nametable
;
; Nametable &= 1; // keep it 1 or 0
;
L0680:	lda     _Nametable
	and     #$01
	sta     _Nametable
;
; Y1 += (Y_speed >> 4); // use the high nibble
;
L0580:	ldx     #$00
L0681:	lda     _Y_speed
	bpl     L0590
	dex
L0590:	jsr     asrax4
	clc
	adc     _Y1
	sta     _Y1
;
; if (walk_count > 0x1f) // walk_count forced 0-1f
;
	lda     _walk_count
	cmp     #$20
	ldx     #$00
	bcc     L0682
;
; walk_count = 0;
;
	stx     _walk_count
;
; state = Walk_Moves[(walk_count >> 3)]; // if not jumping
;
L0682:	lda     _walk_count
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	txa
	clc
	adc     #>(_Walk_Moves)
	sta     ptr1+1
	ldy     #<(_Walk_Moves)
	lda     (ptr1),y
	sta     _state
;
; if (Y_speed < 0) // negative = jumping
;
	lda     _Y_speed
	asl     a
	bcc     L0599
;
; state = 3;
;
	lda     #$03
	sta     _state
;
; }
;
L0599:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ Draw_Background (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Draw_Background: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x20; // address of nametable #0 = 0x2000
;
	lda     #$20
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; UnRLE(N1); // uncompresses our data
;
	lda     #<(_N1)
	ldx     #>(_N1)
	jsr     _UnRLE
;
; PPU_ADDRESS = 0x24; // address of nametable #1 = 0x2400
;
	lda     #$24
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; UnRLE(N2); // uncompresses our data
;
	lda     #<(_N2)
	ldx     #>(_N2)
	jsr     _UnRLE
;
; memcpy(C_MAP, C1, 240);
;
	lda     #<(_C_MAP)
	ldx     #>(_C_MAP)
	jsr     pushax
	lda     #<(_C1)
	ldx     #>(_C1)
	jsr     pushax
	ldx     #$00
	lda     #$F0
	jsr     _memcpy
;
; memcpy(C_MAP2, C2, 240);
;
	lda     #<(_C_MAP2)
	ldx     #>(_C_MAP2)
	jsr     pushax
	lda     #<(_C2)
	ldx     #>(_C2)
	jsr     pushax
	ldx     #$00
	lda     #$F0
	jmp     _memcpy

.endproc

; ---------------------------------------------------------------
; void __near__ Draw_Title (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_Draw_Title: near

.segment	"CODE"

;
; PPU_ADDRESS = 0x20; // address of nametable #0 = 0x2000
;
	lda     #$20
	sta     $2006
;
; PPU_ADDRESS = 0x00;
;
	lda     #$00
	sta     $2006
;
; UnRLE(Title); // uncompresses our data
;
	lda     #<(_Title)
	ldx     #>(_Title)
	jsr     _UnRLE
;
; PPU_ADDRESS = 0x24; // draw the HUD on opposite nametable
;
	lda     #$24
	sta     $2006
;
; PPU_ADDRESS = 0x64;
;
	lda     #$64
	sta     $2006
;
; for (index = 0; index < sizeof(HUD); ++index)
;
	lda     #$00
	sta     _index
L068A:	lda     _index
	cmp     #$07
	bcs     L068B
;
; PPU_DATA = HUD[index];
;
	ldy     _index
	lda     _HUD,y
	sta     $2007
;
; for (index = 0; index < sizeof(HUD); ++index)
;
	inc     _index
	jmp     L068A
;
; PPU_ADDRESS = 0x24;
;
L068B:	lda     #$24
	sta     $2006
;
; PPU_ADDRESS = 0x74;
;
	lda     #$74
	sta     $2006
;
; for (index = 0; index < sizeof(HUD); ++index)
;
	lda     #$00
	sta     _index
L068C:	lda     _index
	cmp     #$07
	bcs     L068D
;
; PPU_DATA = HUD2[index];
;
	ldy     _index
	lda     _HUD2,y
	sta     $2007
;
; for (index = 0; index < sizeof(HUD); ++index)
;
	inc     _index
	jmp     L068C
;
; PPU_ADDRESS = 0x27;
;
L068D:	lda     #$27
	sta     $2006
;
; PPU_ADDRESS = 0xc0;
;
	lda     #$C0
	sta     $2006
;
; for (index = 0; index < 8; ++index)
;
	lda     #$00
	sta     _index
L068E:	lda     _index
	cmp     #$08
	bcs     L062F
;
; PPU_DATA = 0xff;
;
	lda     #$FF
	sta     $2007
;
; for (index = 0; index < 8; ++index)
;
	inc     _index
	jmp     L068E
;
; }
;
L062F:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ setupAudio (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_setupAudio: near

.segment	"CODE"

;
; *((unsigned char*)0x4015) = 0x0f;
;
	lda     #$0F
	sta     $4015
;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ audioUpdate (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_audioUpdate: near

.segment	"CODE"

;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ audioBeep (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_audioBeep: near

.segment	"CODE"

;
; if ((joypad1 & A_BUTTON) != 0){
;
	lda     _joypad1
	and     #$80
	beq     L037E
;
; *((unsigned char*)0x4000) = 0x0f;
;
	lda     #$0F
	sta     $4000
;
; *((unsigned char*)0x4003) = 0x01;
;
	lda     #$01
	sta     $4003
;
; }
;
L037E:	rts

.endproc

; ---------------------------------------------------------------
; void __near__ playScale (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_playScale: near

.segment	"CODE"

;
; }
;
	rts

.endproc

; ---------------------------------------------------------------
; void __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

;
; All_Off();
;
	jsr     _All_Off
;
; Draw_Title();
;
	jsr     _Draw_Title
;
; joypad1 = 0xff; // fix a bug, reset is wiping joypad1old
;
	lda     #$FF
	sta     _joypad1
;
; Load_Palette();
;
	jsr     _Load_Palette
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; setupAudio();
;
	jsr     _setupAudio
;
; Wait_Vblank();
;
	jsr     _Wait_Vblank
;
; All_On();
;
	jsr     _All_On
;
; while (Game_Mode == TITLE_MODE)
;
	jmp     L0695
;
; while (NMI_flag == 0)
;
L068F:	lda     _NMI_flag
	beq     L068F
;
; Rotate_Palette();
;
	jsr     _Rotate_Palette
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; Get_Input();
;
	jsr     _Get_Input
;
; if (((joypad1old & START) == 0) && ((joypad1 & START) != 0))
;
	lda     _joypad1old
	and     #$10
	bne     L0698
	lda     _joypad1
	and     #$10
	beq     L0699
;
; NMI_flag = 0;
;
	lda     #$00
	sta     _NMI_flag
;
; while (NMI_flag == 0)
;
L0692:	lda     _NMI_flag
	beq     L0692
;
; All_Off();
;
	jsr     _All_Off
;
; Game_Mode = RUN_GAME_MODE;
;
	lda     #$01
	sta     _Game_Mode
;
; Draw_Background();
;
	jsr     _Draw_Background
;
; X1 = 0x80;
;
	lda     #$80
	sta     _X1
;
; Y1 = 0x70; // middle of screen
;
	lda     #$70
	sta     _Y1
;
; Load_Palette();
;
	jsr     _Load_Palette
;
; Reset_Scroll();
;
	jsr     _Reset_Scroll
;
; Wait_Vblank();
;
	jsr     _Wait_Vblank
;
; PPU_CTRL = 0x91;
;
	lda     #$91
	sta     $2000
;
; NMI_flag = 0;
;
L0698:	lda     #$00
L0699:	sta     _NMI_flag
;
; while (Game_Mode == TITLE_MODE)
;
L0695:	lda     _Game_Mode
	beq     L068F
;
; while (Game_Mode == RUN_GAME_MODE)
;
	jmp     L0697
;
; while (NMI_flag == 0)
;
L0696:	lda     _NMI_flag
	beq     L0696
;
; Get_Input();
;
	jsr     _Get_Input
;
; move_logic();
;
	jsr     _move_logic
;
; audioUpdate();
;
	jsr     _audioUpdate
;
; update_Sprites();
;
	jsr     _update_Sprites
;
; NMI_flag = 0;
;
	lda     #$00
	sta     _NMI_flag
;
; while (Game_Mode == RUN_GAME_MODE)
;
L0697:	lda     _Game_Mode
	cmp     #$01
	beq     L0696
;
; while (1)
;
	jmp     L0695

.endproc

