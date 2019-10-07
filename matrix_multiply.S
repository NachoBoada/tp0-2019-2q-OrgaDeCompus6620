#include <mips/regdef.h>

	.text
	.ent matrix_multiply
	.globl matrix_multiply
	
matrix_multiply:	

#Creo stack frame de la callee

	.frame 	$fp,88,ra
	subu 	sp,sp,88

#Creo SRA de la callee

    sw	ra,80(sp)
	.cprestore 72 
	sw	$fp,76(sp)	
	move	$fp,sp

#Creo ABA de la caller

	sw	a0,88($fp)	    #Guarda puntero matrix_a en ABA de la caller (main)
	sw	a1,92($fp)	    #Guarda puntero matrix_b en ABA de la caller (main)

#Creo LTA de la callee

	sw	a0,36($fp)	    #Guarda puntero matrix_a en LTA de la callee
	sw	a1,40($fp)	    #Guarda puntero matrix_b en LTA de la callee

#CODIGO NACHO
# 	dimention = matrix_a->rows:
# Obtengo matriz_a->rows.
lw  t0, 36($fp) #cargo el puntero a la matrix_a en t0.
sll t0, t0, 2   #corro 4 bytes para apuntar a la direccion de matriz_a->rows.
lw t1, 0(t0)    #cargo el valor apuntado por matriz_a->rows en t1.

# Guardo matriz_a->rows en el frame
sw  t1,0($fp)	#dimention = matrix_a->rows; Copio t1 (que es matriz_a->rows) en 0($fp).
sw  t1,4($fp)   #dimention = matrix_a->rows; Copio t1 (que es matriz_a->rows) en 4($fp)
sw  t1,16($fp)	#dimention = matrix_a->rows; Copio t1 (que es matriz_a->rows) en 16($fp) que tiene dimention. Para usar en nuestra funcion.

# Guardo dimention en los registros que se pasan por parametro a funcion, para la funcion create_matrix(dimention,dimention).
move a0, t1
move a1, t1

# 	matrix_t* matrix_c; 
#	matrix_c = create_matrix(dimention,dimention);
.extern create_matrix	#para llamarla del codigo de C.
la t9, create_matrix 	#cargo la direccion de la funcion en t9 (por convencion para funciones se usa t9).
jalr t9 				#Llamo a la funcion (esto lo saque de https://stackoverflow.com/questions/36980971/mips-call-c-function-in-assembly-code).
sw 44($fp), v0 			#Lo retornado por create_matrix se guarda en v0, y lo guardo en el frame pointer de lo que seria la matrix_c. matrix_c = create_matrix(dimention,dimention).

#	for (i = 0; i < dimention*dimention; i++):
# Para poder usar la misma lógica del programa en C, aplico una funcionalidad para ir con el contador desde 0 hasta dimention*dimention - 1.
lw t1, 16($fp)	#En 16($fp) esta el valor de dimention. Lo cargo en t1.
mul t2, t1, t1 	#t1 tiene la dimention, entonces queda dimention*dimention en t2.
li t3, 0		#t3 sera el contador, el "i" en la funcion de C.
primer_for:
	bge t3, t2, fin_primer_for 	#si "i" es mayor o igual a dimention * dimention, deja de procesar porque se termino el calculo de la matriz resultante.
	#Aca va lo que se hace adentro del 1er For.
	addi t3, t3, 1		#i++.
	#row = (int)(i / dimention):
	divu f0, t3, t1 	#f0 = (i / dimention).
	cvt.w.d  f0, f0   	#(int)(i / dimention).
	sw f0, 24($fp)		#row esta en 24($fp), entonces queda row = (int)(i / dimention).
	#column = (int)(i % dimention):
	remu t4, t3, t1 	#t4 = (i % dimention).
	sw t4, 20($fp)		#column esta en 20($fp), entonces queda column = (i % dimention).
	#element = 0:
	li f1, 0			#f1 es "element", entonces esto es element = 0.
	sd f1, 48($fp) 		#element se guarda en el frame en la posicion 48.
	#for (j = 0; j < dimention; j++):
	li t5, 0			#t5 sera el contrador "j" de la funcion C.
	segundo_for:
		bge t5, t1, fin_segundo_for		#mientras que j<dimention (t5 < t1), entra a las siguientes lineas.
		li t5, 1	#j++.
		############ A PARTIR DE ACA VA LO DE MAURO################
		
	j segundo_for
	fin_segundo_for
	#aca va: matrix_c->array[i] = element;
j primer_for
fin_primer_for:
#aca va el return matrix_c;


#CODIGO MAURO

ret:
    lw v0,44($fp)

fin:	
    lw	ra,80(sp)
	lw	$fp,76(sp)
	addu	sp,sp,88

	jr	ra
	.end 	matrix_multiply
    


	


	
