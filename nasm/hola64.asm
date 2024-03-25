; hola mundo con arquitectura de 64bits
; autor: Wilder
;fecha : 20240324

SECTION .data
	msg	db	'Hola mundo!', 0Ah, 0

SECTION	.text
	global _start:

_start:
	;----------------imprimir en pantalla
	mov	rdx, 12		;longitud de la cadena
	mov	rsi, msg	;cadena
	mov	rdi, 1		;stdout
	mov	rax, 1		;numero de instruccion
	syscall			;ejecutar la instruccion

	;-------------------Quit------------------------
	mov	rax, 60
	xor	rdi, rdi
	syscall
