; Lectura de datos desde teclado y almacenamiento en memoria
; Autor: WilderL
; Fecha: 20240228

%include 'stdio32.asm'

SECTION .data
	msg1	db	'Ingrese su nombre: ', 0
	msg2	db	'Hola ', 0

SECTION .bss
	nombre	resb	20		; reserva 20 espacios
	
SECTION .text
	global _start

_start:
	mov	eax, msg1
	call	strPrint
	
	call	strInput

	mov 	eax, msg2
	call	strPrint

	mov	eax, nombre
	call	strPrint

	call	Quit
