; Hola mundo con archivo de cabecera de funciones externas
; autor: Wilder
; fecha: 20240223

%include 'stdio32.asm'				; funciones externas a incluir

SECTION .data
	msg1	db	'Hola mundo!', 0Ah, 0Dh, 0
	msg2	db	'Arquitectura en llamas XD', 0Ah, 0Dh, 0

SCTION .text
	global _start

_start:
	mov eax, msg1			
	call strPrint			; imprime cadena 1
	
	mov eax, msg2
	call strPrint			; imprime cadena 2
	
	call Quit			; salida del sistema
