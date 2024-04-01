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
	pop eax
	call	convertdecimal
	mov	ecx, eax		;primer numero
	
	pop	eax
	call	convertdecimal
	mov	edx, eax		;segundo numero

	jmp	calcular

pedir:
	mov	eax, msg		;pide el primer numero
	call	strPrint
	mov	ebx, numero1
	call	strInput
	mov	esi, numero1
	mov	eax, numero1
	call	convertdecimal
	mov	ecx, eax

	mov	eax, msg1		;pide el segundo numero
	call	strPrint
	mov	ebx, numero2
	call	strInput
	mov	esi, numero2
	mov	eax, numero2
	call	convertdecimal
	mov	edx, eax

	mov	eax, msg2
	call	strPrint
	mov	ebx, operacion
	call	strInput 
	jmp 	operar

;calculadoraV1
;./calculadoraV1 1 2
;./calculadoraV1
;	primer
;	segundo
;	operador

;calculadoraV2
;./calculadoraV2 2 3 +
;:5

;calculadoraV3 (rpm)
;/rpm
;:5
;:2
;:/
;:15
;:2 3 + *
;:q

;/rpm 5 3 + 8 *
;:64

;/rpm listado.txt respuesta.txt

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
	push	ecx
	push	edx
	mov	eax, msg3
	call	strPrint
	add	ecx, edx
	mov	eax, ecx
	call	printIntLn
	pop	edx
	pop	ecx
	ret

resta:
	push	ecx
	push	edx
	mov	eax, msg4
	call	strPrint
	sub	ecx, edx
	mov	eax, ecx
	call	printIntLn
	pop	edx
	pop	ecx
	ret

multi:
	push	ecx
	push	edx
	mov	eax, msg5
	call	strPrint
	imul	ecx, edx
	mov	eax, ecx
	call	printIntLn
	pop	edx
	pop	ecx
	ret

divi:
	push	ecx		;primer numero
	push	edx		;segundo numero
	mov	eax, msg6	
	call	strPrint	; mostrar msg de la division:
	mov	eax, ecx
	idiv	edx		;eax = eax/registro entera   ebx = sobrante
	call	printIntLn
	pop	edx
	pop	ecx
	ret
