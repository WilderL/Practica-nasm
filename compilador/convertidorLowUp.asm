; Convertidor de cadenas de mayusculas y minusculas
; Autor: Anonymous
; Fecha: 20240304

%include 'stdio32.asm'
%include 'std32.asm'

SECTION .data
	msg	db	'Ingrese cadena revuelta: '

SECTION .bss
	nombre			resb	20		;reserva 20  espacio
	cadenaUpCase		resb	20
	cadenaLowCase		resb	20

SECTION .text
	global _start

_start:
	mov	eax, msg
	call	strPrint

	call	strInput
	mov	eax, nombre

	mov	esi, nombre
	mov	edi, cadenaUpCase
	call	upCase
	mov	byte [edi], 0
	mov	eax, cadenaUpCase
	call	strPrintLn

	mov	esi, nombre
	mov	edi, cadenaLowCase
	call	lowCase
	mov	byte [edi], 0
	mov	eax, cadenaLowCase
	call	strPrintLn

	call	Quit
