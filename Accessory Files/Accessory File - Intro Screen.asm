;               COAL PROJECT - GRAND PRIX CIRCUIT GAME IMPLEMENTATION
; MEMBERS:  SYED MUHAMMAD ANAS NAUMAN    21L-5230 
;           SAAD ASIF                    21L-7532  
; SECTION:  3-B
[org 0x0100]
mov [cs:DataSegment],ds
jmp start
DataSegment: dw 0
EnterToStart: db 'Press Enter Key To Start!',0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscrn:
       push es
       push ax
       push cx
       push di

       mov ax,0xb800
       mov es,ax 
       xor di,di        ; load di to point to top left of screen
       mov ax,0x0720    ; load space character on black background
       mov cx,2000      ; number of columns to color

       cld              ; auto increment method 
       rep stosw        ; repeat until  cx turns zero

       pop di
       pop cx
       pop ax
       pop es

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntstr:
       push bp
       mov  bp,sp
       push es
       push ax
       push cx
       push si
       push di
  
       mov es,[cs:DataSegment]

       mov   di,[bp+4]
       mov   cx,0xffff 
       xor   al,al 
       repne scasb
       mov   ax,0xffff
       sub   ax,cx
       dec   ax 
       
       mov cx,ax
       mov ax,0xb800   
       mov es,ax
       mov al,80 
       mul byte[bp+8]  
       add ax,[bp+10] 
       shl ax,1      
       mov di,ax
       mov si,[bp+4]   
       mov ah,[bp+6]

       cld

nxtcharaa:
       lodsb
       stosw
       loop nxtcharaa
   
      pop di
      pop si
      pop cx
      pop ax
      pop es
      pop bp

      ret 8 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
intro:
       push bp
       mov  bp,sp
       sub  sp,2                 ; create space for local variable
       push es
       push ax
       push bx
       push cx
       push dx
       push di
       push si

      mov ax,0xb800
      mov es,ax

      cld                ; auto increment method

       xor di,di           ; load di to point to top left of screen
       mov ax,0x08db       ; load space character on black background
       mov cx,2000         ; number of columns to color
       rep stosw           ; repeat until  cx turns zero

        mov bx,0
        mov di, 0          ; point di to location 
        mov cx,4           ; number of columns to color

ler:
    add bx,1
    mov ax,0x04db          ; magenta background on black foreground
    rep stosw              ; color desired number of columns
    mov cx,4
    add di,312
    cmp bx,13
    jne ler

        mov bx,0
        mov di, 160       ; point di to location 
        mov cx,4          ; number of columns to color

lew:
      add bx,1
      mov ax,0x0fdb      ; magenta background on black foreground
      rep stosw          ; color desired number of columns
      mov cx,4
      add di,312
      cmp bx,12
      jne lew

        mov bx,0
        mov di, 152      ; point di to location 
        mov cx,4         ; number of columns to color

rer:
     add bx,1
     mov ax,0x04db      ; magenta background on black foreground
     rep stosw          ; color desired number of columns
     mov cx,4
     add di,312
     cmp bx,13
     jne rer

        mov bx,0
        mov di, 312      ; point di to location 
        mov cx,4         ; number of columns to color

rew:
    add bx,1
    mov ax,0x0fdb        ; magenta background on black foreground
    rep stosw            ; color desired number of columns
    mov cx,4
    add di,312
    cmp bx,12
    jne rew      

     mov bx,0
     mov di, 1328       ; point di to location 
     mov cx,2           ; number of columns to color

rs1:
     add bx,1
     mov ax,0x0fdb      ; magenta background on black foreground
     rep stosw          ; color desired number of columns
     mov cx,2
     add di,636
     cmp bx,5
     jne rs1

      mov bx,0
      mov di, 1648      ; point di to location 
      mov cx,2          ; number of columns to color

rs1w:
    add bx,1
    mov ax,0x0edb       ; magenta background on black foreground
    rep stosw           ; color desired number of columns
    mov cx,2
    add di,636
    cmp bx,4
    jne rs1w

       mov bx,0
       mov di, 1384     ; point di to location 
       mov cx,2         ; number of columns to color

rs2:
     add bx,1
     mov ax,0x0fdb      ; magenta background on black foreground
     rep stosw          ; color desired number of columns
     mov cx,2
     add di,636
     cmp bx,5
     jne rs2

     mov bx,0
     mov di, 1704      ; point di to location 
     mov cx,2          ; number of columns to color

