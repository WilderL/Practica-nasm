; Abrir archivo en elgun modo de operacion
; 0: O_RDONLY (lectura), 1: O_WRONLY (escritura), 2: O_RDWR (lectura y escritura)
; Autor: Wilder
; Fecha: 20240313

%include 'stdio32.asm'

SECTION .data
	filename	db	'leame.txt', 0
	contenido	db	'Hola mundo!', 0

SECTION .bss
	strLectura	resb	255		;variable para almacenar lectura

SECTION .text
	global _start

_start:
	;-----------------creacion del archivo--------------------------
	mov	ecx, 0777		;permisos
	mov	ebx, filename		;nombre del archivo
	mov	eax, 8			;tipo de servicio
	int	80h			;ejecutar servicio

	;----------------escribir contenid en el archivo-----------------
	mov	edx, 12 		;longitud del contenido a agregar
	mov	ecx, contenido		;contenido
	mov	ebx, eax		;descriptor del archivo
	mov	eax, 4			;SYS_WRITE, numero de servicio
	int	80h			;ejecutar el servicio

	;------------------modo lectura---------------------------------
	;el descriptor del archivo lo devuelve en eax en forma de entero
	mov	ecx, 0			;bandera(Modo) de solo lectura O_RDONLY
	mov	ebx, filename		;nombre del archivo a abrir
	mov	eax, 5			;SYS_OPEN, numero de servicio
	int	80h			;ejecutar el servicio

	;----------------leer el contenido del archivo-------------------
	mov	edx, 12			;longitud de cadena a leer
	mov	ecx, strLectura		;variable a utilizar
	mov	ebx, eax		;descriptor del archivo
	mov	eax, 3			;SYS_READ, numero de servicio
	int	80h			;ejecutar el servicio

	;-----------------imrpimir cadena leida------------------------
	mov	eax, strLectura
	call	strPrintLn

	;-----------------Cerrar el archivo---------------------------
	mov	ebx, ebx		;innecesario pero se trata deldescriptor
	mov	eax, 6			;SYS_CLOSE, numero de servicio
	int	80h			;ejecutar el servicio

	;------------------cierre del sistema-------------------------
	call	Quit
