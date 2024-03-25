;buscar SEEK_SET=0 (inicio del archivo), SEEK_CUR=1 (se desplaza una cantidad del archivo), SEEK_END=2 (fin de archivo)
;autor: Wilder
;fecha: 20240318

%include 'stdio32.asm'

SECTION .data
	archivo		db	'leame.txt', 0
	contenido	db	'--esto es una actualizacion--', 0

SECTION .text
	global _start

_start:
	;------------abroir archivo en modo de escritura---------
	mov	ecx, 1		;permiso de O_WRONLY
	mov	ebx, archivo	;nombre del archivo
	mov	eax, 5		;numero de servicio
	int	80h		;llamada del servicio

	;--------------ir a fin de archivo para agregar contenido-------------
	mov	edx, 2		;SEE_END
	mov	ecx, 0		;mover el cursor 0 bytes
	mov	ebx, eax	;descriptor de archivo en ebx
	mov	eax, 19		;SYS_LSEEK
	int	80h		;llamada del servicio

	;-----------------------agregar contenido---------------------
	mov	edx, 29		;longitud de cadena
	mov	ecx, contenido	;cadena a agregar
	mov	ebx, ebx	;mover el descriptor en ebx
	mov	eax, 4		;SYS_WRITE
	int	80h

	;---------------------cierre del programa-----------------------
	call	Quit
