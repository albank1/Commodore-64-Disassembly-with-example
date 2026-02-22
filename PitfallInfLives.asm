; Pitfall (1984) Activision - extracted from .crt (8KB @ $8000)
; Disassembly scaffold generated from recursive traversal of cold start vector.
; Assembles with DASM. Build ROM and then convert back to CRT with cartconv (see bottom).
; Address $07 holds the number of lives
; I have changed dec $07 to lda $07 which effectively gives you infinite lives

	processor 6502
	org $8000

CartHeader:
WarmVec:	.word W8009
ColdVec:	.word W8009
	.byte $C3,$C2,$CD,$38,$30	; "CBM80" (PETSCII, high bit set)
W8009:
      sei                               
      cld                               
      jsr  W929B                        
      lda  #$73                         
      sta  $0318                        ; Vector: Not maskerable Interrupt (NMI)
      lda  #$8A                         
      sta  $0319                        ; Vector: Not maskerable Interrupt (NMI)
      ldx  #$3B                         
W801A:
      lda  $D011                        ; VIC control register
      bpl  W801A                        
W801F:
      lda  $D012                        ; Reading/Writing IRQ balance value
      cmp  #$10                         
      bcc  W8028                        
      ldx  #$31                         
W8028:
      lda  $D011                        ; VIC control register
      bmi  W801F                        
      stx  $05                          ; Jump Vector: integer-real conversion
W802F:
      lda  #$00                         
      sta  $06                          
      beq  W8039                        
W8035:
      lda  #$01                         
      sta  $06                          
W8039:
      lda  #$00                         
      tax                               
      ldy  $06                          
      bne  W8043                        
W8040:
      sta.w  $0006,x
      ;nop                      
W8043:
      sta  $D000,x                      
      sta  $D400,x                      
      inx                               
      bne  W8040                        
      dex                               
      txs                               
      jsr  W8A76                        
      lda  #$80                         
      sta  $0291                        
      jsr  W8C0A                        
      lda  $06                          
      bne  W8060                        
      jsr  W8A57                        
W8060:
      jsr  W8998+1                      
W8063:
      jsr  W8A51                        
      and  #$0F                         
      cmp  #$0F                         
      beq  W8063                        
      lda  $05                          
      sta  $30                          
W8070:
      lda  #$00                         
      sta  $2F                          
      lda  #$20                         
      sta  $2E                          
W8078:
      jsr  W80B7                        
      jsr  W8867                        
W807E:
      jsr  W849C                        
W8081:
      lda  $25                          
      beq  W808B                        
      jsr  W80B7                        
      jsr  W8867                        
W808B:
      jsr  W83EB                        
      jsr  W854E                        
      lda  $25                          
      beq  W809B                        
      jsr  W80B7                        
      jsr  W8867                        
W809B:
      jsr  W8C5E                        
      lda  $25                          
      beq  W80A5                        
      jsr  W80B7                        
W80A5:
      jsr  W8867                        
W80A8:
      jsr  W8A1A                        
      lda  $2E                          
      ora  $2F                          
      bne  W8078                        
      jsr  W8A57                        
      jmp  W8035                        

W80B7:
      jsr  W8A51                        
      tay                               
      lda  $4F                          
      beq  W80C2                        
      jmp  W8394                        

W80C2:
      lda  $22                          
      beq  W80C9                        
      jmp  W83CA                        

W80C9:
      lda  $24                          
      beq  W80D0                        
      jmp  W832F                        

W80D0:
      lda  $23                          
      beq  W80D7                        
      jmp  W82AB                        

W80D7:
      lda  $25                          
      beq  W80E6                        
      bne  W80E3                        
W80DD:
      inc  $0A                          
      lda  #$10                         
      sta  $5B                          
W80E3:
      jmp  W81F3                        

W80E6:
      tya                               
      and  #$10                         
      bne  W80F1                        
      lda  $0A                          
      beq  W80DD                        
      bne  W80F5                        
W80F1:
      lda  #$00                         
      sta  $0A                          
W80F5:
      lda  $4E                          
      and  #$39                         
      sta  $4E                          
      lda  $14                          
      cmp  #$CF                         
      bne  W810A                        
      tya                               
      ror                               
      bcs  W810A                        
      ldx  #$CC                         
      jsr  W8117                        
W810A:
      tya                               
      and  #$02                         
      bne  W8144                        
      ldx  #$A5                         
      jsr  W8117                        
      jmp  W8144                        

W8117:
      lda  $3D                          
      cmp  #$02                         
      bcs  W8143                        
      cpx  #$A5                         
      bne  W8127                        
      lda  $14                          
      cmp  #$97                         
      bcs  W8143                        
W8127:
      lda  $13                          
      bne  W8143                        
      lda  $12                          
      cmp  #$9C                         
      bcc  W8143                        
      cmp  #$BF                         
      bcs  W8143                        
      lda  #$AC                         
      sta  $12                          
      txa                               
      sta  $14                          
      inc  $23                          
      pla                               
W813F:
      pla                               
      jmp  W81E4+1                      

W8143:
      rts                               

W8144:
      tya                               
      and  #$0C                         
      cmp  #$0C                         
      bne  W814E                        
      jmp  W81E4+1                      

W814E:
      sta  $27                          
      ldx  #$04                         
      stx  $46                          
W8154:
      lsr                               
      lsr                               
      lsr                               
      sta  $26                          
W8159:
      lda  $52                          
      beq  W8163                        
      and  #$01                         
      cmp  $26                          
      beq  W81DD                        
W8163:
      lda  $26                          
      beq  W8185                        
      lda  $12                          
      sec                               
      sbc  $46                          
      sta  $12                          
      lda  $13                          
      lda  $26                          
      lda  $13                          
      bne  W817E                        
      lda  $12                          
      cmp  #$16                         
      bcs  W81DD                        
      bcc  W819F                        
W817E:
      bcs  W8182                        
      dec  $13                          
W8182:
      jmp  W81DD                        

W8185:
      lda  $12                          
      clc                               
      adc  $46                          
      sta  $12                          
      lda  $13                          
      beq  W8198                        
      lda  $12                          
      cmp  #$42                         
      bcc  W81DD                        
      bcs  W819F                        
W8198:
      bcc  W819C                        
      inc  $13                          
W819C:
      jmp  W81DD                        

W819F:
      lda  #$00                         
      sta  $12                          
      sta  $13                          
      ldx  #$01                         
      lda  $14                          
      cmp  #$9B                         
      bcc  W81AF                        
      ldx  #$03                         
W81AF:
      jsr  W8D07                        
      ldx  $26                          
      lda  W81E1,x                      
      sta  $12                          
      lda  W81E3,x                      
      sta  $13                          
W81BE:
      lda  $D011                        ; VIC control register
      bpl  W81BE                        
      lda  #$00                         
      sta  $4E                          
      sta  $51                          
      lda  $25                          
      beq  W81DD                        
      lda  #$14                         
      sta  $25                          
      lda  #$8C                         
      ldx  $14                          
      cpx  #$97                         
      bcc  W81DB                        
      lda  #$C5                         
W81DB:
      sta  $14                          
W81DD:
      jsr  W8283                        
      rts                               

W81E1:
      asl  $42,x                        
W81E3:
      brk                               
W81E4:
      ora  ($A9,x)                      
      rol                               
      ora  $26                          
      sta  $43F8                        
      sta  $27                          
      lda  #$00                         
      sta  $15                          
      rts                               

W81F3:
      ldx  $25                          
      lda  $14                          
      sec                               
      sbc  W9EDB,x                      
      sta  $14                          
      inx                               
      stx  $25                          
      cpx  #$24                         
      bne  W820E                        
      lda  #$00                         
      sta  $25                          
      sta  $50                          
      sta  $53                          
      beq  W8250                        
W820E:
      lda  $50                          
      bne  W8250                        
      lda  $11                          
      beq  W8250                        
      lda  $13                          
      bne  W8250                        
      lda  $14                          
      cmp  #$97                         
      bcs  W8250                        
      lda  $27                          
      bne  W823F                        
      lda  $25                          
      cmp  #$0E                         
      bcc  W823F                        
      cmp  #$17                         
      bcs  W823F                        
      jsr  W8385                        
      sec                               
      sbc  $12                          
      bcs  W823B                        
      eor  #$FF                         
      clc                               
      adc  #$01                         
W823B:
      cmp  #$0A                         
      bcc  W8245                        
W823F:
      lda  $4E                          
      and  #$C6                         
      beq  W8250                        
W8245:
      lda  #$00                         
      sta  $25                          
      inc  $24                          
      lda  #$00                         
      jmp  W89C5                        

W8250:
      ldx  $25                          
      cpx  #$01                         
      bne  W8273                        
      jsr  W8A51                        
      tay                               
      and  #$04                         
      bne  W8268                        
      lda  #$01                         
      sta  $26                          
      lda  #$00                         
      sta  $27                          
      beq  W8273                        
W8268:
      tya                               
      and  #$08                         
      bne  W8273                        
      lda  #$00                         
      sta  $26                          
      sta  $27                          
W8273:
      lda  $27                          
      bne  W8283                        
      lda  $25                          
      ror                               
      bcc  W8283                        
      lda  #$02                         
      sta  $46                          
      jmp  W8159                        

W8283:
      lda  $25                          
      ora  $22                          
      bne  W829F                        
      inc  $15                          
      lda  $15                          
      cmp  #$05                         
      bne  W8295                        
      lda  #$00                         
      sta  $15                          
W8295:
      tax                               
      lda  W9ED6,x                      
      ora  $26                          
      sta  $43F8                        
      rts                               

W829F:
      lda  #$00                         
      sta  $15                          
      lda  #$28                         
      ora  $26                          
      sta  $43F8                        
      rts                               

W82AB:
      inc  $5A                          
      lda  $5A                          
      cmp  #$02                         
      beq  W82B4                        
      rts                               

W82B4:
      lda  #$00                         
      sta  $5A                          
      tya                               
      ror                               
      bcs  W82CA                        
      lda  $14                          
      cmp  #$A5                         
      beq  W82F2                        
      dec  $14                          
      dec  $14                          
      dec  $14                          
      bne  W8321                        
W82CA:
      tya                               
      and  #$02                         
      bne  W82F2                        
      lda  $14                          
      cmp  #$CF                         
      bne  W82EA                        
W82D5:
      lda  #$00                         
      sta  $27                          
      sta  $23                          
      lda  $26                          
      beq  W82E5                        
      dec  $12                          
      dec  $12                          
      bne  W82E9                        
W82E5:
      inc  $12                          
      inc  $12                          
W82E9:
      rts                               

W82EA:
      inc  $14                          
      inc  $14                          
      inc  $14                          
      bne  W8321                        
W82F2:
      lda  $14                          
      cmp  #$A5                         
      bne  W8321                        
      tya                               
      and  #$0C                         
      cmp  #$0C                         
      beq  W8321                        
      ror                               
      ror                               
      and  #$01                         
      eor  #$01                         
      sta  $26                          
      inc  $0A                          
      bne  W830F                        
      lda  #$AE                         
      bne  W8311                        
W830F:
      lda  #$AA                         
W8311:
      sta  $12                          
      lda  #$01                         
      sta  $25                          
      lda  #$95                         
      sta  $14                          
      lda  #$10                         
      sta  $5B                          
      bne  W82D5                        
W8321:
      lda  $14                          
      and  #$01                         
      sta  $36                          
      lda  #$2E                         
      ora  $36                          
      sta  $43F8                        
      rts                               

W832F:
      lda  #$2C                         
      ora  $26                          
      sta  $43F8                        
      jsr  W837E                        
      sta  $12                          
      lda  #$5C                         
      clc                               
      adc  $0C                          
      sta  $14                          
      tya                               
      and  #$02                         
      bne  W8377                        
      lda  $0E                          
      cmp  #$37                         
      bcc  W836F                        
      lda  #$2C                         
      sec                               
      sbc  $0D                          
      sta  $43F8                        
      lda  #$00                         
      sta  $27                          
      sta  $24                          
W835B:
      lda  #$10                         
      sta  $25                          
      sta  $50                          
      lda  #$10                         
      sta  $5B                          
      lda  $0D                          
      sta  $26                          
      lda  #$8C                         
      sta  $14                          
      bne  W8377                        
W836F:
      inc  $27                          
      lda  #$00                         
      sta  $24                          
      beq  W835B                        
W8377:
      lda  $4E                          
      and  #$39                         
      sta  $4E                          
      rts                               

W837E:
      lda  $26                          
      ror                               
      lda  #$A5                         
      bcc  W8387                        
W8385:
      lda  #$AC                         
W8387:
      ldx  $0D                          
      beq  W8390                        
      sec                               
      sbc  $0E                          
      bne  W8393                        
W8390:
      clc                               
      adc  $0E                          
W8393:
      rts                               

W8394:
      inc  $14                          
      inc  $14                          
      inc  $14                          
      dec  $4F                          
      dec  $4F                          
      dec  $4F                          
      lda  $4F                          
      cmp  #$18                         
      bcs  W83A9                        
      jmp  W829F                        

W83A9:
      jmp  W81E4+1                      

W83AC:
      lda  $2B                          
      ora  $2C                          
      ora  $2D                          
      beq  W83C9                        
      lda  $2D                          
      sed                               
      sec                               
      sbc  #$01                         
      sta  $2D                          
      lda  $2C                          
      sbc  #$00                         
      sta  $2C                          
      lda  $2B                          
      sbc  #$00                         
      sta  $2B                          
      cld                               
