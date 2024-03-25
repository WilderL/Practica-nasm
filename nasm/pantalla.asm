;Limpiar pantalla y despliegue en cadena
;Autor: Wilder
;Fecha: 20240315

%include 'stdio32.asm'

SECTION .data
	msg	db	'Hola Arquitectura!', 0
	strCls	db	1Bh, '[2J', 1Bh, '[3J', 0	;linea de codigo para borrar la pantalla

SECTION .text
	global _start

_start:
	;--------------------limpiar pantalla----------------
	mov	eax, strCls
	call	strPrint

	;-------------mostrar msg----------------------
	mov	eax, msg
	call	strPrintLn

	;-------------cierre de programa----------------
	call	Quit