rs2w:
     add bx,1
     mov ax,0x0edb     ; magenta background on black foreground
     rep stosw         ; color desired number of columns
     mov cx,2
     add di,636
     cmp bx,4
     jne rs2w

       mov di,1510      ; load di to point to top left of screen
       mov ax,0x10cd    ; load space character on black background
       mov cx,8         ; number of columns to color
       rep stosw        ; repeat until  cx turns zero

  mov di, 1676          ; point di to location 
  mov ax,0x10ba         ; magenta background on black foreground
  mov[es:di],ax
  mov [es:di+2],ax
  mov[es:di+160],ax
  mov [es:di+162],ax
 
 mov ax,0x01db  
 mov[es:di+320],ax
 mov [es:di+322],ax

 mov ax,0x11de
 mov [es:di+318],ax

 mov ax,0x11de
 mov[es:di+324],ax

    mov di,2150          ; point di to location 
    mov cx,8             ; number of columns to color
    mov bx,0

cl11:
       add bx,1
       mov ax,0x01db     ; magenta background on black foreground
       rep stosw         ; color desired number of columns
       add cx,8
       add di,784
       cmp bx,2
       jne cl11

    mov di,2308          ; point di to location 
    mov cx,10            ; number of columns to color
    mov bx,0

cl1:
       add bx,1
       mov ax,0x01db     ; magenta background on black foreground
       rep stosw         ; color desired number of columns
       add cx,10
       add di,140
       cmp bx,4
       jne cl1

  mov ax,0x0bdb
  mov di,2316
  mov[es:di],ax
  mov[es:di+2],ax

    mov ax,0x01db
    mov di,3112         ; point di to location 
    mov cx,6            ; number of columns to color
    mov bx,0
    mov ax,0x01cd       ; magenta background on black foreground

cl111:
       add bx,1
       rep stosw         ; color desired number of columns
       add cx,8
       add di,146
       mov ax,0x10f0     ; magenta background on black foreground
       cmp bx,2
       jne cl111

    mov di,3106
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax
    mov [es:di+24],ax
    mov [es:di+160],ax
    mov [es:di+158],ax
    mov [es:di+182],ax
    mov [es:di+184],ax

    mov di,1826
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax 
    mov [es:di+24],ax   
    mov [es:di+160],ax
    mov [es:di+158],ax 
    mov [es:di+182],ax
    mov [es:di+184],ax

  mov ax,0x08dc
  mov [es:di+162],ax
  mov [es:di+164],ax
  mov [es:di+166],ax
  mov [es:di+176],ax
  mov [es:di+178],ax
  mov [es:di+180],ax

  mov di,3268
  mov [es:di],ax
  mov [es:di+18],ax

     mov di,1780        ; load di to point to top left of screen
     mov ax,0x40cd      ; load space character on black background
     mov cx,8           ; number of columns to color
     rep stosw          ; repeat until  cx turns zero

    mov di, 1946        ; point di to location 
    mov ax,0x40ba       ; magenta background on black foreground
    mov[es:di],ax
    mov [es:di+2],ax
    mov[es:di+160],ax
    mov [es:di+162],ax

    mov ax,0x04db  
    mov[es:di+320],ax
    mov [es:di+322],ax

    mov ax,0x44de
    mov [es:di+318],ax

  mov ax,0x44de
  mov[es:di+324],ax

     mov di,2420        ; point di to location 
     mov cx,8           ; number of columns to color
     mov bx,0

c211:
       add bx,1
       mov ax,0x04db     ; magenta background on black foreground
       rep stosw         ; color desired number of columns
       add cx,8
       add di,784
       cmp bx,2
       jne c211

      mov di,2578        ; point di to location 
      mov cx,10          ; number of columns to color
      mov bx,0

c2l1:
       add bx,1
       mov ax,0x04db     ; magenta background on black foreground
       rep stosw         ; color desired number of columns
       add cx,10
       add di,140
       cmp bx,4
       jne c2l1

  mov ax,0x0bdb
  mov di,2586
  mov[es:di],ax
  mov[es:di+2],ax

   mov di,3382           ; point di to location 
   mov cx,6              ; number of columns to color
   mov bx,0
   mov ax,0x04cd         ; magenta background on black foreground

