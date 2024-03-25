; eliminar archivo SYS_UNLINK
; autor: Wilder
; fecha: 20240318

%include 'stdio32.asm'

SECTION .data
	archivo		db	'leame.txt', 0

SECTION .text
	global _start

_start:
	;------------------eliminar archivo------------------
	mov	ebx, archivo		;nombre del archivo a eliminar
	mov	eax, 10			;invoacion SYS_UNLINK
	int	80h

	;----------------cierre del programa------------------
	call	Quit
