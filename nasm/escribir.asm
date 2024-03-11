; Creacion y escritura de archivos
; Autor: Wilder
; Fecha: 20240311

%include 'stdio32.asm'

SECTION .data
	nombrearch	db	'leame.txt', 0
	cadena		db	'este es el contenido a agregar', 0
	len 		equ	$-cadena
SECTION .text
	global _start

_start:
	;--------------Creacion del archivo------------------------- 
	mov	ecx, 0777o	; configurando permisos rwx para todos
	mov	ebx, nombrearch	; nombre de archivo a crear
	mov	eax, 8		; SYS_CREAT
	int	80h

	;----------------Escritura en archivo-----------------------
	mov	ebx, eax	; descriptor del archivo ebx

	mov	eax, cadena
	call	strLen

	mov	edx, eax	; Longitud de la cadena
	mov	ecx, cadena	; contenido a agregar en ecx
	mov	eax, 4		; SYS_READ

	call	Quit

