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


;----------------divisor(cadena)
; operacion para obtener el entero del numero
divisor:
	

;---------------printInt(cadena en numero)
; imprime cadena en pantalla, la cadena se recibe en eax 
printInt:
        push    eax
        push    ecx

        add     eax, 48         ; Convertir el numero a ASCII
        push    eax             ; Colocar contenido de eax en la pila
        mov     eax, esp        ; eax apunta a la cabeza de la pila
        call    strPrint

        pop     eax
        pop     ecx
        pop     eax
        ret

;---------------printIntLn(cadena en numero)
; imprime cadena en pantalla, la cadena se recibe en eax
; y agrega salto de linea en la impresion 
printIntLn:
	push	eax
	push	ecx

	add 	eax, 48		; Convertir el numero a ASCII
	push	eax		; Colocar contenido de eax en la pila
	mov	eax, esp	; eax apunta a la cabeza de la pila
	call	strPrintLn

	pop	eax
	pop	ecx
	pop	eax
	ret

;---------------strInput(cadena)
; imprime cadena en pantalla, la cadena se recibe en eax
; la cadena que se recibe en un numero  
strInput:
	push	edx
	push	ecx
	push	ebx
	push	eax

        mov	edx, 20		; edx = espacio de memoria para lectura
	mov	ecx, nombre	; ecx = direccion de memoria para almacenar
	mov	ebx, 0		; leer desde STDIN (teclado)
	mov	eax, 3		; servicio SYS_READ (sistema de lectura)
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret

;--------------Quit
; cerre del programa
Quit:
	mov	ebx, 0
	mov	eax, 1
	int	80h
	ret
