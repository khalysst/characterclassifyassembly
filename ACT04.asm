; ACT04.COM

; Program to classify a character whether it is an ALPHABET (LOWERCASE / UPPERCASE),
; a NUMBER (PRIME / NON - PRIME) and a SPECIAL CHARACTER

title ACT04.COM 
.model tiny
.386
.data
	a DB 0ah, 0dh, 0ah, 0dh, "Programmed by : @khalysst / on Github$"
	b DB 0ah, 0dh, 0ah, 0dh, "Input a Character : $"
	c DB 0ah, 0dh, 0ah, 0dh, "Another Try (y/n) : $"
	e DB 0ah, 0dh, 0ah, 0dh, "It's an ALPHABET$"
	f DB 0ah, 0dh, 0ah, 0dh, "LOWERCASE$"
	g DB 0ah, 0dh, 0ah, 0dh, "UPPERCASE$"
	h DB 0ah, 0dh, 0ah, 0dh, "It's a NUMBER$"
	i DB 0ah, 0dh, 0ah, 0dh, "NOT A PRIME NUMBER$"
	j DB 0ah, 0dh, 0ah, 0dh, "PRIME NUMBER$"
	k DB 0ah, 0dh, 0ah, 0dh, "It's a SPECIAL CHARACTER$"
	l DB 0ah, 0dh, 0ah, 0dh, "Only CHOOSE between Y/y, N/n$"
	m DB ?
	n DB ?

.code 
	org 100h
	
BEGIN:

; ============================
	
	lea dx,b 
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	
; ============================

	mov bl,al
	
	cmp bl,61h
	jge LOWERCASE
	
	cmp bl,41h
	jge UPPERCASE
	
	cmp bl,30h
	jge NUMBER
	
	cmp bl,30h
	jl SPECIAL
	
; ============================

SPECIAL:
	lea dx,k
	mov ah,09h
	int 21h
	
	jmp TRY

; ============================

LOWERCASE:
	cmp bl,7ah
	jg SPECIAL 
	
	lea dx,e 
	mov ah,09h
	int 21h
	
	lea dx,f
	mov ah,09h
	int 21h
	
	jmp TRY
	
; ============================

UPPERCASE:
	cmp bl,5ah
	jg SPECIAL 
	
	lea dx,e 
	mov ah,09h
	int 21h
	
	lea dx,g
	mov ah,09h
	int 21h
	
	jmp TRY
	
; ============================

NUMBER:
	cmp bl,39h
	jg SPECIAL 
	
	lea dx,h
	mov ah,09h
	int 21h
	
	cmp al,31h
	jbe NPRIME 
	
	cmp al,32h
	je PRIME 
	
	cmp al,33h
	je PRIME
	
	sub al,30h
	mov m,al 
	
	mov ah,00
	
	mov bl,2
	div bl
	mov bl,al 
	
	L1:
	mov ah,00
	mov al,m 
	div bl
	cmp ah,00
	jz NPRIME 
	dec bl 
	cmp bl,1
	jne L1 
	jmp PRIME 
	
; ============================

NPRIME:	
	lea dx,i 
	mov ah,09h
	int 21h
	
	jmp TRY

; ============================

PRIME:
	lea dx,j 
	mov ah,09h
	int 21h
	
	jmp TRY
	
; ============================

TRY:
	lea dx,c 
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	
	cmp al,'y'
	je BEGIN  

	cmp al,'Y'
	je BEGIN 
	
	cmp al,'n'
	je EXIT 
	
	cmp al,'N'
	je EXIT
	
	lea dx,l 
	mov ah,09h
	int 21h
	jmp TRY

; ============================

EXIT:
	lea dx,a 
	mov ah,09h
	int 21h
	mov ah,4ch
	int 20h

; ============================

end BEGIN 