W83C9:
      rts                               

W83CA:
      lda  #$99                         
      sta  $14                          
      jsr  W829F                        
      jsr  W83AC                        
      jsr  W83AC                        
      jsr  W83AC                        
      lda  $3C                          
      cmp  #$04                         
      bcc  W83EA                        
      tya                               
      and  #$0C                         
      cmp  #$0C                         
      beq  W83EA                        
      jmp  W8154                        

W83EA:
      rts                               

W83EB:
      lda  $3D                          
      cmp  #$04                         
      bne  W83F8                        
      jsr  W8418                        
      jsr  W8433                        
      rts                               

W83F8:
      cmp  #$02                         
      bcc  W83FF                        
      jsr  W8433                        
W83FF:
      lda  $3D                          
      cmp  #$05                         
      bcc  W8408                        
      jsr  W8469                        
W8408:
      lda  $3D                          
      cmp  #$05                         
      beq  W8417                        
      lda  $3C                          
      cmp  #$06                         
      bcs  W8417                        
      jsr  W84E9                        
W8417:
      rts                               

W8418:
      inc  $2A                          
      lda  $2A                          
      cmp  #$28                         
      bne  W8432                        
      lda  $43FB                        
      eor  #$01                         
      sta  $43FB                        
      sta  $43FC                        
      sta  $43FD                        
      lda  #$00                         
      sta  $2A                          
W8432:
      rts                               

W8433:
      lda  $20                          
      cmp  $13                          
      bcc  W8456                        
      bne  W8443                        
      lda  $1F                          
      cmp  $12                          
      beq  W8468                        
      bcc  W8456                        
W8443:
      lda  $1F                          
      sec                               
      sbc  #$01                         
      sta  $1F                          
      bcs  W844E                        
      dec  $20                          
W844E:
      and  #$02                         
      lsr                               
      ora  #$3C                         
      sta  $21                          
      rts                               

W8456:
      lda  $1F                          
      clc                               
      adc  #$01                         
      sta  $1F                          
      bcc  W8461                        
      inc  $20                          
W8461:
      and  #$02                         
      lsr                               
      ora  #$3A                         
      sta  $21                          
W8468:
      rts                               

W8469:
      lda  $42                          
      beq  W8471                        
      cmp  #$06                         
      bne  W847A                        
W8471:
      inc  $43                          
      lda  $43                          
      cmp  #$28                         
      beq  W847A                        
      rts                               

W847A:
      lda  #$00                         
      sta  $43                          
      lda  $41                          
      beq  W848E                        
      dec  $42                          
      bne  W848A                        
      lda  #$00                         
      sta  $41                          
W848A:
      jsr  W8F26                        
      rts                               

W848E:
      inc  $42                          
      lda  $42                          
      cmp  #$06                         
      bne  W8498                        
      inc  $41                          
W8498:
      jsr  W8F26                        
      rts                               

W849C:
      lda  $0F                          
      beq  W84B0                        
      dec  $0F                          
      jsr  W919E+1                      
      ldy  #$07                         
      ldx  #$00                         
W84A9:
      dex                               
      bne  W84A9                        
      dey                               
      bne  W84A9                        
      rts                               

W84B0:
      lda  $0E                          
      cmp  #$32                         
      bcc  W84B8                        
      inc  $0F                          
W84B8:
      ldx  $10                          
      bne  W84CB                        
      clc                               
      adc  #$04                         
      cmp  #$46                         
      bcs  W84C9                        
      sta  $0E                          
      jsr  W919E+1                      
      rts                               

W84C9:
      inc  $10                          
W84CB:
      sec                               
      sbc  #$04                         
      beq  W84D8                        
      bmi  W84D8                        
      sta  $0E                          ; Data type: case 0x80=Intero, case 0x00=Reale
      jsr  W919E+1                      
      rts                               

W84D8:
      lda  #$00                         
      sta  $10                          
      inc  $4D                          
      lda  $0E                          
      clc                               
      adc  #$04                         
      sta  $0E                          
      jsr  W919E+1                      
      rts                               

W84E9:
      lda  $3C                          
      cmp  #$04                         
      bcc  W84F0                        
      rts                               

W84F0:
      and  #$03                         
      cmp  #$02                         
      bcs  W84F9                        
      clc                               
      adc  #$01                         
W84F9:
      tax                               
      ldy  #$16                         
W84FC:
      lda  $0000,y                      
      sec                               
      sbc  #$04                         
      sta  $0000,y                      
      bcs  W851E                        
      lda  $0001,y                      
      sec                               
      sbc  #$01                         
      bpl  W851B                        
W850F:
      lda  $D011                        
      bpl  W850F                        
      lda  #$5E                         
      sta  $0000,y                      
      lda  #$01                         
W851B:
      sta  $0001,y                      ; 6510 I/O register
W851E:
      iny                               
      iny                               
      dex                               
      bne  W84FC                        
      ldx  #$02                         
W8525:
      lda  $43FB,x                      
      eor  #$01                         
      sta  $43FB,x                      
      dex                               
      bpl  W8525                        
      inc  $47                          
      lda  $47                          
      cmp  #$02                         
      bne  W853F                        
      dec  $1C                          
      dec  $1D                          
      dec  $1E                          
      rts                               

W853F:
      cmp  #$04                         
      bne  W854D                        
      inc  $1C                          
      inc  $1D                          
      inc  $1E                          
      lda  #$00                         
      sta  $47                          
W854D:
      rts                               

W854E:
      lda  $14                          
      ldy  $3D                          
      cmp  #$96                         
      beq  W855D                        
      cmp  #$9A                         
      beq  W855D                        
W855A:
      jmp  W8635                        

W855D:
      cpy  #$02                         
      bcs  W85C8                        
      lda  $13                          
      bne  W855A                        
      lda  $12                          
      cmp  #$A6                         
      beq  W8592                        
      bcc  W8573                        
      cmp  #$B2                         
      beq  W8597                        
      bcc  W859C                        
W8573:
      cpy  #$01                         
      bne  W858F                        
      cmp  #$66                         
      beq  W8592                        
      bcc  W8583                        
      cmp  #$7A                         
      beq  W8597                        
      bcc  W859C                        
W8583:
      cmp  #$DE                         
      beq  W8592                        
      bcc  W858F                        
      cmp  #$F4                         
      beq  W8597                        
      bcc  W859C                        
W858F:
      jmp  W8635                        

W8592:
      clc                               
      adc  #$04                         
      bne  W859A                        
W8597:
      sec                               
      sbc  #$04                         
W859A:
      sta  $12                          
W859C:
      lda  #$39                         
      sta  $4F                          
      lda  #$24                         
      sta  $57                          
      lda  #$96                         
      sta  $14                          
      lda  #$00                         
      sta  $22                          
      lda  $2C                          
      sed                               
      sec                               
      sbc  #$01                         
      sta  $2C                          
      bcs  W85C6                        
      lda  $2B                          
      bne  W85C2                        
      sta  $2B                          
      sta  $2C                          
      sta  $2D                          
      beq  W85C6                        
W85C2:
      sbc  #$00                         
      sta  $2B                          
W85C6:
      cld                               
W85C7:
      rts                               

W85C8:
      cmp  #$99                         
      beq  W85D8                        
      cmp  #$96                         
      beq  W85D8                        
      bcs  W8635                        
      lda  $25                          
      cmp  #$02                         
      bcs  W8635                        
W85D8:
      lda  $12                          
      ldx  $42                          
      beq  W8635                        
      dex                               
      cmp  W9F09,x                      
      bcc  W8635                        
      cmp  W9F0F,x                      
      bcs  W8635                        
      cpy  #$04                         
      bne  W8624                        
      lda  $4E                          
      and  #$C6                         
      sta  $4E                          
      lda  $12                          
      ldx  #$04                         
W85F7:
      cmp  W862F,x                      
      bcc  W8603                        
      cmp  W8630,x                      
      bcc  W8609                        
      beq  W8609                        
W8603:
      dex                               
      dex                               
      bpl  W85F7                        
      bmi  W8624                        
W8609:
      lda  $43FB                        
      cmp  #$39                         
      beq  W85C7                        
      lda  $12                          
      ldx  #$04                         
W8614:
      .byte $DD, $29, $86, $90, $07, $DD, $2A, $86 
      .byte $90, $A9, $F0, $A7          
W8620:
      .byte $CA, $CA, $10, $F0          
W8624:
      .byte $A9, $18, $4C, $92, $87     
W8629:
      .byte $8A
W862A:
      sta  ($B2),y                      
      .byte $B6, $D6, $DA               
W862F:                                  
      .byte $7A
W8630:                                  
      .byte $91, $A2, $B6, $C6, $DA     
W8635:
      lda  $51                          
      beq  W8640                        
      lda  #$00                         
      sta  $51                          
      jmp  W8792                        

W8640:
      cpy  #$04                         
      beq  W8693                        
      lda  $4E                          
      pha                               
      and  #$C6                         
      sta  $4E                          
      pla                               
      and  #$38                         
      beq  W8694                        
      cpy  #$05                         
      bne  W8657                        
      jmp  W875B                        

W8657:
      lda  $3C                          
      cmp  #$06                         
      bcc  W8662                        
      lda  #$00                         
      jmp  W8792                        

W8662:
      lda  $25                          
      ora  $4F                          
      bne  W867D                        
      lda  $23                          
      bne  W867E                        
      ldx  #$01                         
      stx  $22                          
      ldy  #$00                         
      lda  ($55),y                      
      cmp  #$FF                         
      bne  W867D                        
      lda  #$03                         
      jsr  W89C5                        
W867D:
      rts                               

W867E:
      lda  $14                          
      cmp  #$AE                         
      bcs  W8693                        
      lda  #$B1                         
      sta  $14                          
      lda  #$03                         
      sta  $58                          
      lda  #$0A                         
      sta  $59                          
      jsr  W83AC                        
W8693:
      rts                               

W8694:
      lda  $22                          
      beq  W86A0                        
      lda  #$96                         
      sta  $14                          
      lda  #$00                         
      sta  $22                          
W86A0:
      lda  $14                          
      cmp  #$C0                         
      bcs  W86A9                        
W86A6:
      jmp  W8754                        

W86A9:
      lda  $3D                          
      cmp  #$02                         
      bcs  W86A6                        
      lda  $53                          
      bne  W86A6                        
      lda  $08                          
      bpl  W86E7                        
      lda  $13                          
      beq  W870D                        
      lda  $12                          
      ldx  $26                          
      bne  W86D1                        
      cmp  #$1E                         
      beq  W86D5                        
      bcc  W870B                        
      cmp  #$30                         
      bcs  W870B                        
      lda  #$1E                         
      sta  $12                          
      bne  W86D5                        
W86D1:
      cmp  #$3A                         
      bne  W870B                        
W86D5:
      lda  $25                          
      bne  W8719                        
W86D9:
      txa                               
      ora  #$80                         
      sta  $52                          
      lda  $15                          
      ror                               
      bcc  W86E6                        
      jmp  W8737                        

W86E6:
      rts                               

W86E7:
      lda  $13                          
      bne  W8754                        
      lda  $12                          
      ldx  $26                          ; Real product
      beq  W8701                        
      cmp  #$3A                         
      beq  W8705                        
      bcs  W8740                        
      cmp  #$28                         
      bcc  W8740                        
      lda  #$3A                         
      sta  $12                          
      bne  W8705                        
W8701:
      cmp  #$1E                         
      bne  W8740                        
W8705:
      lda  $25                          
W8707:
      bne  W874E                        
      beq  W86D9                        
W870B:
      ldx  $25                          
W870D:
      beq  W8754                        
      cmp  #$1E                         
      bcc  W8754                        
      beq  W8719                        
      cmp  #$3B                         
      bcs  W8754                        
W8719:
      ldy  $27                          
      bne  W8724                        
W871D:
      lda  $26                          
      tax                               
      eor  #$01                         
      sta  $26                          
W8724:
      lda  #$C5                         
      sta  $14                          
      lda  #$14                         
      sta  $25                          
      lda  W8759,x                      
      sta  $12                          
      sta  $53                          
      lda  $27                          
      bne  W873F                        
W8737:
      lda  #$25                         
      sta  $59                          
      lda  #$03                         
      sta  $58                          
W873F:
      rts                               

W8740:
      ldx  $25                          
      beq  W8754                        
      cmp  #$1E                         
      bcc  W8754                        
      beq  W874E                        
      cmp  #$3B                         
      bcs  W8754                        
W874E:
      ldy  $27                          
      bne  W8724                        
      beq  W871D                        
W8754:
      lda  #$00                         
      sta  $52                          
      rts                               

W8759:
      .byte $1E, $3A                    
W875B:
      .byte $20, $3C, $91, $D0, $31, $95, $32 
      lda  $3C                          
      and  #$03                         
      asl                               
      asl                               
      asl                               
      asl                               
      adc  #$20                         
      sed                               
      adc  $2C                          
      sta  $2C                          
      lda  #$00                         
      sta  $1C                          
      adc  $2B                          
      sta  $2B                          
      cld                               
      lda  #$02                         
      jsr  W89C5                        
      dec  $31                          
      bpl  W8791                        
      ldy  #$00                         
W8785:
      lda  ($55),y                      
      cmp  #$FF                         
      bne  W8785                        
      jsr  W8A57                        
      jmp  W8035                        

W8791:
      rts                               

