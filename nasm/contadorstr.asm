; Impresion de digitos en pantalla
; Autor: Wilder
; Fecha: 20240301

%include 'stdio32.asm'

SECTION .text
	global _start

_start:
	mov	ecx, 0		; ecx = 0

sigNumero:
	mov	eax, ecx	; eax = ecx
	add	eax, 48		; eax += 48
	push	eax		; eax en pila
	mov	eax, esp	; eax = primera posicion de pila
	call	strPrintLn
	pop	eax
	inc	ecx
	cmp	ecx, 10
	jne	sigNumero
	call	Quit
