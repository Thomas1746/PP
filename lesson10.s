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
	.export		_main
	.export		_Palette_Fade

.segment	"RODATA"

_HUD:
	.byte	$53,$43,$4F,$52,$45,$3A,$00
_HUD2:
	.byte	$4C,$49,$56,$45,$53,$3A,$00
_N1:
	.byte	$02
	.byte	$00
	.byte	$02
	.byte	$FE
	.byte	$00
	.byte	$02
	.byte	$FE
	.byte	$00
	.byte	$02
	.byte	$51
	.byte	$14
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$02
	.byte	$1B
	.byte	$14
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$02
	.byte	$15
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$02
	.byte	$09
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$02
	.byte	$11
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$02
	.byte	$09
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$02
	.byte	$0B
	.byte	$14
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$02
	.byte	$11
	.byte	$14
	.byte	$02
	.byte	$05
	.byte	$00
	.byte	$02
	.byte	$03
	.byte	$14
	.byte	$02
	.byte	$03
	.byte	$00
	.byte	$02
	.byte	$11
	.byte	$14
	.byte	$02
	.byte	$07
	.byte	$00
	.byte	$02
	.byte	$1D
	.byte	$14
	.byte	$14
	.byte	$00
	.byte	$02
	.byte	$1D
	.byte	$01
	.byte	$02
	.byte	$0D
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$1D
	.byte	$00
	.byte	$00
	.byte	$01
	.byte	$02
	.byte	$1D
	.byte	$0B
	.byte	$0C
	.byte	$01
	.byte	$02
	.byte	$2E
	.byte	$01
	.byte	$02
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
	.byte	$02
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
	.byte	$02
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
	.byte	$00
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
	.byte	$E9
	.byte	$92
	.byte	$93
	.byte	$94
	.byte	$95
	.byte	$96
	.byte	$97
	.byte	$98
	.byte	$99
	.byte	$9A
	.byte	$9B
	.byte	$9C
	.byte	$9D
	.byte	$9E
	.byte	$9F
	.byte	$9F
	.byte	$00
	.byte	$01
	.byte	$0E
	.byte	$A0
	.byte	$A1
	.byte	$A2
	.byte	$A3
	.byte	$A4
	.byte	$A5
	.byte	$A6
	.byte	$A7
	.byte	$A8
	.byte	$A9
	.byte	$AA
	.byte	$AB
	.byte	$AC
	.byte	$AD
	.byte	$AE
	.byte	$AF
	.byte	$AF
	.byte	$00
	.byte	$01
	.byte	$0E
	.byte	$B0
	.byte	$B1
	.byte	$B2
	.byte	$B3
	.byte	$B4
	.byte	$B5
	.byte	$B6
	.byte	$B7
	.byte	$B8
	.byte	$B9
	.byte	$BA
	.byte	$BB
	.byte	$BC
	.byte	$BD
	.byte	$BE
	.byte	$BF
	.byte	$BF
	.byte	$00
	.byte	$01
	.byte	$0E
	.byte	$C0
	.byte	$C1
	.byte	$C2
	.byte	$C3
	.byte	$C4
	.byte	$C5
	.byte	$C6
	.byte	$C7
	.byte	$C8
	.byte	$C9
	.byte	$CA
	.byte	$CB
	.byte	$CC
	.byte	$CD
	.byte	$CE
	.byte	$CF
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$D0
	.byte	$D1
	.byte	$D2
	.byte	$D3
	.byte	$D4
	.byte	$D5
	.byte	$D6
	.byte	$D7
	.byte	$D8
	.byte	$D9
	.byte	$DA
	.byte	$DB
	.byte	$DC
	.byte	$DD
	.byte	$DE
	.byte	$DF
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$E0
	.byte	$E1
	.byte	$E2
	.byte	$E3
	.byte	$E4
	.byte	$E5
	.byte	$E6
	.byte	$E7
	.byte	$E8
	.byte	$E9
	.byte	$EA
	.byte	$EB
	.byte	$EC
	.byte	$ED
	.byte	$EE
	.byte	$EF
	.byte	$00
	.byte	$01
	.byte	$0F
	.byte	$F0
	.byte	$F1
	.byte	$F2
	.byte	$F3
	.byte	$F4
	.byte	$F5
	.byte	$F6
	.byte	$F7
	.byte	$F8
	.byte	$F9
	.byte	$FA
	.byte	$FB
	.byte	$FC
	.byte	$FD
	.byte	$FE
	.byte	$FF
	.byte	$00
	.byte	$01
	.byte	$91
	.byte	$50
	.byte	$72
	.byte	$65
	.byte	$73
	.byte	$73
	.byte	$00
	.byte	$00
	.byte	$53
	.byte	$74
	.byte	$61
	.byte	$72
	.byte	$74
	.byte	$00
	.byte	$01
	.byte	$EF
	.byte	$32
	.byte	$30
	.byte	$31
	.byte	$37
	.byte	$60
	.byte	$50
	.byte	$65
	.byte	$77
	.byte	$74
	.byte	$65
	.byte	$72
	.byte	$60
	.byte	$50
	.byte	$69
	.byte	$64
	.byte	$67
	.byte	$65
	.byte	$6F
	.byte	$6E
	.byte	$73
	.byte	$00
	.byte	$01
	.byte	$64
	.byte	$00
	.byte	$01
	.byte	$00
