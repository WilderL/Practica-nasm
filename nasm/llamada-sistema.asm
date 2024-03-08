; Llamada de comandos del sistema
; Autor: Wilder
; Fecha: 20240308

%include 'stdio32.asm'

SECTION .data
	comando		db	'/bin/echo', 0		;comando ejecutar
	mensaje		db	'hola mundo!', 0	;cadena a desplegar
	argumentos	dd	comando			;creacion de struct.
			dd	mensaje			;
			dd	0			;fin de la struct
	entorno		dd	0			;parametro a tralad. como variable de entorno

SECTION	.text
	global _start

_start:
	mov 	edx, entorno			;direccion de vars. de entorno
	mov	ecx, argumentos			;argumento a pasar a la linea de comandos
	mov	ebx, comando			;comando a ejecutar
	mov	eax, 11				;llama a servicio SYS_EXECVE
	int	80h				;ejecuta el servicio

	call	Quit
