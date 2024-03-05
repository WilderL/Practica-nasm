; Hola mundo con conteo de caracteres utilizando subrutina
; autor: Wilder
; fecha: 20240223

SECTION .data
	msg	db	'Hola mundo!', 0Ah, 0Dh

SECTION .text
	global _start

_start:
	mov 	eax, msg		; eax = msg
	call	strLen			; llamada a subrutana strLen
	
	;-------------------Imprimir en pantalla la cadena msg
	mov	edx, eax
	mov 	ecx, msg
	mov	eax, 4
	int	80h

	;--------------------Fin del programa
	mov 	ebx, 0
	mov	eax, 1
	int	80h

;---------------------Implementacion de subrutina
strLen:
	push	ebx			;saca la informacion ebx y lo mete a la pila
	mov	ebx, eax

sigCaracter:
	cmp	byte [eax], 0
	jz	finstrLen
	inc	eax
	jmp	sigCaracter
	
finstrLen:
	sub	eax, ebx		; hace la resta para el largo de la cadena
	pop 	ebx			; devuelvo el contenido de ebx 
	ret	
