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
       mov ax,0x0720    ; load space character on black background
       mov cx,1360      ; number of columns to color

       cld              ; auto increment method 
       rep stosw        ; repeat until  cx turns zero

       pop di
       pop cx
       pop ax
       pop es

       ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntrdTunnel:    
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
       push ds

       mov ax,0xb800
       mov es,ax   
       mov ds,ax

       cld                       ; auto increment method 

       mov ax,0x08db             ; dark grey foreground and black background

       mov cx,42                 ; number of columns to color
       mov di,1318               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,46                 ; number of columns to color
       mov di,1474               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,50                 ; number of columns to color
       mov di,1630               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,54                 ; number of columns to color
       mov di,1786               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,58                 ; number of columns to color
       mov di,1942               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,62                 ; number of columns to color
       mov di,2098               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,66                 ; number of columns to color
       mov di,2254               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,70                 ; number of columns to color
       mov di,2410               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov cx,74                 ; number of columns to color
       mov di,2566               ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov ax,0x7fdb   
       mov cx,1                  ; number of columns to color
       mov di,1520               ; place di to start of grass print position
       mov word[bp-2],0          ; initialize local variable to zero
       mov bx,6                  ; put 6 in bx to print 6 white dashes
       mov si,0               

loopline:
       push di                   ; store di for next loop iteration
       push cx                   ; store cx for next loop iteration
       rep stosw                 ; color the desired row grey
       pop cx                    ; restore cx value of columns to color
       pop di                    ; restore dx value of starting point in row
       add di,160                ; add 160 to move to next row (below)
       inc word[bp-2]            ; increment local variable count
       mov dx,word[bp-2]         ; copy the counter in dx 
       shr dx,1                  ; shift right to check if odd or even
       jc loopline2              ; if odd, dont increment di again
       add di,160                ; add 160 in di to print space between lines
       mov word[bp-2],0          ; reset the local variable
loopline2: 
       inc si                    ; si to control the executions of loop
       cmp si, bx                ; check if desired rows are colored yet or no 
       jnz loopline              ; keep printing line

       mov bx,0
       mov di,1314
ysl:
       add bx,1 
       mov ax,0x0edb
       mov [es:di],ax
       mov [es:di+2],ax    
       add di,156
       cmp bx,9
       jne ysl

       mov bx,0
       mov di,1402
ysl2:
       add bx,1 
       mov ax,0x0edb
       mov [es:di],ax
       mov [es:di+2],ax    
       add di,164
       cmp bx,9
       jne ysl2

    mov di,3040                ; point di to starting location
    mov cx, 6                  ; number of rows to color
    mov ax,0x08db              ; grey color attribute

loopRMrdT1: 
     push di                   ; store di for later use
     push cx                   ; store cx for later use
     mov cx,16                 ; number of columns to color
     rep stosw                 ; color desired columns
     pop cx                    ; restore cx
     pop di                    ; restore di
     add di,160                ; update di
     dec cx                    ; decrement row count
     cmp cx,0                  ; check if all rows colored
     jnz loopRMrdT1            ; keep coloring if false

     mov word[es:3544],0x0fdb  ; print white road line
     mov word[es:3864],0x0fdb  ; print white road line

     mov di,3520               ; point di to starting location
     mov ax,0x00db             ; green color attribute
     mov cx,6                  ; number of columns to color
     mov bx,3                  ; number of rows to color