W8792:
      pha                               
      lda  #$00                         
      sta  $4E                          
      sta  $51                          
      sta  $5B                          
      sta  $D404                        ; Voice 1: Control registers
      lda  #$01                         
      jsr  W89C5                        
      pla                               
      beq  W87BD                        
      jsr  W81E4+1                      
      lda  #$96                         
      sta  $14                          
      ldx  #$18                         
W87AF:
      jsr  W8823                        
      dex                               
      bne  W87AF                        
      stx  $14                          
      jsr  W8B93                        
      jsr  W8C5E                        
W87BD:
      ldy  #$00                         
      lda  ($55),y                      
      cmp  #$FF                         
      bne  W87BD                        
      lda  $07      			; was dec $07 REDUCE NUMBER OF LIVES                    
      bne  W87CF                        
      jsr  W8A57                        
      jmp  W8035                        

W87CF:
      jsr  W8C5E                        
      jsr  W8CCD                        
      ldy  #$B1                         
      ldx  #$0B                         
      lda  $14                          
      cmp  #$97                         
      bcs  W87E3                        
      ldy  #$45                         
      ldx  #$1C                         
W87E3:
      lda  #$28                         
      sta  $43F8                        
      lda  #$1E                         
      sta  $12                          
      lda  #$00                         
      sta  $13                          
      sta  $26                          
      sta  $25                          
      cpy  #$45                         
      beq  W8802                        
      sta  $20                          
      lda  #$B4                         
      sta  $1F                          
      lda  #$3B                         
      sta  $21                          
W8802:
      sty  $14                          
      tya                               
      pha                               
      txa                               
      pha                               
      jsr  W849C                        
      pla                               
      tax                               
      pla                               
      tay                               
      iny                               
      iny                               
      iny                               
      cpx  #$07                         
      bne  W881B                        
      lda  #$2A                         
      sta  $43F8                        
W881B:
      dex                               
      bne  W8802                        
      stx  $51                          
      stx  $4E                          
      rts                               

W8823:
      lda  #$4A                         
      sta  $37                          
      lda  #$80                         
      ldy  $26                          
      beq  W8830                        
      clc                               
      adc  #$40                         
W8830:
      sta  $36                          
      ldy  #$39                         
W8834:
      lda  #$03                         
      sta  $38                          
      tya                               
      pha                               
W883A:
      lda  ($36),y                      
      iny                               
      iny                               
      iny                               
      sta  ($36),y                      
      dey                               
      dey                               
      dec  $38                          
      bne  W883A                        
      pla                               
      sec                               
      sbc  #$03                         
      tay                               
      bpl  W8834                        
      lda  #$00                         
      tay                               
      sta  ($36),y                      
      iny                               
      sta  ($36),y                      
      iny                               
      sta  ($36),y                      
      ldy  #$00                         
      lda  #$07                         
      sta  $36                          
W885F:
      dey                               
      bne  W885F                        
      dec  $36                          
      bne  W885F                        
      rts                               

W8867:
      lda  $58                          
      bne  W88AD                        
      lda  $15                          
      cmp  #$01                         
      bne  W887C                        
      lda  #$19                         
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      lda  #$81                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W887C:
      lda  $5B                          
      beq  W88A2                        
      dec  $5B                          
      lda  #$10                         
      sec                               
      sbc  $5B                          
      sta  $36                          
      lda  $50                          
      beq  W8894                        
      lda  #$23                         
      sec                               
      sbc  $36                          
      bne  W8899                        
W8894:
      lda  $36                          
      clc                               
      adc  #$13                         
W8899:
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      lda  #$41                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W88A2:
      lda  $57                          
      beq  W88AD                        
      dec  $57                          
      clc                               
W88A9:
      adc  #$04                         
      bne  W8899                        
W88AD:
      lda  $58                          
      beq  W88C6                        
      dec  $58				; could be REDUCING LIVES                         
      lda  #$00                         
      sta  $5B                          
      lda  $59                          
      sta  $D401                        ; Voice 1: Frequency control (hi byte)
      cmp  #$0A                         
      bne  W8899                        
      lda  #$21                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W88C6:
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      rts                               

W88CC:
      inc  $5E                          
      lda  $5E                          
      cmp  #$40                         
      bne  W88E3                        
      lda  #$00                         
      sta  $5E                          
W88D8:
      lda  $D011                        ; VIC control register
      bpl  W88D8                        
      lda  $5C                          
      beq  W88E4                        
      dec  $5C                          ; Scratch for numeric operation
W88E3:
      rts                               

W88E4:
      ldx  #$07                         
      stx  $5C                          
      ldx  #$00                         
W88EA:
      lda  $43C1,x                      
      sta  $43C0,x                      
      lda  $DBC1,x                      ; Color RAM
      sta  $DBC0,x                      ; Color RAM
      inx                               
      cpx  #$28                         
      bne  W88EA                        
      ldx  $5D                          
      inc  $5D                          
      lda  W891E,x                      
      cmp  #$FF                         
      bne  W890B                        
      lda  #$00                         
      sta  $5D                          
      rts                               

W890B:
      sta  $43E7                        
      ldx  #$01                         
      cmp  #$3C                         
      beq  W8918                        
      cmp  #$3D                         
      bne  W891A                        
W8918:
      ldx  #$09                         
W891A:
      stx  $DBE7                        ; Color RAM
      rts                               

W891E:
      bne  W88A9                        
      .byte $94, $86, $81, $8C, $8C, $A1, $48, $49 
      .byte $00, $82, $99, $00, $C4, $81, $96, $89 
      .byte $84, $00, $C3, $92, $81, $8E, $85, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $C3, $8F 
      .byte $90, $99, $92, $89, $87, $88, $94, $00 
      .byte $B1, $B9, $B8, $B2, $AC, $B1, $B9, $B8 
      .byte $B4, $00, $00               
W895B:
      .byte $3C, $3C, $3C, $3D, $3E, $3F, $40, $41 
      .byte $42, $43, $44, $45, $46, $47, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $D0, $92, $85 
      .byte $93, $93, $00, $C6, $B1, $00, $94, $8F 
      .byte $00, $D3, $94, $81, $92, $94, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00     
W8998:
      isb.w  $00A9,x                      ; RS-232 indicator: Control of starting bit
      ;nop
      sta  $5C                          
      tax                               
      tay                               
W899F:
      lda  W895B,x                      
      cpx  #$0E                         
      beq  W89A9                        
      inx                               
      bne  W89AB                        
W89A9:
      lda  #$00                         
W89AB:
      sta  $43C0,y                      
      cmp  #$3C                         
      beq  W89B6                        
      cmp  #$3D                         
      bne  W89BA                        
W89B6:
      lda  #$09                         
      bne  W89BC                        
W89BA:
      lda  #$01                         
W89BC:
      sta  $DBC1,y                      ; Color RAM
      iny                               
      cpy  #$28                         
      bne  W899F                        
      rts                               

W89C5:
      asl                               
      tax                               
W89C7:
      lda  $D011                        ; VIC control register
      bmi  W89C7                        
      lda  $D012                        
      cmp  #$40                         
      bne  W89C7                        
      lda  W9FAD,x                      
      sta  $55                          
      lda  W9FAE,x                      
      sta  $56                          
      lda  #$01                         
      sta  $54                          
      lda  #$08                         
      sta  $D40B                        ; Voice 2: Control registers
      sta  $D412                        ; Voice 3: Control registers
      rts                               

W89EA:
      sta  $69                          
      lda  #$FF                         
      sta  $DC02                        ; Data direction register port A #1
      ldx  #$00                         
      stx  $DC03                        ; Data direction register port B #1
      sty  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      ldx  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  $69                          
      beq  W8A13                        
      txa                               
      and  $69                          
      bne  W8A13                        
      lda  #$1B                         
      sta  $D011                        ; VIC control register
      sec                               
      bcs  W8A14                        
W8A13:
      clc                               
W8A14:
      lda  #$00                         
      sta  $DC02                        ; Data direction register port A #1
      rts                               

W8A1A:
      jsr  W8A49                        
      bcs  W8A20                        
      rts                               

W8A20:
      inc  $5F                          ; Scratch for numeric operation
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      ldx  #$08                         
      stx  $37                          ; Pointer: BASIC ending memory
W8A2B:
      jsr  W8A49                        
      bcs  W8A2B                        
      dec  $37                          ; Pointer: BASIC ending memory
      bne  W8A2B                        
W8A34:
      jsr  W8A49                        
      bcc  W8A34                        
      ldx  #$08                         
      stx  $37                          ; Pointer: BASIC ending memory
W8A3D:
      jsr  W8A49                        
      bcs  W8A3D                        
      dec  $37                          ; Pointer: BASIC ending memory
      bne  W8A3D                        
      dec  $5F                          ; Scratch for numeric operation
      rts                               

W8A49:
      lda  #$80                         
      ldy  #$7F                         
      jsr  W89EA                        
      rts                               

W8A51:
      lda  $DC01                        ; Data port B #1: keyboard, joystick, paddle
      and  #$1F                         
      rts                               

W8A57:
      lda  #$00                         
      sta  $5E                          ; Scratch for numeric operation
      sta  $5D                          ; Scratch for numeric operation
W8A5D:
      jsr  W88CC                        
      lda  #$10                         
      ldy  #$FE                         
      jsr  W89EA                        
      bcc  W8A5D                        
      lda  #$10                         
      ldy  #$FE                         
      jsr  W89EA                        
      bcc  W8A5D                        
      rts                               

      inc  $6A                          ; Floating point accumulator #2: Mantissa
      rti                               

W8A76:
      lda  #$08                         
      sta  $D403                        ; Voice 1: Wave form pulsation amplitude (hi byte)
      sta  $D40A                        ; Voice 2: Wave form pulsation amplitude (hi byte)
      sta  $D411                        ; Voice 3: Wave form pulsation amplitude (hi byte)
      sta  $D018                        ; VIC memory control register
      lda  $DD02                        ; Data direction register port A #2
      ora  #$03                         
      sta  $DD02                        ; Data direction register port A #2
      lda  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      and  #$FC                         
      ora  #$02                         
      sta  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      lda  #$2F                         
      sta  $00                          
      lda  #$33                         
      sta  $01                          ; 6510 I/O register
      ldx  #$00                         
W8AA0:
      lda  $D800,x                      ; Color RAM
      sta  $6400,x                      
      lda  $D900,x                      ; Color RAM
      sta  $6500,x                      
      lda  $DA00,x                      ; Color RAM
      sta  $6600,x                      
      lda  $DB00,x                      ; Color RAM
      sta  $6700,x                      
      inx                               
      bne  W8AA0                        
      lda  #$37                         
      sta  $01                          ; 6510 I/O register
      lda  #$47                         
      sta  $36                          
      lda  #$9B                         
      sta  $37                          ; Pointer: BASIC ending memory
      lda  #$00                         
      sta  $38                          ; Pointer: BASIC ending memory
      lda  #$60                         
      sta  $39                          ; BASIC current line number
      jsr  W9152                        
      ldx  #$08                         
      lda  #$00                         
      sta  $D020                        ; Border color
      tay                               
W8ADA:
      lda  #$00                         
      sta  $65CF,x                      
      lda  $60EF,x                      
      eor  #$FF                         
      sta  $60EF,x                      
      dex                               
      bne  W8ADA                        
      lda  $05                          
      cmp  #$3B                         
      beq  W8AF1                        
      iny                               
W8AF1:
      lda  W9FB5,y                      
      sta  $6B,x                        ; Floating point accumulator #2: Mantissa
      inx                               
      iny                               
      iny                               
      cpy  #$06                         
      bcc  W8AF1                        
      ldx  #$00                         
W8AFF:
      lda  $6C                          
      sta  $D800,x                      ; Color RAM
      sta  $D900,x                      ; Color RAM
      sta  $DA00,x                      ; Color RAM
      lda  #$09                         
      sta  $DA2F,x                      ; Color RAM
      sta  $DB00,x                      ; Color RAM
      lda  #$1E                         
      sta  $4000,x                      
      lda  #$00                         
      sta  $50C0,x                      
      sta  $4C00,x                      
      sta  $43C0,x                      
      dex                               
      bne  W8AFF                        
      jsr  W8B93                        
      lda  #$21                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      lda  #$9E                         
      sta  $37                          
      lda  #$00                         
      sta  $38                          
      lda  #$10                         
      sta  $39                          
      jsr  W9152                        
      lda  #$18                         
      sta  $5127                        
      sta  $512A                        
      sta  $5130                        
      sta  $5133                        
      ldx  #$3F                         
      ldy  #$00                         
W8B4D:
      lda  $6020,x                      
      eor  #$FF                         
      sta  $6398,y                      
      iny                               
      dex                               
      bpl  W8B4D                        
      ldx  #$5F                         
W8B5B:
      lda  $6020,x                      
      eor  #$FF                         
      sta  $6020,x                      
      dex                               
      bpl  W8B5B                        
      lda  #$F5                         
      sta  $D406                        ; Generator 1: Sustain/Release
      sta  $D40D                        ; Generator 2: Sustain/Release
      sta  $D414                        ; Generator 3: Sustain/Release
      lda  #$0F                         
      sta  $D418                        ; Select volume and filter mode
      lda  #$31                         
      sta  $55                          
      lda  #$9F                         
      sta  $56                          
      lda  #$FF                         
      sta  $D015                        ; Sprites Abilitator
      lda  #$01                         
      sta  $D027                        ; Color sprite 0
      lda  #$D6                         
      sta  $0314                        ; Vector: Hardware Interrupt (IRQ)
      lda  #$92                         
      sta  $0315                        ; Vector: Hardware Interrupt (IRQ)
      rts                               

