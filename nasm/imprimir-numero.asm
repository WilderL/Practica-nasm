; Imprimir numero en pantalla
; Autor: Wilder
; Fecha: 20240305

%include 'stdio32.asm'

SECTION .data
	msg	db	'El numero es: ', 0

SECTION .bss
	numero	resb	20

SECTION .text
        global _start

_start:
	mov	eax, msg
	call	strPrint

	mov	eax, 1542
        call    printIntLn
        call    Quit