loopRMT2:
     push di                   ; store di for later use
     push cx                   ; store cx for later use
     rep stosw                 ; color desired columns
     mov word[es:di],0x0edb    ; print white boundry of grass
     pop cx                    ; restore cx
     pop di                    ; restore di
     add di,160                ; update di
     sub cx,2                  ; decrement columns to color
     sub bx,1                  ; decrement rows counter
     cmp bx,0                  ; check if all rows colored
     jnz loopRMT2              ; keep coloring if false

    mov di,3040                ; point di to starting location
    mov cx,16                  ; number of rows to color
    mov ax,0x00db              ; grey color attribute
    rep stosw                  ; color desired columns

    mov di,3200                ; point di to starting location
    mov cx,16                  ; number of rows to color
    mov ax,0x00db              ; grey color attribute
    rep stosw                  ; color desired columns

    mov di,3360                ; point di to starting location
    mov cx,16                  ; number of rows to color
    mov ax,0x00db              ; grey color attribute
    rep stosw                  ; color desired columns
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov di,3044                ; point di to starting location
    mov cx,14                  ; number of rows to color
    mov ax,0x0fc4              ; grey color attribute
    rep stosw                  ; color desired columns

    mov di,3372                ; point di to starting location
    mov cx,10                  ; number of rows to color
    mov ax,0x0fc4              ; grey color attribute
    rep stosw                  ; color desired columns
                ; color desired columns
    mov di,3372
    mov ax,0x0fda
     mov [es:di],ax
 mov di,3044
    mov ax,0x0fda
     mov [es:di],ax


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov bx,0
   mov di,3204
 trl2:
       add bx,1
       mov ax,0x0fb3
       mov [es:di],ax
       add di,160
       cmp bx,4
       jne trl2


     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;








      pop ds
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movrdTunnel:    
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
       push ds

       mov ax,0xb800
       mov es,ax   
       mov ds,ax

       cld                       ; auto increment method 

    mov cx,7                     ; number of rows to use movs on
    mov di,2480                  ; destination index loaded
    mov si,2320                  ; source index loaded (directly above di)
    mov ax,[es:di]               ; store the memory location in ax

roadMov:
    movsw                        ; execute movs on word data
    sub di,162                   ; update di accordingly to move upwards 
    sub si,162                   ; update si accordingly to move upwards
    dec cx                       ; decrement when movsw executed once
    cmp cx,0                     ; check if all required rows are movsw
    jnz roadMov                  ; keep executing if not false
    mov [es:di],ax               ; replace the stored memory location

    mov di,3864                  ; destination index loaded
    mov si,3704                  ; source index loaded (directly above di)
    mov ax,[es:di]               ; store the memory location in ax               
    mov cx,2                     ; number of rows to use movs on