W8B93:
      lda  #$25                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      lda  #$96                         
      sta  $37                          ; Pointer: BASIC ending memory
      lda  #$00                         
      sta  $38                          ; Pointer: BASIC ending memory
      lda  #$48                         
      sta  $39                          
W8BA3:
      ldy  #$3E                         
      ldx  #$00                         
W8BA7:
      lda  ($36),y                      
      sta  ($38),y                      ; Pointer: BASIC ending memory
      stx  $4A                          ; Pointer: variable for the FOR..NEXT
      ldx  #$04                         
W8BAF:
      rol                               
      php                               
      rol                               
      ror  $4B                          ; Scratch area BASIC pointer
      plp                               
      ror  $4B                          ; Scratch area BASIC pointer
      dex                               
      bne  W8BAF                        
      ldx  $4A                          
      tya                               
      clc                               
      adc  $4A                          
      adc  #$3E                         
      sty  $4A                          ; Pointer: variable for the FOR..NEXT
      tay                               
      lda  $4B                          
      sta  ($38),y                      
      ldy  $4A                          
      inx                               
      inx                               
      cpx  #$06                         
      bne  W8BD3                        
      ldx  #$00                         
W8BD3:
      dey                               
      bpl  W8BA7                        
      lda  $38                          
      clc                               
      adc  #$80                         
      sta  $38                          
      bcc  W8BE1                        
      inc  $39                          ; BASIC current line number
W8BE1:
      lda  $36                          ; Pointer: strings for auxiliari programs
      clc                               
      adc  #$40                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      bcc  W8BEC                        
      inc  $37                          ; Pointer: BASIC ending memory
W8BEC:
      cmp  #$25                         
      bne  W8BA3                        
      lda  $37                          ; Pointer: BASIC ending memory
      cmp  #$98                         
      bne  W8BA3                        
      lda  #$25                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      lda  #$98                         
      sta  $37                          ; Pointer: BASIC ending memory
      lda  #$80                         
      sta  $38                          ; Pointer: BASIC ending memory
      lda  #$4C                         
      sta  $39                          ; BASIC current line number
      jsr  W9152                        
      rts                               

W8C0A:
      inc  $09                          ; Screen column after last TAB
      lda  #$1F                         
      sta  $31                          ; Pointer: BASIC ending arrays
      lda  #$03                         
      sta  $07                          ; Search char
      lda  #$C4                         
      sta  $08                          
      lda  #$20                         
      sta  $2C                          
      sta  $2E                          
      lda  #$2A                         
      sta  $43F8                        
      lda  #$00                         
      sta  $13                          
      lda  #$1E                         
      sta  $12                          
      lda  #$96                         
      sta  $14                          ; Transient: integer value
      jsr  W8D32                        
      jsr  W8C5E                        
      jsr  W8CCD                        
      lda  #$00                         
      sta  $15                          
      inc  $0E                          
      sta  $0D                          
      jsr  W919E+1                      
      lda  #$1B                         
      sta  $D011                        ; VIC control register
W8C48:
      ldx  $D011                        ; VIC control register
      bpl  W8C48                        
W8C4D:
      ldx  $D011                        ; VIC control register
      bmi  W8C4D                        
      lda  #$20                         
      sta  $D012                        ; Reading/Writing IRQ balance value
      lda  #$81                         
      sta  $D01A                        ; IRQ mask register
      cli                               
      rts                               

W8C5E:
      ldx  #$00                         
      stx  $3B                          
      stx  $36                          
      stx  $37                          ; Pointer: BASIC ending memory
W8C66:
      ldx  $36                          
      lda  $37                          
      ror                               
      lda  $2B,x                        
      bcc  W8C73                        
      and  #$0F                         
      bcs  W8C77                        
W8C73:
      lsr                               
      lsr                               
      lsr                               
      lsr                               
W8C77:
      bne  W8C92                        
      ldx  $3B                          ; BASIC precedent line number
      bne  W8C94                        
      ldx  $36                          
      cpx  #$02                         
      bcc  W8C8E                        
      cpx  #$04                         
      beq  W8C94                        
      tax                               
      lda  $37                          
      ror                               
      txa                               
      bcs  W8C94                        
W8C8E:
      lda  #$0A                         
      bne  W8C94                        
W8C92:
      inc  $3B                          
W8C94:
      asl                               
      asl                               
      asl                               
      tax                               
      lda  $37                          
      asl                               
      tay                               
      lda  W9DA7,y                      
      sta  $38                          
      lda  W9DA8,y                      
      sta  $39                          
      ldy  #$00                         
W8CA8:
      lda  $6580,x                      
      sta  ($38),y                      
      inx                               
      iny                               
      iny                               
      iny                               
      cpy  #$18                         
      bne  W8CA8                        
      inc  $37                          
      lda  $37                          
      ror                               
      bcs  W8C66                        
      inc  $36                          
      lda  $36                          
      cmp  #$03                         
      bne  W8CC8                        
      lda  #$00                         
      sta  $3B                          
W8CC8:
      cmp  #$05                         
      bne  W8C66                        
      rts                               

W8CCD:
      lda  #$15                         
      sta  $36                          
      lda  #$00                         
      sta  $37                          
      ldy  #$01                         
W8CD7:
      ldx  $07                          
      dex                               
      lda  W9765,y                      
      cpx  #$01                         
      bcs  W8CE3                        
      lda  #$00                         
W8CE3:
      ldx  $37                          
      sta  $4C00,x                      
      inc  $37                          
      inc  $37                          ; Pointer: BASIC ending memory
      ldx  $07                          
      dex                               
      lda  W9765,y                      
      cpx  #$02                         
      bcs  W8CF8                        
      lda  #$00                         
W8CF8:
      ldx  $37                          
      sta  $4C00,x                      
      inc  $37                          ; Pointer: BASIC ending memory
      iny                               
      iny                               
      iny                               
      dec  $36                          
      bne  W8CD7                        
      rts                               

W8D07:
      lda  $26                          
      bne  W8D1F                        
W8D0B:
      lda  $08                          
      asl                               
      eor  $08                          
      asl                               
      eor  $08                          
      asl                               
      asl                               
      eor  $08                          ; Flag: search the quotation marks at the end of one string
      asl                               
      rol  $08                          
      dex                               
      bne  W8D0B                        
      beq  W8D32                        
W8D1F:
      lda  $08                          ; Flag: search the quotation marks at the end of one string
      asl                               
      eor  $08                          
      asl                               
      eor  $08                          ; Flag: search the quotation marks at the end of one string
      asl                               
      asl                               
      rol                               
      eor  $08                          
      lsr                               
      ror  $08                          ; Flag: search the quotation marks at the end of one string
      dex                               
      bne  W8D1F                        
W8D32:
      lda  $08                          ; Flag: search the quotation marks at the end of one string
      lsr                               
      lsr                               
      lsr                               
      and  #$07                         
      sta  $3D                          ; Pointer: BASIC instruction for CONT
      cmp  #$07                         
      bne  W8D41                        
      lda  #$00                         
W8D41:
      and  #$02                         
      sta  $11                          ; Flag: case 0x00=INPUT, case 0x40=GET, case 0x98=READ
      lda  $08                          ; Flag: search the quotation marks at the end of one string
      and  #$07                         
      sta  $3C                          ; BASIC precedent line number
      lda  $D01C                        ; Set multicolor mode for sprite 0..7
      ora  #$01                         
      and  #$81                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      lda  #$00                         
      sta  $D404                        ; Voice 1: Control registers
      sta  $5B                          ; Scratch for numeric operation
      jsr  W8F96                        
W8D5F:
      lda  $D011                        ; VIC control register
      bpl  W8D5F                        
      ldx  #$4F                         
W8D66:
      lda  #$02                         
      sta  $4230,x                      
      lda  #$03                         
      sta  $4280,x                      
      lda  #$0A                         
      sta  $DA80,x                      ; Color RAM
      dex                               
      bpl  W8D66                        
      ldx  #$A0                         
      lda  #$00                         
W8D7C:
      sta  $42CF,x                      
      sta  $4320,x                      
      dex                               
      bne  W8D7C                        
      ldx  #$27                         
      lda  #$1D                         
W8D89:
      sta  $4370,x                      
      dex                               
      bpl  W8D89                        
      lda  #$00                         
      ldx  #$0A                         
W8D93:
      sta  $16,x                        ; Pointer: transient strings stack
      dex                               
      bne  W8D93                        
      sta  $52                          ; Scratch area
      sta  $D01E                        ; Animations contact
      lda  $3D                          ; Pointer: BASIC instruction for CONT
      cmp  #$02                         
      bcc  W8DA6                        
      jmp  W8E3D                        

W8DA6:
      lda  #$39                         
      ldy  #$14                         
      ldx  #$02                         
      jsr  W8F4D                        
      ldx  #$22                         
      stx  $4245                        
      inx                               
      stx  $426D                        
      inx                               
      stx  $4242                        
      inx                               
      stx  $426A                        
      inx                               
      stx  $4295                        
      stx  $42BD                        
      inx                               
      stx  $4292                        
      stx  $42BA                        
      ldy  #$03                         
      lda  $08                          ; Flag: search the quotation marks at the end of one string
      bpl  W8DD6                        
      ldy  #$23                         
W8DD6:
      sty  $38                          ; Pointer: BASIC ending memory
      ldx  #$06                         
      lda  #$80                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      lda  #$42                         
      sta  $37                          ; Pointer: BASIC ending memory
W8DE2:
      ldy  #$13                         
      lda  #$1A                         
      sta  ($36),y                      ; Pointer: strings for auxiliari programs
      iny                               
      lda  #$1B                         
      sta  ($36),y                      ; Pointer: strings for auxiliari programs
      cpx  #$05                         
      bcs  W8DFA                        
      lda  #$1C                         
      ldy  $38                          ; Pointer: BASIC ending memory
      sta  ($36),y                      ; Pointer: strings for auxiliari programs
      iny                               
      sta  ($36),y                      ; Pointer: strings for auxiliari programs
W8DFA:
      lda  $36                          ; Pointer: strings for auxiliari programs
      clc                               
      adc  #$28                         
      sta  $36                          ; Pointer: strings for auxiliari programs
      bcc  W8E05                        
      inc  $37                          ; Pointer: BASIC ending memory
W8E05:
      dex                               
      bne  W8DE2                        
      lda  $3D                          ; Pointer: BASIC instruction for CONT
      cmp  #$01                         
      bne  W8E52                        
      ldx  #$03                         
      ldy  #$0D                         
      jsr  W8F4D                        
      ldx  #$03                         
      ldy  #$1C                         
      jsr  W8F4D                        
      ldx  #$22                         
      stx  $424D                        
      inx                               
      stx  $4275                        
      inx                               
      stx  $423A                        
      inx                               
      stx  $4262                        
      inx                               
      stx  $429D                        
      stx  $42C5                        
      inx                               
      stx  $428A                        
      stx  $42B2                        
      bne  W8E52                        
W8E3D:
      lda  #$B4                         
      sta  $1F                          
      lda  #$3B                         
      sta  $21                          ; Transient strings stack
      lda  $3D                          ; Pointer: BASIC instruction for CONT
      cmp  #$05                         
      bcs  W8E4F                        
      lda  #$01                         
      sta  $41                          ; Pointer: DATA current element address
W8E4F:
      jsr  W8F12                        
W8E52:
      ldy  #$0E                         
      ldx  $3D                          
      cpx  #$04                         
      bne  W8E5D                        
      jmp  W8EE9                        

W8E5D:
      txa                               
      and  #$03                         
      cmp  #$03                         
      beq  W8E66                        
      ldy  #$00                         
W8E66:
      sty  $0B                          
      cpx  #$05                         
      bne  W8E73                        
      jsr  W913C                        
      beq  W8EB3                        
      bne  W8EE8                        
W8E73:
      lda  $D011                        ; VIC control register
      bpl  W8E73                        
      lda  $3C                          
      asl                               
      asl                               
      asl                               
      tax                               
      ldy  #$00                         
W8E80:
      lda  W9DBB,x                      
      sta  $0016,y                      
      inx                               
      iny                               
      cpy  #$06                         
      bne  W8E80                        
      ldx  $3C                          
      lda  W9DF9,x                      
      tax                               
      lda  #$A3                         
W8E94:
      sta  $1B,x                        
      dex                               
      bne  W8E94                        
      ldx  $3C                          
      cpx  #$07                         
      bne  W8EA7                        
      lda  $D01C                        ; Set multicolor mode for sprite 0..7
      ora  #$39                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
W8EA7:
      lda  W9E11,x                      
      tay                               
      lda  W9E09,x                      
      jsr  W8F64                        
      bne  W8EE8                        
W8EB3:
      lda  $3C                          
      and  #$03                         
      tax                               
      lda  $05                          
      cmp  #$3B                         
      bne  W8EC2                        
      cpx  #$00                         
      bne  W8ECA                        
W8EC2:
      lda  $D01C                        ; Set multicolor mode for sprite 0..7
      ora  #$39                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
W8ECA:
      lda  W9E1D,x                      
      tay                               
      lda  W9E19,x                      
      jsr  W8F64                        
      lda  #$0E                         
      sta  $16                          ; Pointer: transient strings stack
      inc  $17                          
      ldx  #$A0                         
      lda  $3C                          
      and  #$03                         
      cmp  #$03                         
      bne  W8EE6                        
      ldx  #$A2                         
W8EE6:
      stx  $1C                          
W8EE8:
      rts                               

