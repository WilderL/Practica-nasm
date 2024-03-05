; Division entre enteros
; Autor: Wilder
; Fecha: 20240301

%include 'stdio32.asm'

SECTION .text
	global _start

_start:
	mov	eax, 47		; 
	mov 	esi, 9		; 
	idiv	esi		; eax/registro
	
	call	printIntLn
	mov	eax, edx
	call	printIntLn
	call	Quit
