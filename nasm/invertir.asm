; imprime una cadena invertida en pantalla
; Autor:
; Fecha: 20240306

%include 'stdio32.asm'

SECTION .data
	msg	db	'Ingrese una cadena: ', 0

SECTION .bss
	cadena		resb	20
	cadenaInvert	resb	20
SECTION .text
	global _start

_start:
	mov	 eax, msg
	call	 strPrint
	
	mov	eax, cadena
	mov	esi, cadena
	mov	edi, cadenaInvert
	call	strInput

	mov	eax, cadena
	call	strInvert

	mov	eax, cadenaInvert
	call	strPrintLn

	call	Quit
