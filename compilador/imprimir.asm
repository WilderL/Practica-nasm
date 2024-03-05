; Impresion en pantalla con envio de argumentos
; autor: Wilder
; fecha: 20240226

%include 'stdio32.asm'

SECTION .text
	global _start

_start:
	pop	ecx		; primer valor en pila = Num_Args
	
cicloExtrae:
	cmp	ecx, 0h		; si(ecx == 0)
	jz	noMasArg	; entonces salta a noMasArgs
	pop	eax		; sino extrae el siguiente argumento en pila
	call 	strPrintLn
	dec	ecx
	jmp	cicloExtrae

noMasArg:
	call	Quit