W8EE9:
      sty  $0B                          
      lda  #$38                         
      ldy  #$00                         
      jsr  W8F64                        
      sty  $2A                          
      lda  #$01                         
      sta  $41                          
      lda  #$86                         
      sta  $16                          
      lda  #$AB                         
      sta  $18                          
      lda  #$D0                         
      sta  $1A                          
      lda  #$A3                         
      sta  $1C                          
      sta  $1D                          
      sta  $1E                          
      lda  $3C                          
      and  #$02                         
      sta  $11                          
W8F12:
      ldx  #$00                         
      lda  $41                          
      beq  W8F1A                        
      ldx  #$06                         
W8F1A:
      stx  $42                          
      lda  #$00                         
      sta  $43                          ; Vector: INPUT routine
      sta  $4E                          ; Scratch area
      sta  $51                          
      sta  $52                          
W8F26:
      lda  $42                          ; Pointer: DATA current element address
      asl                               
      tax                               
      lda  W9EB0,x                      
      sta  $36                          ; Pointer: strings for auxiliari programs
      lda  W9EB1,x                      
      sta  $37                          
      ldy  #$00                         
      ldx  #$00                         
W8F38:
      lda  ($36),y                      
      cpy  #$14                         
      bcs  W8F43                        
      sta  $423A,x                      
      bne  W8F46                        
W8F43:
      sta  $424E,x                      
W8F46:
      iny                               
      inx                               
      cpy  #$28                         
      bne  W8F38                        
      rts                               

W8F4D:
      lda  #$20                         
      sta  $4230,y                      
      lda  #$21                         
      sta  $4258,y                      
      lda  #$00                         
      sta  $4280,y                      
      sta  $42A8,y                      
      dey                               
      dex                               
      bne  W8F4D                        
      rts                               

W8F64:
      ldx  #$02                         
W8F66:
      sta  $43FB,x                      
      pha                               
      tya                               
      sta  $D02A,x                      ; Color sprite 3
      pla                               
      dex                               
      bpl  W8F66                        
      rts                               

W8F73:
      lda  $3F                          
      asl                               
      eor  $3F                          
      asl                               
      rol  $3F                          
      lsr                               
      lsr                               
      lsr                               
      sta  $3A                          
      lda  $3F                          
      and  #$F0                         
      ora  $3A                          
      sta  $3A                          
      rts                               

W8F89:
      asl  $38                          ; Pointer: BASIC ending memory
      rol  $39                          
      asl  $38                          
      rol  $39                          
      asl  $38                          
      rol  $39                          
      rts                               

W8F96:
      lda  $08                          
      sta  $3F                          
      ldx  #$C9                         
      lda  #$03                         
W8F9E:
      sta  $17FF,x                      
      dex                               
      bne  W8F9E                        
      ldx  #$77                         
      clc                               
W8FA7:
      jsr  W8F73                        
      and  #$14                         
      beq  W8FB2                        
      lda  #$1E                         
      bne  W8FBB                        
W8FB2:
      lda  $3A                          ; BASIC current line number
      and  #$03                         
      php                               
      clc                               
      adc  #$0C                         
      plp                               
W8FBB:
      sta  $40A0,x                      
      sta  $18A0,x                      
      cpx  #$28                         
      bcs  W8FCC                        
      txa                               
      clc                               
      adc  #$4A                         
      sta  $4118,x                      
W8FCC:
      dex                               
      bpl  W8FA7                        
      lda  $3F                          ; DATA current line number
      and  #$03                         
      ora  #$04                         
      sta  $3E                          
      lda  #$00                         
      sta  $36                          
      lda  #$20                         
      sta  $37                          
      ldx  #$27                         
W8FE1:
      jsr  W8F73                        
      ldy  $3E                          
      cpy  #$04                         
      bne  W8FED                        
W8FEA:
      iny                               
      bne  W8FF8                        
W8FED:
      cpy  #$0B                         
      bne  W8FF4                        
      dey                               
      bne  W8FF8                        
W8FF4:
      rol                               
      bcc  W8FEA                        
      dey                               
W8FF8:
      sty  $3E                          
      sty  $38                          
      lda  #$00                         
      sta  $39                          
      jsr  W8F89                        
      lda  $39                          
      clc                               
      adc  #$60                         
      sta  $39                          ; BASIC current line number
      ldy  #$07                         
W900C:
      lda  ($38),y                      
      sta  ($36),y                      
      dey                               
      bpl  W900C                        
      lda  $3E                          
      clc                               
      adc  #$6F                         
      sta  $18A0,x                      
      lda  $36                          
      clc                               
      adc  #$08                         
      sta  $36                          
      bcc  W9026                        
      inc  $37                          
W9026:
      dex                               
      bpl  W8FE1                        
      lda  #$03                         
      sta  $3E                          
      lda  #$00                         
      sta  $60                          
W9031:
      jsr  W8F73                        
      ldx  $3E                          
      beq  W9051                        
      cpx  #$03                         
      beq  W9051                        
      lda  $60                          
      bne  W9051                        
      lda  $3F                          
      and  #$C0                         
      cmp  #$C0                         
      bne  W9051                        
      inc  $60                          
      lda  #$FF                         
      sta  $61,x                        
      jmp  W90CD                        

W9051:
      lda  #$00                         
      cpx  #$03                         
      beq  W905F                        
      lda  $3F                          
      and  #$07                         
      cmp  #$06                         
      bcs  W9031                        
W905F:
      sta  $40                          
      sta  $38                          
      lda  #$00                         
      sta  $39                          
      jsr  W8F89                        
      lda  $3E                          
      asl                               
      tax                               
      lda  W9D9F,x                      
      clc                               
      adc  $38                          
      sta  $38                          
      lda  W9DA0,x                      
      adc  $39                          ; BASIC current line number
      sta  $39                          
      lda  $3F                          
      and  #$30                         
      lsr                               
      lsr                               
      lsr                               
      tax                               
      lsr                               
      pha                               
      lda  W9D83,x                      
      sta  $36                          
      lda  W9D84,x                      
      sta  $37                          
      ldy  #$27                         
W9093:
      lda  ($36),y                      
      and  ($38),y                      
      sta  ($38),y                      
      dey                               
      bpl  W9093                        
      lda  $3E                          
      asl                               
      sta  $36                          
      asl                               
      asl                               
      clc                               
      adc  $36                          
      adc  $40                          
      sta  $36                          
      ldx  $3E                          
      sta  $61,x                        
      pla                               
      sta  $37                          
      sta  $65,x                        
      asl                               
      asl                               
      clc                               
      adc  $37                          
      sta  $37                          
      ldy  #$05                         
W90BC:
      ldx  $37                          
      lda  W9D8B,x                      
      inc  $37                          
      ldx  $36                          
      sta  $1800,x                      
      inc  $36                          
      dey                               
      bne  W90BC                        
W90CD:
      dec  $3E                          
      bmi  W90D4                        
      jmp  W9031                        

W90D4:
      lda  #$28                         
      sta  $36                          
      lda  #$18                         
      sta  $37                          
      lda  #$05                         
      sta  $38                          
W90E0:
      lda  #$03                         
      sta  $39                          
W90E4:
      ldx  $39                          
      lda  $61,x                        
      cmp  #$FF                         
      beq  W9103                        
      sta  $3E                          
      lda  $65,x                        
      and  #$02                         
      lsr                               
      clc                               
      adc  #$02                         
      tax                               
      clc                               
      adc  $3E                          
      tay                               
      lda  #$00                         
W90FD:
      sta  ($36),y                      
      dey                               
      dex                               
      bne  W90FD                        
W9103:
      dec  $39                          
      bpl  W90E4                        
      lda  $36                          
      clc                               
      adc  #$28                         
      sta  $36                          
      bcc  W9112                        
      inc  $37                          
W9112:
      dec  $38                          
      bne  W90E0                        
W9116:
      lda  $D011                        ; VIC control register
      bmi  W9116                        
      lda  $D012                        
      cmp  #$B0                         
      bcc  W9116                        
      ldx  #$00                         
W9124:
      lda  $1800,x                      
      sta  $4140,x                      
      lda  $2000,x                      
      sta  $6250,x                      
      lda  $2050,x                      
      sta  $62A0,x                      
      inx                               
      cpx  #$F0                         
      bne  W9124                        
      rts                               

W913C:
      lda  $08                          
      rol                               
      rol                               
      rol                               
      and  #$03                         
      tax                               
      ldy  $3C                          
      lda  W9E01,y                      
      tay                               
      and  $32,x                        
      php                               
      tya                               
      ora  $32,x                        
      plp                               
      rts                               

W9152:
      ldy  #$00                         
W9154:
      lda  ($36),y                      
      bmi  W9169                        
      sta  ($38),y                      
      inc  $36                          ; Pointer: strings for auxiliari programs
      bne  W9160                        
      inc  $37                          
W9160:
      inc  $38                          
      bne  W9166                        
      inc  $39                          
W9166:
      jmp  W9154                        

W9169:
      cmp  #$FF                         
      beq  W918C                        
      and  #$7F                         
      tax                               
      inc  $36                          
      bne  W9176                        
      inc  $37                          
W9176:
      lda  ($36),y                      
      sta  ($38),y                      
      inc  $38                          
      bne  W9180                        
      inc  $39                          
W9180:
      dex                               
      bpl  W9176                        
      inc  $36                          
      bne  W9189                        
      inc  $37                          
W9189:
      jmp  W9154                        

W918C:
      rts                               

W918D:
      eor  $40                          
      .byte $3A, $31, $24, $19, $10, $09
W9195:
      .byte $04
W9196:
      .byte $02, $02, $02, $02, $02, $01, $01, $01 
W919E:
      ora  ($A2,x)                      ; Real time clock HMS (1/60 sec)
      brk                               
      txa                               
W91A2:
      sta  $0800,x                      
      sta  $0900,x                      
      sta  $0A00,x                      
      dex                               
      bne  W91A2                        
      lda  #$29                         
      sta  $0C                          ; Flag: default dimension for DIM
      ldx  #$00                         
W91B4:
      lda  $0E                          
      cmp  W918D,x                      
      beq  W91BD                        
      bcs  W91CA                        
W91BD:
      lda  W9196,x                      
      clc                               
      adc  $0C                          
      sta  $0C                          
      inx                               
      cpx  #$09                         
      bne  W91B4                        
W91CA:
      ldy  $0C                          
W91CC:
      lda  $0C                          
      sta  $49                          
      sty  $36                          
      lda  $0E                          
      sta  $37                          
      lda  #$00                         
      ldx  #$08                         
W91DA:
      lsr  $36                          
      bcc  W91E1                        
      clc                               
      adc  $37                          
W91E1:
      ror                               
      ror  $48                          
      dex                               
      bne  W91DA                        
      ldx  #$08                         
      sec                               
      sbc  $49                          
W91EC:
      php                               
      rol  $45                          
      asl  $48                          
      rol                               
      plp                               
      bcc  W91FA                        
      sbc  $49                          
      jmp  W91FC                        

W91FA:
      adc  $49                          
W91FC:
      dex                               
      bne  W91EC                        
      bcs  W9204                        
      adc  $49                          
      clc                               
W9204:
      rol  $45                          
      inc  $45                          
W9208:
      sty  $4B                          
      lda  $0D                          
      ldx  $4D                          
      beq  W9212                        
      eor  #$01                         
W9212:
      cmp  #$00                         
      beq  W921D                        
      lda  #$5F                         
      sec                               
      sbc  $45                          
      bcs  W921F                        
W921D:
      lda  $45                          
W921F:
      sta  $38                          
      and  #$07                         
      tax                               
      lda  $38                          
      lsr                               
      lsr                               
      and  #$FE                         
      tay                               
      lda  W9EBE,y                      
      sta  $38                          
      lda  W9EBF,y                      
      sta  $39                          
      ldy  $4B                          
      tya                               
      asl                               
      clc                               
      adc  $4B                          
      cpy  #$15                         
      bcc  W924A                        
      clc                               
      adc  #$01                         
      cpy  #$2A                         
      bcc  W924A                        
      clc                               
      adc  #$01                         
W924A:
      tay                               
      lda  ($38),y                      
      ora  W9E01,x                      
      sta  ($38),y                      
      ldy  $4B                          
      dey                               
      cpy  #$0C                         
      beq  W926B                        
      tya                               
      ror                               
      bcs  W9268                        
      lda  $0E                          
      cmp  #$10                         
      bcc  W9265                        
      dec  $45                          
W9265:
      jmp  W9208                        

W9268:
      jmp  W91CC                        

W926B:
      lda  $D011                        ; VIC control register
      bmi  W926B                        
      lda  $D012                        ; Reading/Writing IRQ balance value
      cmp  #$C0                         
      bcc  W926B                        
      lda  $4D                          
      beq  W9281                        
      lda  $0D                          
      eor  #$01                         
      sta  $0D                          
W9281:
      ldx  #$00                         
W9283:
      lda  $0800,x                      
      sta  $5140,x                      
      lda  $0900,x                      
      sta  $5240,x                      
      lda  $0A00,x                      
      sta  $5340,x                      
      inx                               
      bne  W9283                        
      stx  $4D                          ; Accumulator for the simbols compare
      rts                               

