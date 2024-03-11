; Creacion de archivos
; Autor: Wilder
; Fecha: 20240311

%include 'stdio32.asm'

SECTION .data
	nombrearch	db	'leame.txt', 0

SECTION .text
	global _start

_start:
	mov	ecx, 0777o	; configurando permisos rwx para todos
	mov	ebx, nombrearch	; nombre de archivo a crear
	mov	eax, 8		; SYS_CREAT
	int	80h

	call	Quit
