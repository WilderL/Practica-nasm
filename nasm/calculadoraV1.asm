; Calcula version 1, con operaciones basica
; Autor:
; Fecha: 20240315

%include 'stdio32.asm'

SECTION .data
	msg	db	'Ingrese primer nuemero: ', 0
	msg1	db	'Ingrese segundo numero que no sea 0: ', 0
	msg2	db	'Ingrese opeacion: ', 0
	msg3	db	'Suma: ', 0
	msg4	db	'Resta: ', 0
	msg5	db	'Multiplicacion: ', 0
	msg6	db	'Division: ', 0

SECTION .bss
	numero1		resb	20
	numero2		resb	20
	operacion	resb	20
	num		resb	100

SECTION .text
	global _start

_start:
	pop	ecx			;contador de la pila

	cmp	ecx, 1h
	jle	pedir			; ecx <= 1
	pop	eax
	mov	esi, eax
	mov	edi, num
	call	strInt
	mov	eax, edx
	
	pop	ebx
	mov	esi, ebx
	call	strInt
	mov	ebx, edx

	jmp	calcular

pedir:
	mov	eax, msg
	call	strPrint
	mov	ebx, numero1
	call	strInput
	mov	esi, numero1
	call	strInt
	mov	eax, edx

	mov	eax, msg1
	call	strPrint
	mov	ebx, numero2
	call	strInput
	mov	esi, numero2
	call	strInt
	mov	ebx, edx

	mov	eax, msg2
	call	strPrint
	mov	ebx, operacion
	call	strInput 
	jmp 	operar

;-------------------strInt(cadena)
; convierte un stra a int, ingresa por esi
; retorna en edx
strInt:
	push	eax
	push	ebx
	push	ecx

	xor	ecx, ecx
	xor	edx, edx
	mov	ebx, 1

	SIciclo:
		mov	al, [esi]
		cmp	al, 10h
		je	unirNumber
		mov	[edi], al
		mov	eax, edi
		call	strPrintLn
		push	edi
		inc	ecx
		inc	esi

		jmp	ciclo

	;----------el valor lo guarda en edx
	unirNumber:
		mov	eax, esp
		sub	eax, 48
		imul	eax, ebx	; eax = eax * resgistro
		add	edx, eax
		dec	ecx
		cmp	ecx, 0
		imul	ebx, 10
		pop	eax
		jne	unirNumber
		jmp	finSI

	finSI:
		pop	ecx
		pop	ebx
		pop	eax
		ret

calcular:
	call	suma
	call	resta
	call	multi
	call	divi
	call	Quit

operar:
	mov	esi, operacion
	mov	al, [esi]
	cmp	al, '+'
	je	suma
	cmp	al, '-'
	je	resta
	cmp	al, '*'
	je	multi
	cmp	al, '/'
	je	divi
	call	Quit

suma:
	mov	eax, msg3
	call	strPrint
	add	eax, ebx
	call	printIntLn
	ret

resta:
	mov	eax, msg4
	call	strPrint
	sub	eax, ebx
	call	printIntLn
	ret

multi:
	mov	eax, msg5
	call	strPrint
	imul	eax, ebx
	call	printIntLn
	ret

divi:
	mov	eax, msg6
	call	strPrint
	idiv	ebx
	call	printIntLn
	ret
