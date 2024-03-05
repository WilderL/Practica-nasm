; Convertidor de cadenas de mayusculas y minusculas
; Autor: Anonymous
; Fecha: 20240304

%include 'stdio32.asm'

SECTION .data
	msg	db	'Ingrese cadena: ', 0
	msg1	db	'Mayusculas: ', 0
	msg2	db	'Minusculas: ', 0

SECTION .bss
	cadena			resb	20		;reserva 20  espacio
	cadenaUpCase		resb	20
	cadenaLowCase		resb	20

SECTION .text
	global _start

_start:
	mov	eax, msg
	call	strPrint
	
	;-------lectura del teclado
	mov	ebx, cadena
	call	strInput

	;-----Convertir en mayuscula
	mov	esi, cadena			; esi = puntero de origen 
	mov	edi, cadenaUpCase		; edi = puntero de destino
	call	upCase
	mov	byte [edi], 0

	;-------Convertir en minusculas
	mov	esi, cadena			; esi = puntero de origen
	mov	edi, cadenaLowCase		; edi = puntero de destino
	call	loCase
	mov	byte [edi], 0

	;------imprimir en pantalla
	mov	eax, msg1
	call	strPrint
	mov	eax, cadenaUpCase
	call	strPrintLn
	
	mov	eax, msg2
	call	strPrint
	mov	eax, cadenaLowCase
	call	strPrintLn
	
	;------Cierre del programa
	call	Quit
