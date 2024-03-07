; bloque de funciones para entrada y salida standar
; autor: Wilder
; fecha: 20240223

;----------------int strLen(cadena)--------------------
; recibe cadena en eax y devuelve longitud en eax
strLen:
	push	ebx
	mov	ebx, eax

sigCaracter:
	cmp	byte [eax], 0
	jz	finStrLen
	inc	eax
	jmp	sigCaracter

finStrLen:
	sub	eax, ebx
	pop	ebx
	ret

;---------------strPrint(cadena)
; imprime cadean en pantalla, recibe cadena en eax
strPrint:
	push	edx
	push	ecx
	push	ebx
	push	eax
	
	call	strLen
	mov	edx, eax
	pop	eax
	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	pop 	ebx
	pop 	ecx
	pop	edx

	ret


;----------------strPrintLn(cadena)
; imprime cadena en pantalla, la cadena se recibe en eax 
; y agrega salto de linea en la impresion 
strPrintLn:
	call 	strPrint
	push 	eax
	mov 	eax, 0Ah		; eax = 0AH
	push 	eax			; colocamos el valor de eax en pila
	mov	eax, esp		; eax aputna a esp (posicion de iniicio de pila)
	call	strPrint
	pop	eax
	pop	eax
	ret

;---------------------------------imprimir numero------------------------------
;----------------divideNumber(cadena)
; operacion para obtener el entero de cada digito
divideNumber:
	inc     ecx			; Division count++
        xor     edx, edx                ; Clear edx before division
        idiv    ebx                     ; eax = quotient, edx = remainder
        push    edx                     ; Send edx to stack
        cmp     eax, 0                  ; Compare quotient with 0
        jne     divideNumber            ; If quotient is not 0, divide again

juntarDigito:
	cmp	ecx, 0
	jz	fin
	dec     ecx                     ; Division count--
        pop     edx                     ; Get digit
        add     edx, 48                 ; Convert number to ASCII
        push    edx                     ; Push ASCII
        mov     eax, esp                ; Get memory direction of ASCII
        call    strPrint
        pop     eax                     ; Pop ASCII
        xor     eax, eax
        jmp 	juntarDigito

fin:
	ret

;---------------printInt(cadena en numero)
; imprime cadena en pantalla, la cadena se recibe en eax 
printInt:
        push    eax
        push    ecx
        push    ebx

        mov     ebx, 10         ; Division by 10
        xor     ecx, ecx        ; Clear ebx (division count)
        call    divideNumber
        call    juntarDigito

        pop     ebx
        pop     ecx
        pop     eax
        ret

;-------------printIntLn(numero)
; Imprime el numero en pantalla
; el entero se recibe en eax
printIntLn:
	call	printInt

	push	eax

	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	strPrint

	pop	eax
	pop	eax
	ret

;---------------------------------Lectura del teclado------------------
;---------------strInput(cadena)
; captura el input de cadena del teclado
strInput:
	push	edx
	push	ecx
	push	ebx
	push	eax

        mov	edx, 20		; edx = espacio de memoria para lectura
	mov	ecx, ebx	; ecx = direccion de memoria para almacenar
	mov	ebx, 0		; leer desde STDIN (teclado)
	mov	eax, 3		; servicio SYS_READ (sistema de lectura)
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret

;------------------upCase(cadena)
; Convierte la cadena en mayuscula
upCase:

	UCCicle:
		mov 	al, [esi]
		cmp 	al, 0
		je 	finStr
		cmp 	al, 'a'
		jl 	noMinus

		cmp 	al, 'z'
		jg 	noMinus

		jmp	Minus

	noMinus:
		mov	[edi], al
		inc	edi
		jmp	nextUCh

	Minus:
		sub	al, 32
		mov	[edi], al
		inc	edi
	nextUCh:
		inc	esi
		jmp	UCCicle

;-------------------loCase(cadena)
; Convierte la cadena en minuscula
loCase:

	LCCicle:
		mov	al, [esi]
		cmp	al, 0
		je	finStr
		cmp	al, 'A'
		jl	noMayus
		cmp	al, 'Z'
		jg	noMayus
		jmp	Mayus

	noMayus:
		mov 	[edi], al
		inc	edi
		jmp	nextLCh

	Mayus:
		add	al, 32
		mov	[edi], al
		inc	edi

	nextLCh:
		inc	esi
		jmp	LCCicle

;------------finStr
; Retorno de funcion
finStr:
	ret

;---------------------------Invertir cadena----------------
strInvert:
	start:
		call	strLen
		add	esi, eax
		jmp 	ciclo

	ciclo:
		mov	al, [esi]
		cmp	al, 0
		je	finStr
		jmp	get
	
	get:
		mov	[edi], al
		dec	esi
		inc	edi
		jmp	ciclo

;--------------Quit
; cerre del programa
Quit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
	ret
