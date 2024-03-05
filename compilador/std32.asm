; Bloque de funciones para conversiones
; autor:
; Fecha: 20240304

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


lowCase:

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


finStr:
	ret