W929B:
      lda  #$7F                         
      sta  $DC0D                        ; Interrupt control register CIA #1
      sta  $DD0D                        ; Interrupt control register CIA #2
      sta  $DC00                        ; Data port A #1: keyboard, joystick, paddle, optical pencil
      lda  #$08                         
      sta  $DC0E                        ; Control register A of CIA #1
      sta  $DD0E                        ; Control register A of CIA #2
      sta  $DC0F                        ; Control register B of CIA #1
      sta  $DD0F                        ; Control register B of CIA #2
      ldx  #$00                         
      stx  $DC03                        ; Data direction register port B #1
      stx  $DD03                        ; Data direction register port A #2
      stx  $D418                        ; Select volume and filter mode
      dex                               
      stx  $DC02                        ; Data direction register port A #1
      lda  #$07                         
      sta  $DD00                        ; Data port A #2: serial bus, RS-232, VIC memory
      lda  #$3F                         
      sta  $DD02                        ; Data direction register port A #2
      lda  #$E7                         
      sta  $01                          ; 6510 I/O register
      lda  #$2F                         
      sta  $00                          
      rts                               

W92D6:
      lda  $6B                          ; Floating point accumulator #2: Mantissa
      sta  $D016                        ; VIC control register
      lda  #$01                         
      sta  $D028                        ; Color sprite 1
      sta  $D029                        ; Color sprite 2
      lda  #$00                         
      sta  $D01B                        ; Sprite-background screen priority
      sta  $D026                        ; Multicolor animation 1 register
      lda  #$0E                         
      sta  $D025                        ; Multicolor animation 0 register
      lda  #$3C                         
      sta  $D003                        ; Position Y sprite 1
      sta  $D005                        ; Position Y sprite 2
      sta  $D00F                        ; Position Y sprite 7
      lda  #$50                         
      sta  $D002                        ; Position X sprite 1
      lda  #$80                         
      sta  $D004                        ; Position X sprite 2
      lda  #$28                         
      sta  $D00E                        ; Position X sprite 7
      ldx  #$43                         
      stx  $43F9                        
      inx                               
      stx  $43FA                        
      lda  #$30                         
      sta  $43FF                        
      lda  $D01C                        ; Set multicolor mode for sprite 0..7
      ora  #$80                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      lda  #$01                         
      sta  $D02E                        ; Color sprite 7
      lda  $6D                          ; Floating point accumulator #2: Mantissa
      sta  $D021                        ; Background 0 color
      lda  #$05                         
      sta  $D022                        ; Background 1 color
      sta  $D023                        ; Background 2 color
      lda  $12                          
      sta  $D000                        ; Position X sprite 0
      lda  $14                          
      sta  $D001                        ; Position Y sprite 0
      lda  $16                          
      sta  $D006                        ; Position X sprite 3
      lda  $1C                          
      sta  $D007                        ; Position Y sprite 3
      lda  $18                          
      sta  $D008                        ; Position X sprite 4
      lda  $1D                          
      sta  $D009                        ; Position Y sprite 4
      lda  $1A                          
      sta  $D00A                        ; Position X sprite 5
      lda  $1E                          
      sta  $D00B                        ; Position Y sprite 5
      lda  #$00                         
      ldy  $13                          
      beq  W9362                        
      ora  #$01                         
W9362:
      ldy  $17                          ; Last transient strings address
      beq  W9368                        
      ora  #$08                         
W9368:
      ldy  $19                          ; Transient strings stack
      beq  W936E                        
      ora  #$10                         
W936E:
      ldy  $1B                          
      beq  W9374                        
      ora  #$20                         
W9374:
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      ora  #$06                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      ldx  #$02                         
      lda  #$50                         
      sta  $D012                        ; Reading/Writing IRQ balance value
W9386:
      lda  W9EFF,x                      
      sta  $0314                        ; Vector: Hardware Interrupt (IRQ)
      lda  W9F00,x                      
      sta  $0315                        ; Vector: Hardware Interrupt (IRQ)
      lda  #$81                         
      sta  $D019                        ; Interrupt indicator register
      pla                               
      tay                               
      pla                               
      tax                               
      pla                               
      rti                               

      cld                               
      ldx  #$00                         
      stx  $D028                        ; Color sprite 1
      stx  $D029                        ; Color sprite 2
      stx  $D02E                        ; Color sprite 7
      lda  $0D                          ; Data type: case 0xFF=Stringa, case 0x00=Numerico
      beq  W93B1                        
      lda  #$57                         
      bne  W93B3                        
W93B1:
      lda  #$B5                         
W93B3:
      clc                               
      sta  $D002                        ; Position X sprite 1
      adc  #$18                         
      sta  $D004                        ; Position X sprite 2
      adc  #$18                         
      sta  $D00C                        ; Position X sprite 6
      adc  #$18                         
      sta  $D00E                        ; Position X sprite 7
      ldy  #$60                         
      lda  $11                          ; Flag: case 0x00=INPUT, case 0x40=GET, case 0x98=READ
      bne  W93CE                        
      ldy  #$00                         
W93CE:
      sty  $D003                        ; Position Y sprite 1
      sty  $D005                        ; Position Y sprite 2
      sty  $D00D                        ; Position Y sprite 6
      sty  $D00F                        ; Position Y sprite 7
      bne  W93E8                        
      sty  $D002                        ; Position X sprite 1
      sty  $D004                        ; Position X sprite 2
      sty  $D00C                        ; Position X sprite 6
      sty  $D00E                        ; Position X sprite 7
W93E8:
      lda  #$C6                         
      sta  $D01B                        ; Sprite-background screen priority
      lda  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      and  #$39                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      lda  $D01C                        ; Set multicolor mode for sprite 0..7
      and  #$7F                         
      sta  $D01C                        ; Set multicolor mode for sprite 0..7
      lda  #$45                         
      sta  $43F9                        
      lda  #$48                         
      sta  $43FA                        
      lda  #$4B                         
      sta  $43FE                        
      lda  #$4E                         
      sta  $43FF                        
      lda  $D01E                        ; Animations contact
      lda  #$00                         
      ldx  #$6B                         
W9418:
      cpx  $D012                        ; Reading/Writing IRQ balance value
      bcs  W9418                        
      sta  $D01B                        ; Sprite-background screen priority
      lda  #$75                         
W9422:
      cmp  $D012                        ; Reading/Writing IRQ balance value
      bne  W9422                        
      sta  $D003                        ; Position Y sprite 1
      inc  $43F9                        
      sta  $D005                        ; Position Y sprite 2
      inc  $43FA                        
      sta  $D00D                        ; Position Y sprite 6
      inc  $43FE                        
      sta  $D00F                        ; Position Y sprite 7
      inc  $43FF                        
      lda  #$8A                         
W9441:
      cmp  $D012                        ; Reading/Writing IRQ balance value
      bne  W9441                        
      sta  $D003                        ; Position Y sprite 1
      inc  $43F9                        
      sta  $D005                        ; Position Y sprite 2
      inc  $43FA                        
      sta  $D00D                        ; Position Y sprite 6
      inc  $43FE                        
      sta  $D00F                        ; Position Y sprite 7
      inc  $43FF                        
      lda  #$A2                         
      sta  $D012                        ; Reading/Writing IRQ balance value
      ldx  #$04                         
      jmp  W9386                        

      pha                               
      pla                               
      ldx  #$18                         
      lda  #$07                         
      sta  $D023                        ; Background 2 color
      stx  $D016                        ; VIC control register
      ldy  #$08                         
      sty  $D022                        ; Background 1 color
      lda  $0B                          
      sta  $D021                        
      lda  #$00                         
      sta  $D01B                        ; Sprite-background screen priority
      ldx  $D012                        
      cpx  #$A2                         
      bcs  W948D                        
      jmp  W8009                     

W948D:
      lda  #$AB                         
      sta  $D012                        ; Reading/Writing IRQ balance value
      ldx  #$06                         
      jmp  W9386                        

      lda  #$01                         
      sta  $D01B                        ; Sprite-background screen priority
      lda  #$00                         
      ldy  #$06                         
      ldx  #$B0                         
W94A2:
      cpx  $D012                        
      bne  W94A2                        
      sta  $D021                        ; Background 0 color
      sty  $D025                        ; Multicolor animation 0 register
      lda  #$09                         
      ldy  #$02                         
      ldx  #$B2                         
W94B3:
      cpx  $D012                        ; Reading/Writing IRQ balance value
      bcs  W94B3                        
      sty  $D023                        ; Background 2 color
      sta  $D026                        ; Multicolor animation 1 register
      lda  #$00                         
      sta  $D01D                        ; (2X) horizontal expansion (X) sprite 0..7
      lda  $D01E                        ; Animations contact
      ora  $4E                          
      sta  $4E                          
      lda  $1F                          
      sta  $D002                        ; Position X sprite 1
      lda  $20                          
      asl                               
      sta  $44                          
      lda  $D010                        ; Position X MSB sprites 0..7
      and  #$DF                         
      ora  $44                          ; Vector: INPUT routine
      sta  $D010                        ; Position X MSB sprites 0..7
      lda  $1F                          
      ora  $20                          
      beq  W94E6                        
      lda  #$D9                         
W94E6:
      sta  $D003                        
      lda  $21                          
      sta  $43F9                        
      lda  #$01                         
      sta  $D028                        ; Color sprite 1
      lda  $2E                          
      ldx  $5F                          
      bne  W951A                        
      ora  $2F                          
      beq  W951A                        
      dec  $30                          
      bne  W951A                        
      lda  $05                          
      sta  $30                          
      sed                               
      lda  $2F                          
      sec                               
      sbc  #$01                         
      sta  $2F                          
      bpl  W951A                        
      lda  #$59                         
      sta  $2F                          
      lda  $2E                          
      sec                               
      sbc  #$01                         
      sta  $2E                          
W951A:
      lda  #$EA                         
      sta  $D012                        ; Reading/Writing IRQ balance value
      ldx  #$08                         
      jmp  W9386                        

      lda  #$00                         
      sta  $D021                        ; Background 0 color
      lda  #$10                         
      ora  $5C                          
      ldx  #$ED                         
W952F:
      cpx  $D012                        ; Reading/Writing IRQ balance value
      bne  W952F                        
      sta  $D016                        ; VIC control register
      ldx  #$F3                         
W9539:
      lda  W9EC9,x                      
      tay                               
      lda  W9EC8,x                      
W9540:
      cpx  $D012                        ; Reading/Writing IRQ balance value
      bne  W9540                        
      sta  $D023                        ; Background 2 color
      sty  $D022                        ; Background 1 color
      inx                               
      inx                               
      cpx  #$FA                         
      bcc  W9539                        
      lda  $D01E                        ; Animations contact
      ora  $51                          
      sta  $51                          
      cld                               
      ldy  #$00                         
      lda  ($55),y                      ; Vector of jump fusion
      cmp  #$FF                         
      beq  W959C                        
      dec  $54                          
      bne  W95A8                        
      lda  $55                          
      clc                               
      adc  #$04                         
      sta  $55                          
      bcc  W9570                        
      inc  $56                          
W9570:
      lda  ($55),y                      
      cmp  #$FF                         
      beq  W959C                        
      sta  $D407                        ; Voice 2: Frequency control (lo byte)
      iny                               
      lda  ($55),y                      
      sta  $D40E                        ; Voice 3: Frequency control (lo byte)
      iny                               
      lda  ($55),y                      
      sta  $D408                        ; Voice 2: Frequency control (hi byte)
      sta  $D40F                        ; Voice 3: Frequency control (hi byte)
      iny                               
      lda  ($55),y                      ; Vector of jump fusion
      cmp  #$01                         
      beq  W9598                        
      ldy  $05                          
      cpy  #$3B                         
      beq  W9598                        
      sec                               
      sbc  #$01                         
W9598:
      sta  $54                          
      ldy  #$41                         
W959C:
      cpy  #$00                         
      bne  W95A2                        
      ldy  #$08                         
W95A2:
      sty  $D40B                        ; Voice 2: Control registers
      sty  $D412                        ; Voice 3: Control registers
W95A8:
      lda  $09                          ; Screen column after last TAB
      asl                               
      eor  $09                          ; Screen column after last TAB
      asl                               
      rol  $09                          ; Screen column after last TAB
      ldx  $3D                          ; Pointer: BASIC instruction for CONT
      lda  $3C                          
      cpx  #$05                         
      beq  W95C2                        
      cpx  #$04                         
      beq  W95E8                        
      cmp  #$06                         
      bcs  W95D8                        
      bcc  W95E8                        
W95C2:
      and  #$03                         
      cmp  #$03                         
      bne  W95D8                        
      lda  $09                          
      ora  #$9F                         
      sta  $5087                        
      lda  $09                          
      ora  #$F9                         
      sta  $508A                        
      bne  W95E8                        
W95D8:
      lda  $09                          ; Screen column after last TAB
      and  #$01                         
      sta  $44                          ; Vector: INPUT routine
      lda  $43FB                        
      and  #$FE                         
      ora  $44                          
      sta  $43FB                        
W95E8:
      inc  $29                          
      bne  W95F4                        
      inc  $28                          
      bne  W95F4                        
      lda  #$0B                         
      bne  W9603                        
W95F4:
      jsr  W8A51                        
      cmp  #$1F                         
      beq  W9606                        
      lda  #$00                         
      sta  $28                          
      sta  $29                          
      lda  #$1B                         
W9603:
      sta  $D011                        ; VIC control register
W9606:
      lda  #$20                         
      sta  $D012                        
      lda  #$4C                         
      sta  W92D6                        
      lda  $6A                          
      beq  W9620                        
      lda  #$00                         
      sta  $6A                          
      jsr  W8A49                        
      bcc  W9620                        
      jmp  W8009                     