c2111:
       add bx,1
       rep stosw         ; color desired number of columns
       add cx,8
       add di,146
       mov ax,0x40f0     ; magenta background on black foreground
       cmp bx,2
       jne c2111

    mov di,3376
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax 
    mov [es:di+24],ax   
    mov [es:di+160],ax
    mov [es:di+158],ax 
    mov [es:di+182],ax
    mov [es:di+184],ax

    mov di,2096
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax
    mov [es:di+24],ax
    mov [es:di+160],ax
    mov [es:di+158],ax
    mov [es:di+182],ax
    mov [es:di+184],ax

    mov ax,0x08dc
    mov [es:di+162],ax
    mov [es:di+164],ax
    mov [es:di+166],ax
    mov [es:di+176],ax
    mov [es:di+178],ax
    mov [es:di+180],ax

    mov di,3538
    mov [es:di],ax
    mov [es:di+18],ax

   mov di,2042           ; load di to point to top left of screen
   mov ax,0x20cd         ; load space character on black background
   mov cx,8              ; number of columns to color
   rep stosw             ; repeat until  cx turns zero

   mov di, 2208          ; point di to location 
   mov ax,0x20ba         ; magenta background on black foreground
   mov[es:di],ax
   mov [es:di+2],ax
   mov[es:di+160],ax
   mov [es:di+162],ax

   mov ax,0x02db
   mov[es:di+320],ax
   mov [es:di+322],ax

   mov ax,0x22de
   mov [es:di+318],ax

   mov ax,0x22de
   mov[es:di+324],ax

     mov di,2682          ; point di to location 
     mov cx,8             ; number of columns to color
     mov bx,0

c311:   
       add bx,1
       mov ax,0x02db      ; magenta background on black foreground
       rep stosw          ; color desired number of columns
       add cx,8
       add di,784
       cmp bx,2
       jne c311

     mov di,2840          ; point di to location 
     mov cx,10            ; number of columns to color
     mov bx,0

c33l1:    
       add bx,1
       mov ax,0x02db      ; magenta background on black foreground
       rep stosw          ; color desired number of columns
       add cx,10
       add di,140
       cmp bx,4
       jne c33l1

  mov ax,0x0bdb
  mov di,2848
  mov[es:di],ax
  mov[es:di+2],ax

    mov di,3644           ; point di to location 
    mov cx,6              ; number of columns to color
    mov bx,0              ; intialize bx to 0
    mov ax,0x02cd         ; magenta background on black foreground

c3111:    
       add bx,1
       rep stosw          ; color desired number of columns
       add cx,8
       add di,146
       mov ax,0x20f0      ; magenta background on black foreground
       cmp bx,2
       jne c3111

    mov di,3638
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax 
    mov [es:di+24],ax   
    mov [es:di+160],ax
    mov [es:di+158],ax 
    mov [es:di+182],ax
    mov [es:di+184],ax

    mov di,2358
    mov ax,0x00db
    mov [es:di],ax
    mov [es:di-2],ax
    mov [es:di+22],ax 
    mov [es:di+24],ax   
    mov [es:di+160],ax
    mov [es:di+158],ax 
    mov [es:di+182],ax
    mov [es:di+184],ax

  mov ax,0x08dc
  mov [es:di+162],ax
  mov [es:di+164],ax
  mov [es:di+166],ax
  mov [es:di+176],ax
  mov [es:di+178],ax
  mov [es:di+180],ax

   mov di,3800
   mov [es:di],ax
   mov [es:di+18],ax

call prntname

    mov  ax,27                ; load x position
    push ax                   ; push x position
    mov  ax,24                ; load y position
    push ax                   ; push y position
    mov  ax,0x008f            ; white on black attribute
    push ax                   ; push attribute
    mov  ax,EnterToStart      ; load string address
    push ax                   ; push string address
    call prntstr              ; FUNCTION CALL:  PRINTING STRING

loopEntKey2:
    mov ah,0
    int 0x16
    cmp al,0x0D               ; ASCII of enter Key (NOT Scan Code)
    jne loopEntKey2

    call clrscrn

       pop si
       pop di
       pop dx
       pop cx
       pop bx
       pop ax
       pop es
       add sp,2
       pop bp

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;