_PLATFORM:
	.byte	$00
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$01
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
	.byte	$00
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
; for( index = 0; index < sizeof(PALETTE); ++index ){
;
	sta     _index
L060E:	lda     _index
	cmp     #$20
	bcs     L05AF
;
; PPU_DATA = PALETTE[index];
;
	ldy     _index
	lda     _PALETTE,y
	sta     $2007
;
; for( index = 0; index < sizeof(PALETTE); ++index ){
;
	inc     _index
	jmp     L060E
;
; }
;
L05AF:	rts

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
	jne     L0616
;
; for (index = 0; index < 4; ++index)
;
	sta     _index
L0615:	lda     _index
	cmp     #$04
	bcc     L0618
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L0618:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0432
	inx
L0432:	sta     ptr1
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
	bcc     L0439
	inx
L0439:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L0610
	inx
L0610:	sta     ptr1
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
	bcc     L043F
	inx
L043F:	sta     ptr1
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
	bcc     L0446
	inx
L0446:	sta     ptr1
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
	jmp     L0615
;
; for (index = 0; index < 4; ++index)
;
L0616:	lda     #$00
	sta     _index
L0617:	lda     _index
	cmp     #$04
	bcc     L0619
;
; }
;
	rts
;
; SPRITES[index4] = MetaSprite_Y[index] + Y1; // relative y + master y
;
L0619:	lda     #<(_SPRITES)
	ldx     #>(_SPRITES)
	clc
	adc     _index4
	bcc     L0456
	inx
L0456:	sta     ptr1
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
	bcc     L045D
	inx
L045D:	sta     sreg
	stx     sreg+1
	ldx     #$00
	lda     _index
	clc
	adc     _state4
	bcc     L0613
	inx
L0613:	sta     ptr1
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
	bcc     L0463
	inx
L0463:	sta     ptr1
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
	bcc     L046A
	inx
L046A:	sta     ptr1
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
	jmp     L0617

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
	bne     L0470
;
; temp = C_MAP[collision_Index];
;
	ldy     _collision_Index
	lda     _C_MAP,y
;
; else
;
	jmp     L061F
;
; temp = C_MAP2[collision_Index];
;
L0470:	ldy     _collision_Index
	lda     _C_MAP2,y
L061F:	sta     _temp
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
	bne     L0630
;
; walk_count = 0;
;
	sta     _walk_count
;
; if (X_speed >= 0)
;
	ldx     _X_speed
	bmi     L048B
;
; if (X_speed >= 4)
;
	lda     _X_speed
	sec
	sbc     #$04
	bvs     L0491
	eor     #$80
L0491:	asl     a
	lda     #$00
	bcc     L062F
;
; X_speed -= 4;
;
	lda     _X_speed
	sec
	sbc     #$04
	sta     _X_speed
	bpl     L0630
;
; else
;
	jmp     L0630
;
; if (X_speed <= (-4))
;
L048B:	lda     _X_speed
	sec
	sbc     #$FD
	bvc     L049D
	eor     #$80
L049D:	asl     a
	lda     #$00
	bcc     L062F
;
; X_speed += 4;
;
	lda     #$04
	clc
	adc     _X_speed
	sta     _X_speed
	bpl     L0630
;
; else
;
	jmp     L0630
;
; X_speed = 0;
;
L062F:	sta     _X_speed
;
; if ((joypad1 & RIGHT) != 0)
;
L0630:	lda     _joypad1
	and     #$01
	beq     L0631
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
	bmi     L04AB
;
; X_speed += 2;
;
	lda     #$02
	clc
	adc     _X_speed
	sta     _X_speed
	bpl     L0631
;
; else
;
	jmp     L0631
;
; X_speed += 8; // double friction
;
L04AB:	lda     #$08
	clc
	adc     _X_speed
	sta     _X_speed
;
; if ((joypad1 & LEFT) != 0)
;
L0631:	lda     _joypad1
	and     #$02
	beq     L0633
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
	bvc     L04BF
	eor     #$80
L04BF:	bpl     L0632
;
; X_speed -= 2;
;
	lda     _X_speed
	sec
	sbc     #$02
	sta     _X_speed
	bpl     L0633
