; Hola mundo version 1
; autor: Wilder
; fecha: 20240219

SECTION .data ; seccion de variables
	msg	db	'Hola mundo!', 0Ah, 0Dh	; msg = 'Hola mundo!\n'

SECTION .text ;seccion de codigo
	global	_start

_start:
	;-----------imprimir en pantalla
	mov 	edx,13				; edx=13
	mov 	ecx,msg				; ecx=msg
	mov 	ebx,1				; ebx=1 STDOUT_file
	mov	eax,4				; SYS_Write 
	int	80h				; cierre del probrama
	;------------Salida
	mov ebx,0				; return 0 'No errors'
	mov eax,1				; SYS_Exit
	int	80h				; cierre del segmento
