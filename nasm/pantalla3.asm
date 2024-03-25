;Limpiar pantalla y despliegue en cadena en posicion especifica
;el tamanio de la pantalla 24x80
;Autor: Wilder
;Fecha: 20240315

%include 'stdio32.asm'

SECTION .data
	msg		db	'Hola Arquitectura!', 0
	
SECTION .text
	global _start

_start:
	call	clrScr

	;-------------Posicion del cursor----------------------
	mov	eax, 1235
	call	gotoXY
	
	;-----------------cambiar de color-------------------
	mov	eax, strColor
	call	strPrint

	;--------------imprimir cadnea de mensaje-----
	mov	eax, msg
	call	strPrint

	;------------posicionar cursor al final
	mov	eax, 3401
	call	gotoXY

	;-------------cierre de programa----------------
	call	Quit