W9620:
      ldx  #$00                         
      jmp  W9386                        

      .byte $00, $FC, $00, $00, $F8, $00, $00, $F8 
      .byte $00, $00, $E8, $00, $00, $10, $00 
W9634:
      .byte $00, $14, $00, $00, $54, $00, $00, $54 
      .byte $00, $00, $54, $00, $00, $56, $00, $00 
      .byte $24, $00, $00, $3C, $00, $00, $3C, $00 
      .byte $00, $3F, $00, $00, $3F, $00, $00, $33 
      .byte $00, $03, $F3, $00, $03, $03, $00, $03 
      .byte $00, $F0, $00               
W965F:
      .byte $00, $C0, $00, $00, $00, $00, $00, $FC 
      .byte $00, $00, $F8, $00, $00, $F8, $00, $00 
      .byte $E8, $00, $00, $10, $00     
W9674:
      .byte $00, $14, $00, $00, $14, $00, $00, $14 
      .byte $00, $00, $14, $00, $00, $16, $00, $00 
      .byte $16, $00, $00, $3C, $00, $00, $3C, $00 
      .byte $00, $3F, $00, $00, $0F, $C0, $00 
W9693:
      .byte $0C, $C0                    
W9695:
      .byte $00, $FF, $C0, $00, $CC, $00, $00, $CC 
      .byte $00, $00, $0C, $00, $00, $0F, $00, $00 
      .byte $00, $FC, $00, $00, $F8, $00, $00, $F8 
      .byte $00, $00, $E8, $00, $00, $10, $00 
W96B4:
      .byte $00, $14, $00, $00, $54, $00, $00, $54 
      .byte $80, $00, $55, $40, $00, $55, $00, $00 
      .byte $24, $00, $00, $3C, $00, $00, $3F, $00 
      .byte $00, $3F, $C0, $00, $33, $C0, $00, $F0 
      .byte $C0, $00, $F3, $00, $00, $C3, $00, $00 
      .byte $C0, $C0, $00, $C0, $00, $00, $30, $00 
W96E4:
      .byte $00, $00, $FC, $00, $00, $F8, $00, $00 
      .byte $F8, $00, $00, $E8, $00, $00, $10, $00 
W96F4:
      .byte $00, $14, $80, $00, $55, $40, $01, $55 
      .byte $00, $01, $14, $00, $02, $14, $00, $00 
      .byte $14, $00, $00, $3C, $00, $00, $3F, $00 
      .byte $00, $FF, $C0, $00, $F3, $C0
W9712:
      .byte $03, $C0, $C0, $03, $C0, $C0, $0F, $00 
      .byte $F0, $0C, $00, $00, $0C, $00, $00, $00 
      .byte $00, $00, $00, $00, $FC, $00, $00, $F8 
      .byte $00, $00, $F8, $00, $00, $E8, $00, $00 
      .byte $10, $80, $00, $15, $40, $00, $55, $00 
      .byte $01, $54, $00, $05, $14, $00, $08, $14 
      .byte $00, $00                    
W9744:
      .byte $14
W9745:
      .byte $00, $00, $3F, $00, $00, $3F, $C0, $0F 
      .byte $3C, $C0, $03, $F0, $C0, $00, $F0, $F0 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
W9765:
      .byte $00, $FC, $00, $00, $F8, $00, $00, $F8 
      .byte $00, $00, $E8, $00, $00, $10, $00 
W9774:
      .byte $00, $14, $00, $00, $14, $80, $00, $15 
      .byte $80, $00, $15, $00, $00, $14, $00, $00 
      .byte $14, $00, $00, $3C, $00, $00, $3C, $00 
      .byte $00, $3C, $00, $00, $3C, $00, $00, $3C 
      .byte $00, $00, $3C, $00, $00, $3C, $00, $00 
      .byte $3F, $00, $00, $30, $00     
W97A1:
      .byte $00, $3C, $00, $00, $03, $F0, $00, $03 
      .byte $E2, $00, $03, $E1, $00, $03, $A1, $00 
      .byte $00, $41, $00, $00, $55, $00, $00, $50 
      .byte $00                         
W97BA:
      .byte $00, $50, $00               
W97BD:
      .byte $00, $50, $00               
W97C0:
      .byte $00, $50, $00               
W97C3:
      .byte $00, $50, $00               
W97C6:
      .byte $00, $F3, $F0, $00, $FF, $3C, $00 
W97CD:
      .byte $FF, $0C                    
W97CF:
      .byte $00, $3C, $0F, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $00 
      .byte $00, $00, $00, $00, $00, $00, $00, $3C 
      .byte $00, $00, $3C, $00, $00, $3C, $00, $00 
      .byte $00, $80, $00, $14, $40, $00, $15, $40 
      .byte $00, $55, $00, $00, $54, $00, $00, $54 
      .byte $00, $00, $14, $00, $00, $3F, $00, $00 
      .byte $3F, $C0, $00, $33, $C0, $00, $30, $C0 
      .byte $00, $33, $C0, $00, $33, $00, $00, $33 
      .byte $00, $00, $33, $C0, $00, $30, $00 
W981E:
      .byte $00, $30, $00               
W9821:
      .byte $00, $F0, $00               
W9824:
      .byte $00, $00, $3C, $81, $00, $80, $FF, $00 
      .byte $03, $80, $F3, $80, $C0, $03, $3F, $80 
      .byte $C0, $03, $80, $FF, $80, $C0, $03, $80 
W983C:
      .byte $F3, $80, $C0, $03, $3F, $80, $C0, $03 
      .byte $80, $FF, $80, $C0, $03, $80, $C3, $80 
      .byte $C0, $03, $3C, $80, $C0, $03, $3C, $80 
      .byte $C0, $03, $3C, $80, $C0, $00
W985A:
      .byte $80
W985B:
      .byte $C3, $81, $00               
W985E:
      .byte $3C, $97, $00, $3C, $81, $00, $80, $FF 
      .byte $00, $03, $80, $CF, $80, $C0, $03, $80 
      .byte $FC, $80, $C0, $03, $80, $FF, $80, $C0 
      .byte $03, $80, $CF, $80, $C0, $03, $80, $FC 
      .byte $80, $C0, $03, $80, $FF, $80, $C0, $03 
      .byte $80, $C3, $80, $C0, $03, $3C, $80, $C0 
      .byte $03, $3C, $80, $C0, $03, $3C, $80, $C0 
      .byte $00, $80, $C3, $81, $00, $3C, $97, $00 
      .byte $0C, $81, $00, $0C, $81, $00, $0F, $81 
      .byte $00, $0F, $81, $00, $3F, $81, $00, $3F 
      .byte $81, $00, $3F, $80, $C0, $00, $80, $FF 
      .byte $80, $C0, $00, $80, $DD, $80, $C0, $00 
      .byte $80, $D7, $81, $00, $34, $81, $00, $80 
      .byte $AA, $00, $02, $80, $AA     
W98CB:
      .byte $80, $80, $0A, $80, $82, $80, $A0, $0A 
      .byte $00, $80, $A0, $93, $00, $30, $81, $00 
      .byte $30, $81, $00, $80, $F0, $81, $00, $80 
      .byte $F0, $81, $00, $80, $FC, $81, $00, $80 
      .byte $FC, $00, $03, $80, $FC, $00, $03, $77 
      .byte $00, $03, $80, $D7, $81, $00, $80, $DF 
      .byte $81, $00, $3C, $81, $00, $80, $AA, $00 
      .byte $02, $80, $AA, $80, $80, $0A, $80, $82 
      .byte $80, $A0, $0A, $00, $80, $A0, $95, $00 
      .byte $0C, $80, $F0, $00, $03, $80, $FC, $81 
      .byte $00, $80, $FF, $81, $00, $0F, $81, $00 
      .byte $0F, $81, $00, $3C, $81, $00, $80, $F0 
      .byte $00, $03, $80, $C0, $00, $0F, $80, $FC 
      .byte $30, $0A, $80, $A8, $30, $0F, $80, $FC 
      .byte $30, $0A, $80, $A8          
W993F:
      .byte $30, $0F, $80, $FF, $80, $C0, $95, $00 
W9947:
      .byte $30
W9948:
      .byte $82, $00, $80, $F0, $00, $03, $80 
W994F:
      .byte $FC
W9950:
      .byte $81, $00, $80, $FF, $81, $00, $0F, $81 
      .byte $00, $0F, $81, $00, $3C, $81, $00, $80 
      .byte $F0, $00, $03, $80, $C0, $00, $0F, $80 
      .byte $FC, $80, $C0, $0A, $80, $A8, $80, $C0 
      .byte $0F, $80, $FC, $30, $0A, $80, $A8, $30 
      .byte $0F, $80, $FF, $80, $C0, $95, $00 
W997F:
      .byte $80, $E0, $81, $00, $80, $FF, $80, $80 
      .byte $00                         
W9988:
      .byte $80, $E3, $80, $FE, $38, $03, $80, $8F 
      .byte $80, $F8, $00, $0E, $3F, $81, $00 
W9997:
      .byte $3F, $81                    
W9999:
      .byte $00, $3F, $80, $E3, $80, $8E, $3F, $82 
      .byte $FF, $7F, $81, $FF, $AB, $00, $01, $80 
      .byte $C0, $00, $01, $80, $F8, $82, $FF, $1C 
      .byte $71, $80, $FF, $80, $E3, $80, $8E, $3F 
      .byte $82, $FF, $7F, $81, $FF, $A4, $00, $07 
      .byte $80, $F8, $00, $3F, $14, $00, $38, $1C 
      .byte $00, $38, $00, $80, $E0, $3F, $07, $00 
      .byte $0F, $80, $F0, $80, $E0, $07, $80, $F8 
      .byte $81, $00, $80, $FF, $81, $00, $60, $80 
      .byte $F0, $03, $80, $9C, $78, $9E, $00, $03 
      .byte $80, $F8, $00               
W99EC:
      .byte $0F, $06                    
W99EE:
      .byte $00, $3C, $18, $00, $38, $81, $00, $3C 
      .byte $00, $80, $E0, $3E, $03, $80, $C0, $0F 
      .byte $80, $FC, $00, $07, $80, $FC, $81, $00 
      .byte $80, $FF, $80, $9C, $81, $00, $60, $07 
      .byte $03, $80, $BC, $A2, $00, $1F, $80, $E0 
      .byte $00, $30, $80, $FC, $00, $38
W9A1C:
      .byte $1C
W9A1D:
      .byte $07, $00, $1C, $00, $80, $E0, $80, $FC 
      .byte $07, $0F, $80, $F0, $00, $1F, $80, $E0 
      .byte $00, $80, $FF, $00, $0F, $06, $00, $1E 
      .byte $39, $80, $C0, $9F, $00, $1F, $80, $C0 
      .byte $00, $60, $80, $F0, $00, $18
W9A43:
      .byte $3C, $81, $00, $1C, $07, $00, $3C, $03 
      .byte $80, $C0, $7C, $00, $3F, $80, $F0, $00 
      .byte $3F, $80, $E0, $39, $80, $FF, $00, $06 
      .byte $81, $00, $3D, $80, $C0, $80, $E0, $9E 
      .byte $00, $01, $45, $81, $00, $54, $81, $00 
      .byte $10, $81, $00               
W9A6E:
      .byte $54
W9A6F:
      .byte $00, $01, $65, $00, $05, $65, $40, $05 
      .byte $80, $A9, $40, $15, $80     
W9A7C:
      .byte $95
W9A7D:
      .byte $50, $15, $80, $A9, $50, $15, $59, $50 
      .byte $15, $80, $A9, $50, $15, $65, $50, $05 
      .byte $65, $40, $01, $55, $96, $00, $01, $45 
      .byte $81, $00, $54, $81, $00     
W9A9A:
      .byte $10
W9A9B:
      .byte $81, $00, $54, $00          
W9A9F:
      .byte $01, $55, $00, $05, $55, $40, $05, $55 
      .byte $40, $15, $55, $50, $15, $55, $50, $15 
      .byte $55, $50, $15, $55, $50, $15, $55, $50 
      .byte $05, $55, $40, $01, $55     
W9ABC:
      .byte $97
W9ABD:
      .byte $00, $30, $83, $00          
W9AC1:
      .byte $03, $33, $84, $00, $80, $CC
