;               COAL PROJECT - GRAND PRIX CIRCUIT GAME IMPLEMENTATION
; MEMBERS:  SYED MUHAMMAD ANAS NAUMAN    21L-5230 
;           SAAD ASIF                    21L-7532  
; SECTION:  3-B
[org 0x0100]
jmp start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscrn:
       push es
       push ax
       push cx
       push di

       mov ax,0xb800
       mov es,ax 
       xor di,di        ; load di to point to top left of screen
       mov ax,0x0edb    ; load space character on black background
       mov cx,1360      ; number of columns to color

       cld              ; auto increment method 
       rep stosw        ; repeat until  cx turns zero

       pop di
       pop cx
       pop ax
       pop es

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay:
     push cx

     mov  cx,0xffff             ; load cx with highest count
loop1: loop loop1               ; loop instruction until cx is zero
 
     mov  cx,0xffff             ; load cx with highest count
loop2: loop loop2               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop3: loop loop3               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop4: loop loop4               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop5: loop loop5               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop6: loop loop6               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop7: loop loop7               ; loop instruction until cx is zero

     mov  cx,0xffff             ; load cx with highest count
loop8: loop loop8               ; loop instruction until cx is zero
  

     pop  cx

     ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntmap:
       push es
       push ax
       push cx
       push di
       push bx

      mov ax,0xb800   
      mov es,ax
 
      cld                ; auto increment method

      xor bx,bx          ; set dx to 0
      mov di,160         ; move di to location
      mov ax,0x00db      ; black attribute character
 
loopblck:  
      mov cx,12          ; number of columns to color
      rep stosw          ; color desired number of columns
      add di,136         ; update di accordingly  
      inc bx             ; increment bx
      cmp bx,5           ; check if all rows colored
      jne loopblck       ; keep coloring if false


       mov di,164        ; move di to to location
       mov ax,0x0fcd     ; white attribute character
       mov cx,8          ; number of columns to color
       rep stosw         ; color desired number of columns
 
       xor bx,bx         ; set dx to 0
       mov di,322        ; move di to location
       mov ax,0x0fba     ; white attribute character

loopmapline1:
         mov cx,1         ; number of columns to color
         rep stosw        ; color desired columns
         add di,158       ; update di accordingly
         inc bx           ; increment bx
         cmp bx,3         ; check if all rows colored
         jne loopmapline1 ; keep coloring if false

       mov di,804         ; move di to location
       mov ax,0x0fcd      ; white attribute character
       mov cx,8           ; number of columns to color
       rep stosw          ; color desired columns

       xor bx,bx         ; set dx to 0
       mov di,340        ; move di to location
       mov ax,0x0fba     ; white attribute character

loopmapline2:
         mov cx,1         ; number of columns to color
         rep stosw        ; color desired columns
         add di,158       ; update di accordingly
         inc bx           ; increment bx
         cmp bx,3         ; check if all rows colored
         jne loopmapline2 ; keep coloring if false

    mov di,162            ; move di to location
    mov ax,0x0fc9         ; white attribute character
    mov [es:di],ax        ; print attribute on screen
    mov ax,0x0fbb         ; white attribute character
    mov [es:di+18],ax     ; print attribute on screen
    mov ax,0x0fc8         ; white attribute character
    mov [es:di+640],ax    ; print attribute on screen
    mov ax,0x0fbc         ; white attribute character
    mov [es:di+658],ax    ; print attribute on screen

    mov word[es:176],0x0fcb    ; print attribute on screen
    mov word[es:336],0x0fba    ; print attribute on screen
    mov word[es:496],0x0fba    ; print attribute on screen
    mov word[es:656],0x0fba    ; print attribute on screen
    mov word[es:816],0x0fca    ; print attribute on screen

    mov word[es:642],0x02db ; print starting point of race

       pop bx
       pop di
       pop cx
       pop ax
       pop es

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SaveMapR1: dw 0,0,0,0,0,0,0,0,0,0,0,0
SaveMapR2: dw 0,0,0,0,0,0,0,0,0,0,0,0
SaveMapR3: dw 0,0,0,0,0,0,0,0,0,0,0,0
SaveMapR4: dw 0,0,0,0,0,0,0,0,0,0,0,0
SaveMapR5: dw 0,0,0,0,0,0,0,0,0,0,0,0
savemap:
       push bp
       mov  bp,sp
       push es
       push ax
       push bx
       push cx
       push dx
       push di
       push si
       push ds

       mov ax,0xb800
       mov es,ax

       cld
     
     xor bx,bx
     mov di,160

loopSaveR1:
     mov ax,[es:di+bx]
     mov [cs:SaveMapR1+bx],ax
     add bx,2
     cmp bx,24
     jne loopSaveR1

     xor bx,bx
     add di,160

loopSaveR2:
     mov ax,[es:di+bx]
     mov [cs:SaveMapR2+bx],ax
     add bx,2
     cmp bx,24
     jne loopSaveR2

     xor bx,bx
     add di,160

loopSaveR3:
     mov ax,[es:di+bx]
     mov [cs:SaveMapR3+bx],ax
     add bx,2
     cmp bx,24
     jne loopSaveR3

     xor bx,bx
     add di,160

loopSaveR4:
     mov ax,[es:di+bx]
     mov [cs:SaveMapR4+bx],ax
     add bx,2
     cmp bx,24
     jne loopSaveR4

     xor bx,bx
     add di,160

loopSaveR5:
     mov ax,[es:di+bx]
     mov [cs:SaveMapR5+bx],ax
     add bx,2
     cmp bx,24
     jne loopSaveR5

    pop ds
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp

    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntsavedmap:
       push bp
       mov  bp,sp
       push es
       push ax
       push bx
       push cx
       push dx
       push di
       push si
       push ds

       mov ax,0xb800
       mov es,ax

       cld

     xor bx,bx
     mov di,2500

loopprntSaveR1:
     mov ax,[cs:SaveMapR1+bx]
     mov [es:di+bx],ax
     add bx,2
     cmp bx,24
     jne loopprntSaveR1

     xor bx,bx
     add di,160

loopprntSaveR2:
     mov ax,[cs:SaveMapR2+bx]
     mov [es:di+bx],ax
     add bx,2
     cmp bx,24
     jne loopprntSaveR2

     xor bx,bx
     add di,160

loopprntSaveR3:
     mov ax,[cs:SaveMapR3+bx]
     mov [es:di+bx],ax
     add bx,2
     cmp bx,24
     jne loopprntSaveR3

     xor bx,bx
     add di,160

loopprntSaveR4:
     mov ax,[cs:SaveMapR4+bx]
     mov [es:di+bx],ax
     add bx,2
     cmp bx,24
     jne loopprntSaveR4

     xor bx,bx
     add di,160

loopprntSaveR5:
     mov ax,[cs:SaveMapR5+bx]
     mov [es:di+bx],ax
     add bx,2
     cmp bx,24
     jne loopprntSaveR5

    pop ds
    pop si
    pop di
    pop dx
    pop cx
    pop bx
    pop ax
    pop es
    pop bp

    ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
call clrscrn
call prntmap
call savemap
call prntsavedmap
call delay 
call delay 
call delay 
call delay 
call delay 

mov ax, 0x4c00
int 0x21