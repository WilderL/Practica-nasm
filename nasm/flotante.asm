; Manejo de valores de coma flotante
; Autor: Wilder
; Fecha: 20240304
; Compilar: nasm -f elf64 flotante.asm -l flotante.lst
; link: gcc -m64 flotante.o -o flotante -no-pie

extern printf

SECTION .data
	pi:		dq	3.14459
	diametro:	dq	5.0
	format:		db	"C = d*π = %f * %f = %f", 10, 0		; el 10 es igual al enter

SECTION .bss
	c:	resq	1

SECTION .text
	global	main

main:
	push	rbp
	fld	qword [diametro]	; carga el diametro al registro ST0
	fmul	qword [pi]		; diametro * pi = fstp
	fstp	qword [c]		; guarda el resultado del ST0 en c

	;----------Llamada a printf
	mov	rdi, format		; cadena con formato de impresion
	movq	xmm0, qword [diametro]
	movq	xmm1, qword [pi]
	movq	xmm2, qword [c]
	mov	rax, 3			; cantidad de parametros a utilizar
	call	printf

	pop	rbp

	mov	rax, 1
	xor	rbx, rbx		; limpia el registro
	int	80h