W9AC7:
      .byte $8A, $00, $80, $AA, $80, $A0, $02, $80 
      .byte $AA, $80, $A0, $0A, $80, $AA, $80, $A0 
      .byte $2A, $80, $AA, $80, $A0, $2A, $80, $AA 
      .byte $80, $80, $2A, $80, $AA, $00, $2A, $80 
      .byte $A8, $94, $00, $30, $83, $00, $0C, $30 
      .byte $80, $C0, $82, $00, $03, $33, $84, $00 
      .byte $30, $84, $00, $80, $AA, $80, $A0, $02 
      .byte $80, $AA, $80, $A0, $0A, $80, $AA, $80 
      .byte $A0, $2A, $80, $AA, $80, $A0, $2A, $80 
      .byte $AA, $80, $80, $2A, $80, $AA, $00, $2A 
      .byte $80, $A8, $99, $00, $03, $80, $FF, $00 
      .byte $0B, $80, $FF, $80, $80, $02, $80, $FE 
      .byte $81, $00, $80, $A8, $00, $81, $02, $00 
      .byte $08, $00, $80, $80, $08, $00, $80, $80 
      .byte $08, $00, $80, $80, $81, $02, $81, $00 
      .byte $80, $A8, $81, $00, $20, $98, $00, $FF 
      .byte $87, $00, $87, $55, $87, $AA, $87, $FF 
      .byte $55, $80, $AA, $55, $2A, $51, $80, $AA 
      .byte $45, $80, $82, $55, $80, $AA, $51, $80 
      .byte $8A, $55, $80, $A2, $50, $00, $55, $80 
      .byte $AA, $54, $80, $AA, $51, $80, $82, $81 
      .byte $00, $55, $80, $A2, $51, $2A, $41, $80 
      .byte $80, $81, $00, $55, $80, $A2, $55, $80 
      .byte $A2, $40, $82, $00, $55, $80, $A2, $55 
      .byte $08, $83, $00, $54, $80, $AA, $14, $84 
      .byte $00, $45, $80, $8A, $85, $00, $55, $80 
      .byte $A8, $55, $80, $8A, $41, $80, $A8, $55 
      .byte $80, $AA, $55, $2A, $55, $80, $A2, $45 
      .byte $0A, $55, $80, $8A, $45, $80, $A8, $55 
      .byte $80, $8A, $45, $28, $55, $80, $8A, $55 
      .byte $80, $AA, $55, $80, $82, $10, $28, $55 
      .byte $80, $AA, $80, $A0, $8D, $AA, $80, $A0 
      .byte $00, $80, $A0, $8B, $AA, $80, $A0, $82 
      .byte $00, $8B, $AA, $84, $00, $89, $AA, $86 
      .byte $00, $87, $AA, $83, $00, $81, $15, $81 
      .byte $00, $81, $15, $81, $00, $81, $54, $81 
      .byte $00, $81, $54, $81, $00, $81, $BA, $80 
      .byte $FF, $82, $AE, $80, $FF, $80, $BA, $88 
      .byte $55, $80, $AA, $55, $80, $AA
W9BFD:
      .byte $55
W9BFE:
      .byte $80, $AA, $55, $81, $AA, $55, $80, $AA 
      .byte $55, $80, $AA, $55, $80, $AA, $55, $84 
      .byte $AA, $85, $00, $89, $AA, $85, $2A, $89 
      .byte $AA, $85, $A8, $84, $AA, $87, $3F, $87 
      .byte $FC, $84, $00, $85, $AA, $85, $00, $0A 
      .byte $8B, $AA, $0A, $00, $0A, $8D, $AA, $0A 
      .byte $85, $FE, $81, $FF, $01, $86, $00, $80 
      .byte $C0, $80, $E0, $40, $84, $00, $81, $3F 
      .byte $7F, $84, $FF, $80, $FC, $81, $FE, $84 
      .byte $FF, $01, $86, $00, $82, $FF, $7F, $3E 
      .byte $18, $81, $00, $80, $E0, $80, $80, $85 
      .byte $00, $0F, $1F, $3F, $82, $7F, $81, $FF 
      .byte $81, $FE, $85, $FF, $97, $00, $85, $7F 
      .byte $81, $FF, $80, $AA, $55, $80, $AA, $55 
      .byte $80, $AA, $55, $80, $AA, $55, $80, $AB 
      .byte $5F, $80, $AC, $5C, $80, $BF, $70, $80 
      .byte $E0, $80, $C0, $81, $E0, $60, $63, $83 
      .byte $E3, $80, $FF, $81, $00, $80, $FC, $82 
      .byte $C0, $80, $FC, $80, $FF, $81, $E0, $84 
      .byte $E3, $80, $FC, $81, $0C, $81, $8C, $81 
      .byte $8F, $80, $8E, $0F, $18, $30, $63, $80 
      .byte $C3, $80, $83, $81, $03, $80, $FF, $81 
      .byte $00, $80, $9F, $80, $98, $80, $9F, $80 
      .byte $80, $80, $9F, $80, $FF, $81, $00, $80 
      .byte $E7, $07, $80, $E7, $67, $80, $E7, $82 
      .byte $00, $3F, $82, $33, $3F, $82, $00, $38 
      .byte $3C, $36, $33, $31, $82, $00, $84, $C0 
      .byte $80, $FC, $82, $30          
W9CDA:
      .byte $83
W9CDB:
      .byte $00, $80, $FF, $82, $DB, $83, $00, $FF 
      .byte $FF, $C2, $E0, $F0, $F8, $F8, $F8, $FC 
      .byte $1F, $3A, $10, $00          
W9CEF:
      .byte $07, $03, $07, $03, $FF, $E3, $71, $E0 
      .byte $F1, $F8, $F0, $E0, $FD, $E8, $C1, $E1 
      .byte $07, $0F, $1F, $3F, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $FF, $F8, $FC, $FE, $FC 
      .byte $FE, $FE, $FF, $FF, $66, $44, $00, $00 
      .byte $00, $00, $00, $00, $E3, $11, $00, $00 
      .byte $00, $00, $00, $00, $FF, $1F, $7F, $7F 
      .byte $7F, $7F, $7F, $FF, $FF, $FF, $FF, $FF 
W9D2F:
      .byte $FF, $FF, $FF, $FF, $E3, $F0, $F0, $F8 
      .byte $98, $CC, $E0, $F0, $E7, $F3, $78, $30 
      .byte $01                         
W9D40:
      .byte $03
W9D41:
      .byte $03
W9D42:
      .byte $01
W9D43:
      .byte $FF, $1F, $7F, $FF          
W9D47:
      .byte $FF
W9D48:
      .byte $FF, $FF, $FF, $FE, $E4, $F0, $F9, $F8 
      .byte $F8, $F0, $F0, $78, $F1, $C3, $83, $07 
      .byte $0C, $00, $01, $F1, $F8, $FC, $FC, $FC 
      .byte $FC, $FE, $FE, $CF, $67, $03, $00, $00 
      .byte $00, $00, $00, $FF, $3C, $98, $00, $00 
      .byte $00, $00, $00, $3C, $70, $60, $00, $00 
      .byte $00, $00, $00, $07, $0F, $1F, $1F, $3F 
      .byte $3F, $3F, $3F               
W9D83:
      .byte $E3
W9D84:
      .byte $9C, $0B, $9D, $33, $9D     
W9D89:
      .byte $5B, $9D                    
W9D8B:
      .byte $2E, $2F, $30, $31, $03, $03, $00, $00 
      .byte $03, $03, $32, $33, $34, $35, $36, $37 
      .byte $38                         
W9D9C:
      .byte $39, $3A, $3B               
W9D9F:
      .byte $00
W9DA0:
      .byte $20, $50, $20, $A0, $20, $F0, $20 
W9DA7:
      .byte $C0
W9DA8:
      .byte $50, $C1, $50, $C2, $50, $00, $51, $01 
      .byte $51, $02, $51, $E5, $50, $E6, $50, $25 
      .byte $51, $26                    
W9DBA:
      .byte $51
W9DBB:
      .byte $0E, $01, $00, $00, $00, $00, $00, $00 
      .byte $0E, $01, $E6, $00          
W9DC7:
      .byte $00, $00, $00, $00, $0E, $01, $56, $01 
      .byte $00, $00, $00, $00, $0E, $01, $56, $01 
      .byte $36, $00, $00, $00          
W9DDB:
      .byte $1E, $01                    
W9DDD:
      .byte $00, $00, $00, $00, $00, $00, $1E, $01 
      .byte $36, $00, $00, $00, $00, $00, $1E, $01 
      .byte $00, $00, $00, $00, $00, $00, $1E, $01 
      .byte $00, $00, $00, $00          
W9DF9:
      .byte $01, $02, $02, $03, $01, $02, $01, $01 
W9E01:
      .byte $80, $40, $20, $10, $08, $04, $02 
W9E08:
      .byte $01
W9E09:
      .byte $32, $32, $32, $32, $32, $32, $34, $36 
W9E11:
      .byte $09, $09, $09, $09, $09, $09, $02 
W9E18:
      .byte $0B
W9E19:
      .byte $3E, $40, $40, $42          
W9E1D:
      .byte $01, $0B, $09, $02, $AF, $02, $11, $13 
      .byte $2B, $2D, $8F, $02, $10, $12, $2A, $2C 
      .byte $8D, $02, $11, $13, $15, $81, $17, $15 
      .byte $2B, $2D, $8B, $02, $10, $12, $14, $81 
W9E3D:
      .byte $16, $14, $2A, $2C, $8A, $02, $11, $13 
      .byte $15, $83, $17, $15, $2B, $2D, $89, $02 
W9E4D:
      .byte $10, $12, $14, $83, $16, $14, $2A, $2C 
      .byte $87, $02, $11, $13          
W9E59:
      .byte $15, $82, $17, $81, $19, $82, $17 
W9E60:
      .byte $15
W9E61:
      .byte $2B, $2D, $85, $02, $10, $12, $14, $82 
      .byte $16, $81, $18, $82, $16, $14, $2A, $2C 
      .byte $84, $02, $11, $13, $15, $82
W9E77:
      .byte $17
W9E78:
      .byte $83
W9E79:
      .byte $19, $82, $17, $15, $2B, $2D, $83, $02 
      .byte $10, $12                    
W9E83:
      .byte $14, $82, $16, $83, $18, $82, $16, $14 
      .byte $2A, $2C, $81, $02, $11, $13, $15, $82 
      .byte $17, $82                    
W9E95:
      .byte $19, $81, $29, $82, $19, $82, $17, $15 
      .byte $2B, $2D, $10, $12, $14, $82, $16, $82 
      .byte $18, $81, $28, $82, $18, $82, $16 
W9EAC:
      .byte $14
W9EAD:
      .byte $2A
W9EAE:
      .byte $2C, $FF                    
W9EB0:
      .byte $00
W9EB1:
      .byte $10, $28, $10, $50, $10, $78, $10, $A0 
      .byte $10, $C8, $10, $F0          
W9EBD:
      .byte $10
W9EBE:
      .byte $00
W9EBF:
      .byte $08, $01, $08, $02, $08, $C0, $08, $C1 
      .byte $08                         
W9EC8:
      .byte $C2
W9EC9:
      .byte $08, $80, $09, $81, $09, $82, $09, $40 
      .byte $0A, $41, $0A, $42, $0A     
W9ED6:
      .byte $20, $22, $24, $26, $28     
W9EDB:
      .byte $01, $01, $01, $01, $01, $01, $01, $00 
      .byte $01, $00, $00, $01, $00, $00, $00, $01 
      .byte $00, $00, $00, $00, $FF, $00, $00, $00 
      .byte $FF, $00, $00, $FF, $00, $FF, $FF, $FF 
      .byte $FF, $FF, $FF, $FF          
W9EFF:
      .byte $D6
W9F00:
      .byte $92, $9D, $93, $68          
W9F04:
      .byte $94
W9F05:
      .byte $97, $94, $24               
W9F08:
      .byte $95
W9F09:
      .byte $A2, $92, $8A, $7A, $72     
W9F0E:
      .byte $5F
W9F0F:
      .byte $BA, $CA                    
W9F11:
      .byte $D2, $E2, $EA, $FA, $32, $1E, $0D, $20 
      .byte $32, $00, $1B, $04, $32, $00, $16, $30 
      .byte $32, $00, $1B, $05, $32, $00, $16, $05 
      .byte $32, $00, $1B, $05, $32, $00
W9F2F:
      .byte $16, $18, $FF, $00, $00, $09, $20, $00 
      .byte $00, $0A, $07, $96, $96, $0A, $10, $00 
W9F3F:
      .byte $00, $09, $10, $96, $96, $0C, $04, $00 
      .byte $00, $0C, $04, $96, $96, $0C, $04, $00 
      .byte $00, $0C, $04, $96, $96, $0C, $04, $00 
      .byte $00, $0C, $04, $96, $96, $0C, $04, $00 
      .byte $00, $0C, $04, $96, $96, $0C, $04, $00 
      .byte $00, $0C, $04, $96, $96, $0C, $04, $FF 
      .byte $C3, $F0, $10, $07, $1F, $80, $15, $07 
      .byte $1E, $80, $19               
W9F7A:
      .byte $07, $87, $F0, $21, $0C, $31, $B0, $1C 
      .byte $07, $87                    
W9F84:
      .byte $F0, $21                    
W9F86:
      .byte $10
W9F87:
      .byte $FF, $00, $1F, $0B, $05, $00, $1F, $11 
      .byte $04, $00, $1F, $0E, $04, $00, $1F, $11 
      .byte $03, $00, $1F, $0E, $03, $00
W9F9D:
      .byte $1F, $11                    
W9F9F:
      .byte $02, $00, $1F, $0E, $02, $00
W9FA5:
      .byte $1F, $11                    
W9FA7:
      .byte $01, $00, $1F, $0E, $01     
W9FAC:
      .byte $FF
W9FAD:
      .byte $11
W9FAE:
      .byte $9F, $2E, $9F, $6B, $9F, $84, $9F 
W9FB5:
      .byte $08, $18, $05, $0B, $09, $09, $02, $02 
      .byte $07, $07, $05, $05, $06, $06, $42, $59 
      .byte $3A, $20, $50, $65, $74, $65, $72, $20 
      .byte $46, $69, $6C, $69, $62, $65, $72, $74 
      .byte $69, $20, $34, $2F, $31, $2F, $38, $34 
      .byte $41, $70, $70, $6C, $69, $65, $64, $20 
      .byte $43, $6F, $6D, $70, $75, $74, $65, $72 
      .byte $20, $54, $65, $63, $68, $6E, $6F, $6C 
      .byte $6F, $67, $79, $2E, $FF, $FF, $FF, $FF 
      .byte $FF, $FF, $FF              