;
; else
;
	jmp     L0633
;
; X_speed -= 8; // double friction
;
L0632:	lda     _X_speed
	sec
	sbc     #$08
	sta     _X_speed
;
; NametableB = Nametable;
;
L0633:	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 3); // left
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L0628
	inx
	clc
L0628:	adc     #$03
	bcc     L04CC
	inx
L04CC:	sta     _Scroll_Adjusted_X
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
	beq     L0634
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
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 16) & 0xf0));
;
L0634:	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	clc
	adc     #$10
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; collision = 0;
;
	lda     #$00
	sta     _collision
;
; Collision_Down(); // if on platform, ++collision
;
	jsr     _Collision_Down
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 12);
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L0629
	inx
	clc
L0629:	adc     #$0C
	bcc     L04E3
	inx
L04E3:	sta     _Scroll_Adjusted_X
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
	beq     L0635
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
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1) & 0xf0)); // bottom right
;
L0635:	lda     _Scroll_Adjusted_X
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
; Collision_Down();               // if on platform, ++collision
;
	jsr     _Collision_Down
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 3); // left
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L062A
	inx
	clc
L062A:	adc     #$03
	bcc     L04F7
	inx
L04F7:	sta     _Scroll_Adjusted_X
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
	beq     L0636
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
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1) & 0xf0));
;
L0636:	lda     _Scroll_Adjusted_X
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
; collision = 0;
;
	lda     #$00
	sta     _collision
;
; Collision_Down(); // if on platform, ++collision
;
	jsr     _Collision_Down
;
; NametableB = Nametable;
;
	lda     _Nametable
	sta     _NametableB
;
; Scroll_Adjusted_X = (X1 + Horiz_scroll + 12);
;
	ldx     #$00
	lda     _X1
	clc
	adc     _Horiz_scroll
	bcc     L062B
	inx
	clc
L062B:	adc     #$0C
	bcc     L050D
	inx
L050D:	sta     _Scroll_Adjusted_X
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
	beq     L0637
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
; collision_Index = (((char)Scroll_Adjusted_X >> 4) + ((Y1 + 16) & 0xf0)); // bottom right
;
L0637:	lda     _Scroll_Adjusted_X
	lsr     a
	lsr     a
	lsr     a
	lsr     a
	sta     ptr1
	lda     _Y1
	clc
	adc     #$10
	and     #$F0
	clc
	adc     ptr1
	sta     _collision_Index
;
; Collision_Down(); 
;
	jsr     _Collision_Down
;
; if (collision == 0)
;
	lda     _collision
	bne     L0638
;
; Y_speed += 4; // gravity
;
	lda     #$04
	clc
	adc     _Y_speed
	sta     _Y_speed
	bpl     L0639
;
; else 
;
	jmp     L0639
;
; Y_speed = 0; // collision = stop falling
;
L0638:	lda     #$00
	sta     _Y_speed
;
; Y1 &= 0xf0;  // align to the metatile
;
	lda     _Y1
	and     #$F0
	sta     _Y1
;
; if (collision > 0)
;
L0639:	lda     _collision
	beq     L063D
;
; if (((joypad1 & A_BUTTON) != 0) && ((joypad1old & A_BUTTON) == 0))
;
	lda     _joypad1
	and     #$80
	beq     L063D
	lda     _joypad1old
	and     #$80
	bne     L063D
;
; Y_speed = -0x38; // 0xc8
;
	lda     #$C8
	sta     _Y_speed
;
; if (X_speed >= 0)
;
L063D:	ldx     _X_speed
	bmi     L0535
;
; if (X_speed > 0x20)
;
	lda     _X_speed
	sec
	sbc     #$21
	bvs     L053B
	eor     #$80
L053B:	bpl     L063E
;
; X_speed = 0x20;
;
	lda     #$20
;
; else
;
	jmp     L0626
;
; if (X_speed < (-0x20))
;
L0535:	lda     _X_speed
	sec
	sbc     #$E0
	bvc     L0543
	eor     #$80
L0543:	bpl     L063E
;
; X_speed = (-0x20); // 0xe0
;
	lda     #$E0
L0626:	sta     _X_speed
;
; if (Y_speed >= 0)
;
L063E:	ldx     _Y_speed
	bmi     L063F
;
; if (Y_speed > 0x20)
;
	lda     _Y_speed
	sec
	sbc     #$21
	bvs     L054D
	eor     #$80
L054D:	bpl     L063F
;
; Y_speed = 0x20;
;
	lda     #$20
	sta     _Y_speed
;
; Horiz_scroll_Old = Horiz_scroll;
;
L063F:	lda     _Horiz_scroll
	sta     _Horiz_scroll_Old