rearmirMov:
    movsw                        ; execute movs on word data
    sub di,162                   ; update di accordingly to move upwards 
    sub si,162                   ; update si accordingly to move upwards
    dec cx                       ; decrement when movsw executed once
    cmp cx,0                     ; check if all required rows are movsw
    jnz rearmirMov               ; keep executing if not false
    mov [es:di],ax               ; replace the stored memory location

       pop ds
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntrdTunnel1:    
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

       cld                       ; auto increment method 
      
       mov ax,0x0fc4             ; white on black background
       mov cx,42                 ; number of columns to color
       mov di,998                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov ax,0x0fb3
       mov [es:di+76],ax      
       mov [es:di+158],ax  
     
      mov di,998 
      mov ax,0x0fda
      mov [es:di],ax
      mov di,1080 
      mov ax,0x0fbf
      mov [es:di],ax
      
       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,50                 ; number of columns to color
       mov di,830                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

      mov bx,0
 tl2:
       add bx,1
       mov ax,0x0fb3
       mov [es:di+60],ax
       mov [es:di+158],ax
       add di,160
       cmp bx,3
       jne tl2

     mov di,830 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,928 
     mov ax,0x0fbf
     mov [es:di],ax
      
       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,66                 ; number of columns to color
       mov di,494                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

     mov bx,0
 tl4:
     add bx,1
     mov ax,0x0fb3
     mov [es:di+28],ax
     mov [es:di+158],ax
     add di,160
     cmp bx,9
     jne tl4

      mov di,494 
      mov ax,0x0fda
      mov [es:di],ax
      mov di,624 
      mov ax,0x0fbf
      mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,74                 ; number of columns to color
       mov di,326                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

      mov bx,0
 tl5:
       add bx,1
       mov ax,0x0fb3
       mov [es:di+12],ax
       mov [es:di+158],ax
       add di,160
       cmp bx,12
       jne tl5

      mov di,326 
      mov ax,0x0fda
      mov [es:di],ax
      mov di,472 
      mov ax,0x0fbf
      mov [es:di],ax

       mov ax,0x0fb2            ; dark grey foreground and black background
       mov cx,8                 ; number of columns to color
       mov di,712               ; place di to start of grass print position
       rep stosw

     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ax,0x0fdc            ; dark grey foreground and black background
       mov cx,4                 ; number of columns to color
       mov di,3214               ; place di to start of grass print position
       rep stosw


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  mov bx,0
   mov di,3206
 trl3:
       add bx,1
       mov ax,0x0fb3
       mov [es:di],ax
       add di,160
       cmp bx,4
       jne trl3
     


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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntrdTunnel2:    
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

       cld                       ; auto increment method 

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,42                 ; number of columns to color
       mov di,998                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov ax,0x0fb3
       mov [es:di+76],ax
       mov [es:di+158],ax

      mov di,998
      mov ax,0x0fda
      mov [es:di],ax
      mov di,1080
      mov ax,0x0fbf
      mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,58                 ; number of columns to color
       mov di,662                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

       mov bx,0
 tl32:
      add bx,1
      mov ax,0x0fb3
      mov [es:di+44],ax
      mov [es:di+158],ax
      add di,160
      cmp bx,6
      jne tl32

     mov di,662 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,776 
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,74                 ; number of columns to color
       mov di,326                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

      mov bx,0
 tl52:
      add bx,1
      mov ax,0x0fb3
      mov [es:di+12],ax
      mov [es:di+158],ax
      add di,160
      cmp bx,12
      jne tl52


     mov di,326 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,472 
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fb2            ; dark grey foreground and black background
       mov cx,8                 ; number of columns to color
       mov di,874               ; place di to start of grass print position
       rep stosw


       mov ax,0x0fb2             ; dark grey foreground and black background
       mov cx,8                ; number of columns to color
       mov di,548               ; place di to start of grass print position
       rep stosw

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;rearlight 2
       mov ax,0x0fdf            ; dark grey foreground and black background
       mov cx,4                 ; number of columns to color
       mov di,3222               ; place di to start of grass print position
       rep stosw  

mov bx,0
   ;mov di,3208
     mov di,3368 
trl4:
       add bx,1
       mov ax,0x0fb3
       mov [es:di],ax
       add di,160
       cmp bx,2
       jne trl4




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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prntrdTunnel3:    
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

       cld                       ; auto increment method 

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,50                 ; number of columns to color
       mov di,830                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

      mov bx,0
 tl23:
      add bx,1
      mov ax,0x0fb3
      mov [es:di+60],ax
      mov [es:di+158],ax
      add di,160
      cmp bx,3
      jne tl23

     mov di,830
     mov ax,0x0fda
     mov [es:di],ax
     mov di,928
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,58                 ; number of columns to color
       mov di,662                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

     mov bx,0
 tl33:
     add bx,1
     mov ax,0x0fb3
     mov [es:di+44],ax
     mov [es:di+158],ax
     add di,160
     cmp bx,6
     jne tl33

     mov di,662 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,776 
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,66                 ; number of columns to color
       mov di,494                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

     mov bx,0
 tl34:
      add bx,1
      mov ax,0x0fb3
      mov [es:di+28],ax
      mov [es:di+158],ax
      add di,160
      cmp bx,9
      jne tl34

     mov di,494 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,624 
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fc4             ; dark grey foreground and black background
       mov cx,77                 ; number of columns to color
       mov di,164                ; place di to start of grass print position
       rep stosw                 ; color desired number of cloumns

     mov bx,0
 tl36:
     add bx,1
     mov ax,0x0fb3
     mov [es:di+6],ax
     mov [es:di+158],ax
     add di,160
     cmp bx,14
     jne tl36

     mov di,164 
     mov ax,0x0fda
     mov [es:di],ax
     mov di,316 
     mov ax,0x0fbf
     mov [es:di],ax

       mov ax,0x0fb2             ; dark grey foreground and black background
       mov cx,8                  ; number of columns to color
       mov di,1038               ; place di to start of grass print position
       rep stosw

       mov ax,0x0fb2             ; dark grey foreground and black background
       mov cx,8                ; number of columns to color
       mov di,388               ; place di to start of grass print position
       rep stosw

