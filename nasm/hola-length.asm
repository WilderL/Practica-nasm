; Hola mundo con calculo de longitud de cadena
; autor: wilder
; fecha: 20240221

SECTION .data 
	msg	db	'Hola mundo!', 0Ah, 0Dh		; cadena

SECTION .text
	global _start

_start:
	;----------------Calcular la longitud de cadena
	mov	ebx, msg				; ebx = direccion de cadena
	mov	eax, ebx				; eax = ebx
	
siguiente:
	cmp	byte [eax], 0				; eax == 0
	jz	finciclo				; si no es 0, va etiqueta finciclo
	inc	eax					; incrementa en 1 eax
	jmp	siguiente				; salta a la etiqueta siguiente

finciclo:
	sub	eax, ebx				;  eax -= ebx
	
	;------------------Impresion en pantalla
	mov 	edx, eax				; edx = eax
	mov	ecx, msg				; ecx = msg
	mov	ebx, 1					; ebx = salida estandar
	mov	eax, 4					; imprimir en pantalla
	int	80h					; llamada de interrupcion
	
	;-----------------Salida
	mov ebx, 0					; error 0
	mov eax, 1					; salida del sistema
	int 80h						; llamada de interrupcion