;
; Horiz_scroll += (X_speed >> 4); // use the high nibble
;
	ldx     #$00
	lda     _X_speed
	bpl     L0555
	dex
L0555:	jsr     asrax4
	clc
	adc     _Horiz_scroll
	sta     _Horiz_scroll
;
; if (X_speed >= 0)
;
	ldx     _X_speed
	bmi     L0556
;
; if (Horiz_scroll_Old > Horiz_scroll) // if pass 0, switch nametables
;
	ldx     #$00
	lda     _Horiz_scroll_Old
	sec
	sbc     _Horiz_scroll
	bcc     L0640
	beq     L0640
;
; else
;
	jmp     L0646
;
; if (Horiz_scroll_Old < Horiz_scroll)
;
L0556:	ldx     #$00
	lda     _Horiz_scroll_Old
	cmp     _Horiz_scroll
	bcs     L0640
;
; ++Nametable; // if pass 0, switch nametables
;
L0646:	inc     _Nametable
;
; Nametable &= 1; // keep it 1 or 0
;
L0640:	lda     _Nametable
	and     #$01
	sta     _Nametable
;
; Y1 += (Y_speed >> 4); // use the high nibble
;
	lda     _Y_speed
	bpl     L0565
	dex
L0565:	jsr     asrax4
	clc
	adc     _Y1
	sta     _Y1
;
; if (walk_count > 0x1f) // walk_count forced 0-1f
;
	lda     _walk_count
	cmp     #$20
	ldx     #$00
	bcc     L0641
;
; walk_count = 0;
;
	stx     _walk_count
;
; state = Walk_Moves[(walk_count >> 3)]; // if not jumping
;
L0641:	lda     _walk_count
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
	bcc     L056E
;
; state = 3;
;
	lda     #$03
	sta     _state
;
; }
;
L056E:	rts

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
; for(index=0;index < sizeof(HUD);++index){
;
	lda     #$00
	sta     _index
L0647:	lda     _index
	cmp     #$07
	bcs     L0648
;
; PPU_DATA = HUD[index];
;
	ldy     _index
	lda     _HUD,y
	sta     $2007
;
; for(index=0;index < sizeof(HUD);++index){
;
	inc     _index
	jmp     L0647
;
; PPU_ADDRESS = 0x24;
;
L0648:	lda     #$24
	sta     $2006
;
; PPU_ADDRESS = 0x74;
;
	lda     #$74
	sta     $2006
;
; for(index=0;index < sizeof(HUD);++index){
;
	lda     #$00
	sta     _index
L0649:	lda     _index
	cmp     #$07
	bcs     L064A
;
; PPU_DATA = HUD2[index];
;
	ldy     _index
	lda     _HUD2,y
	sta     $2007
;
; for(index=0;index < sizeof(HUD);++index){
;
	inc     _index
	jmp     L0649
;
; PPU_ADDRESS = 0x27;
;
L064A:	lda     #$27
	sta     $2006
;
; PPU_ADDRESS = 0xc0;
;
	lda     #$C0
	sta     $2006
;
; for(index=0;index < 8;++index){
;
	lda     #$00
	sta     _index
L064B:	lda     _index
	cmp     #$08
	bcs     L0604
;
; PPU_DATA = 0xff;
;
	lda     #$FF
	sta     $2007
;
; for(index=0;index < 8;++index){
;
	inc     _index
	jmp     L064B
;
; }
;
L0604:	rts

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
	jmp     L0652
;
; while (NMI_flag == 0); // wait till v-blank
;
L064C:	lda     _NMI_flag
	beq     L064C
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
; if (((joypad1old & START) == 0)&&((joypad1 & START) != 0)){
;
	lda     _joypad1old
	and     #$10
	bne     L0655
	lda     _joypad1
	and     #$10
	beq     L0656
;
; NMI_flag = 0;
;
	lda     #$00
	sta     _NMI_flag
;
; while (NMI_flag == 0); // wait till v-blank
;
L064F:	lda     _NMI_flag
	beq     L064F
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
L0655:	lda     #$00
L0656:	sta     _NMI_flag
;
; while (Game_Mode == TITLE_MODE)
;
L0652:	lda     _Game_Mode
	beq     L064C
;
; while (Game_Mode == RUN_GAME_MODE)
;
	jmp     L0654
;
; while (NMI_flag == 0); // wait till v-blank
;
L0653:	lda     _NMI_flag
	beq     L0653
;
; Get_Input();
;
	jsr     _Get_Input
;
; move_logic();
;
	jsr     _move_logic
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
L0654:	lda     _Game_Mode
	cmp     #$01
	beq     L0653
;
; while (1)
;
	jmp     L0652

.endproc