mov bx,0
   ;mov di,3208
     mov di,3370 
trl5:
       add bx,1
       mov ax,0x0fb3
       mov [es:di],ax
       add di,160
       cmp bx,2
       jne trl5

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






start:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

call clrscrn
call prntrdTunnel

;call prntrdTunnel3
;jmp e

mov bx,0
myl:
call clrscrnTunnel 
call prntrdTunnel1
call movrdTunnel

     mov  cx,0xffff             ; load cx with highest count
loopx0: loop loopx0               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopx1: loop loopx1               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopx2: loop loopx2               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopx3: loop loopx3               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopx4: loop loopx4              ; loop instruction until cx is zero

call clrscrnTunnel
call prntrdTunnel2
call movrdTunnel

     mov  cx,0xffff             ; load cx with highest count
loopy0: loop loopy0               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopy1: loop loopy1               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopy2: loop loopy2               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopy3: loop loopy3               ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopy4: loop loopy4               ; loop instruction until cx is zero

call clrscrnTunnel  
call prntrdTunnel3
call movrdTunnel

     mov  cx,0xffff             ; load cx with highest count
loopzz0: loop loopzz0             ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopzz1: loop loopzz1             ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopzz2: loop loopzz2             ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopzz3: loop loopzz3             ; loop instruction until cx is zero
     mov  cx,0xffff             ; load cx with highest count
loopzz4: loop loopzz4             ; loop instruction until cx is zero

add bx,1
cmp bx,10
jne myl

e:
mov ax, 0x4c00
int 0x21

;;;;;;;;;;;;;;;;;;;;;;;;;;
clrscrnTunnel:
       push es
       push ax
       push cx
       push di
  
       mov ax,0xb800
       mov es,ax

       cld              ; auto increment method

       xor di,di        ; load di to point to top left of screen
       mov ax,0x0720    ; load space character on black background
       mov cx,640       ; number of columns to color
       rep stosw        ; repeat until  cx turns zero

      mov cx,16  
      mov di,1280 
      rep stosw        ; repeat until  cx turns zero

      mov cx,14
      mov di,1440
      rep stosw

      mov cx,12
      mov di,1600
      rep stosw

      mov cx,10
      mov di,1760
      rep stosw
     
      mov cx,8
      mov di,1920
      rep stosw

      mov cx,6
      mov di,2080
      rep stosw

      mov cx,4
      mov di,2240
      rep stosw

      mov cx,3
      mov di,2400
      rep stosw

      mov cx,16  
      mov di, 1406
      rep stosw
  
      mov cx,14
      mov di,1570
      rep stosw

      mov cx,12
      mov di,1734
      rep stosw

      mov cx,10
      mov di,1898
      rep stosw

      mov cx,8
      mov di,2062
      rep stosw

      mov cx,6
      mov di,2226
      rep stosw

      mov cx,4
      mov di,2390
      rep stosw

      mov cx,3
      mov di,2554
      rep stosw

      mov cx,8
      mov di,3214
      rep stosw
  
  mov bx,0
   mov di,3206
 ctrl3:
       add bx,1
       mov ax,0x0720
       mov [es:di],ax
       add di,160
       cmp bx,4
       jne ctrl3

mov bx,0
   ;mov di,3208
     mov di,3368 
ctrl4:
       add bx,1
       mov ax,0x0720
       mov [es:di],ax
       add di,160
       cmp bx,2
       jne ctrl4





mov bx,0
   ;mov di,3208
     mov di,3370 
ctrl5:
       add bx,1
       mov ax,0x0720
       mov [es:di],ax
       add di,160
       cmp bx,2
       jne ctrl5




     pop di
       pop cx
       pop ax
       pop es

       ret