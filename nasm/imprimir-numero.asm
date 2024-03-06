; Imprimir numero en pantalla
; Autor: Wilder
; Fecha: 20240305

%include 'stdio32.asm'

SECTION .data
	msg	db	'printIntLn: ', 0
	msg1	db	'printInt: ', 0

SECTION .text
        global _start

_start:
	mov	eax, msg
	call	strPrint

	mov	eax, 2678
        call    printIntLn

	mov	eax, msg1
	call	strPrint

	mov	eax, 2000
	call	printInt
        call    Quit
