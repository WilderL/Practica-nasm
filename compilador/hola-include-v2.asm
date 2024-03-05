; Hola mundo con archivo de cabecera de funciones externas
; autor: Wilder
; fecha: 20240223

%include 'stdio32.asm'				; funciones externas a incluir

SECTION .data
	msg1	db	'Hola mundo!', 0
	msg2	db	'Arquitectura en llamas xD', 0
	msg3	db	'abemen', 0

SECTION .text
	global _start

_start:
	mov eax, msg1			
	call strPrintLn			; imprime cadena 1
	
	mov eax, msg2
	call strPrint			; imprime cadena 2
	
	mov eax, msg3
	call strPrintLn

	call Quit			; salida del sistema
