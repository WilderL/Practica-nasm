;Limpiar pantalla y despliegue en cadena en posicion especifica
;el tamanio de la pantalla 24x80
;Autor: Wilder
;Fecha: 20240315

%include 'stdio32.asm'

SECTION .data
	msg		db	'Hola Arquitectura!', 0
	strCls		db	1Bh, '[2J', 1Bh, '[3J', 0	;linea de codigo para borrar la pantalla
	strPosXY	db	1Bh, '[12;31H', 0
	strFinPantalla	db	1Bh, '[24;1H', 0
	strColor	db	1Bh, '[3;33;49m', 0

SECTION .text
	global _start

_start:
	;--------------------limpiar pantalla----------------
	mov	eax, strCls
	call	strPrint

	;-------------Posicion del cursor----------------------
	mov	eax, strPosXY
	call	strPrint
	
	;-----------------cambiar de color-------------------
	mov	eax, strColor
	call	strPrint

	;--------------imprimir cadnea de mensaje-----
	mov	eax, msg
	call	strPrint

	;------------posicionar cursor al final
	mov	eax, strFinPantalla
	call	strPrint

	;-------------cierre de programa----------------
	call	Quit