prntname:
       push bp
       mov  bp,sp
       sub  sp,2                 ; create space for local variable
       push es
       push ax
       push bx
       push cx
       push dx
       push di
       push si

       mov ax,0xb800
       mov es,ax

       cld              ; auto increment method 

       mov ax,0x04b1
       mov di,172
       mov cx,6
       rep stosw
       mov di,172
       mov [es:di+160],ax
       mov [es:di+162],ax
       mov [es:di+320],ax
       mov [es:di+322],ax
       mov [es:di+480],ax
       mov [es:di+482],ax
       mov [es:di+640],ax
       mov [es:di+642],ax
       add di,640
       mov cx,6
       rep stosw
       sub di,4
       mov [es:di-160],ax
       mov [es:di-158],ax
       mov [es:di-320],ax
       mov [es:di-318],ax
       mov [es:di-322],ax

    mov ax,0x01b0
    mov di,188
    mov cx,6
    rep stosw
    mov di,188
    mov [es:di+160],ax
    mov [es:di+162],ax
    mov [es:di+320],ax
    mov [es:di+322],ax
    mov [es:di+480],ax
    mov [es:di+482],ax
    mov [es:di+640],ax
    mov [es:di+642],ax
    add di,320
    mov cx,6
    rep stosw
    mov [es:di-164],ax
    mov [es:di-162],ax
    sub di,6
    mov [es:di+160],ax
    mov [es:di+162],ax
    mov [es:di+320],ax
    mov [es:di+322],ax
    mov [es:di+324],ax

       mov ax,0x04b1
       mov di,204
       mov cx,6
       rep stosw
       mov [es:di+156],ax
       mov [es:di+158],ax
       mov [es:di+316],ax
       mov [es:di+318],ax
       mov [es:di+476],ax
       mov [es:di+478],ax
       mov [es:di+636],ax
       mov [es:di+638],ax
       sub di,12
       mov [es:di+160],ax
       mov [es:di+162],ax
       mov [es:di+320],ax
       mov [es:di+322],ax
       mov [es:di+480],ax
       mov [es:di+482],ax
       mov [es:di+640],ax
       mov [es:di+642],ax
       add di,320
       mov cx,4
       rep stosw

    mov ax,0x01b0
    mov di,220
    mov cx,2
    rep stosw
    mov di,220
    mov [es:di+160],ax
    mov [es:di+162],ax
    mov [es:di+320],ax
    mov [es:di+322],ax
    mov [es:di+480],ax
    mov [es:di+482],ax
    mov [es:di+640],ax
    mov [es:di+642],ax
    mov di,230
    mov cx,2
    rep stosw
    mov di,230
    mov [es:di+160],ax
    mov [es:di+162],ax
    mov [es:di+320],ax
    mov [es:di+322],ax
    mov [es:di+480],ax
    mov [es:di+482],ax
    mov [es:di+640],ax
    mov [es:di+642],ax
    mov di,220
    mov [es:di+164],ax
    mov [es:di+326],ax
    mov [es:di+488],ax

      mov ax,0x04b1
      mov di,238
      mov cx,5
      rep stosw
      mov di,238
      mov [es:di+160],ax
      mov [es:di+162],ax
      mov [es:di+320],ax
      mov [es:di+322],ax
      mov [es:di+480],ax
      mov [es:di+482],ax
      mov [es:di+640],ax
      mov [es:di+642],ax
      add di,640
      mov cx,5
      rep stosw
      mov [es:di-162],ax
      mov [es:di-322],ax
      mov [es:di-482],ax

     mov ax,0x0fdb

    mov di,256
    mov cx,6
    rep stosw
    mov di,256
    mov [es:di+160],ax
    mov [es:di+162],ax
    mov [es:di+320],ax
    mov [es:di+322],ax
    mov [es:di+480],ax
    mov [es:di+482],ax
    mov [es:di+640],ax
    mov [es:di+642],ax
    add di,320
    mov cx,6
    rep stosw
    mov [es:di-164],ax
    mov [es:di-162],ax

       mov ax,0x0fdb
       mov di,270
       mov cx,6
       rep stosw
       mov di,270
       mov [es:di+160],ax
       mov [es:di+162],ax
       mov [es:di+320],ax
       mov [es:di+322],ax
       mov [es:di+480],ax
       mov [es:di+482],ax
       mov [es:di+640],ax
       mov [es:di+642],ax
       add di,320
       mov cx,6
       rep stosw
       mov [es:di-164],ax
       mov [es:di-162],ax
       sub di,6
       mov [es:di+160],ax
       mov [es:di+162],ax
       mov [es:di+320],ax
       mov [es:di+322],ax
       mov [es:di+324],ax

    mov di,286
    mov cx,6
    rep stosw
    mov di,286
    mov [es:di+164],ax
    mov [es:di+166],ax
    mov [es:di+324],ax
    mov [es:di+326],ax
    mov [es:di+484],ax
    mov [es:di+486],ax
    mov [es:di+644],ax
    mov [es:di+646],ax
    add di,640
    mov cx,6
    rep stosw

       mov di,300
       mov [es:di],ax
       mov [es:di+162],ax
       mov [es:di+324],ax
       mov [es:di+486],ax
       mov [es:di+648],ax
       add di,8
       mov [es:di],ax
       mov [es:di+158],ax
       mov [es:di+316],ax
       mov [es:di+474],ax
       mov [es:di+632],ax

       pop si
       pop di
       pop dx
       pop cx
       pop bx
       pop ax
       pop es
       add sp,2
       pop bp

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:


call clrscrn
call intro

mov ax, 0x4c00
int 0x21
