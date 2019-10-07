#include <mips/regdef.h>

	.text
	.ent matrix_multiply
	.globl matrix_multiply
	
matrix_multiply:	

#Se crea stack frame de la callee

	.frame 	$fp,88,ra
	subu 	sp,sp,88

#Se crea SRA de la callee

    sw	ra,80(sp)
	.cprestore 72 
	sw	$fp,76(sp)	
	move	$fp,sp

#Se crea ABA de la caller

	sw	a0,88($fp)	            #Guarda puntero matrix_a en ABA de la caller (main)
	sw	a1,92($fp)	            #Guarda puntero matrix_b en ABA de la caller (main)

#Se agrega en LTA de la callee

	sw	a0,36($fp)	            #Guarda puntero matrix_a en LTA de la callee
	sw	a1,40($fp)	            #Guarda puntero matrix_b en LTA de la callee

############    NACHO   ################

#(SE TRADUCE) dimention = matrix_a->rows:

#Se obtiene matriz_a->rows (dimention).

    lw  t0, 36($fp)             #se carga el puntero a la matrix_a en t0.
    sll t0, t0, 2               #se corre 4 bytes para apuntar a la direccion de matriz_a->rows.
    lw  t1, 0(t0)               #se carga el valor apuntado por matriz_a->rows en t1 (dimention).
    sw  t1,16($fp)	            #se guarda dimention en la LTA de la callee

#Se crea ABA de la callee

    sw  t1,0($fp)	            #dimention = matrix_a->rows; Copio t1 (que es matriz_a->rows) en 0($fp).
    sw  t1,4($fp)               #dimention = matrix_a->rows; Copio t1 (que es matriz_a->rows) en 4($fp)


#(SE TRADUCE) matrix_t* matrix_c; 
#(SE TRADUCE) matrix_c = create_matrix(dimention,dimention);

    move a0, t1                 #se guarda dimention en los registros que se pasan por parametro a funcion
    move a1, t1
    .extern create_matrix	    #para llamarla del codigo de C.
    jal create_matrix 			#Llamo a la funcion
    sw  v0, 44($fp)  		    #Lo retornado por create_matrix se guarda en v0, y lo guardo en su posicion de memoria dentro del stack frame.

#(SE TRADUCE) for (i = 0; i < dimention*dimention; i++);

#Para poder usar la misma lógica del programa en C, se aplica una funcionalidad para ir con el contador desde 0 hasta dimention*dimention - 1.

    li  t3, 0                   #i = 0
    lw  t1, 16($fp) 	        #En 16($fp) esta el valor de dimention. Lo cargo en t1.
    mul t2, t1, t1 	            #t1 tiene la dimention, entonces queda dimention*dimention en t2.

primer_for:
	bge  t3, t2, ret            #si "i" es mayor o igual a dimention * dimention, deja de procesar porque se termino el calculo de la matriz resultante.


#(SE TRADUCE) row = (int)(i / dimention);

	divu f0, t3, t1 	        #f0 = (i / dimention).
	cvt.w.d  f0, f0   	        #(int)(i / dimention).
	sw f0, 24($fp)		        #row esta en 24($fp), entonces queda row = (int)(i / dimention).


#(SE TRADUCE) column = (int)(i % dimention);

	remu t4, t3, t1 	        #t4 = (i % dimention).
	sw t4, 20($fp)		        #column esta en 20($fp), entonces queda column = (i % dimention).


#(SE TRADUCE) element = 0;

	li f1, 0			
	sd f1, 48($fp) 		        #element es 48($fp) por lo que aca se hace element = 0;

#(SE TRADUCE) for (j = 0; j < dimention; j++):;

	li t5, 0			        #t5 sera el contrador "j" de la funcion C.

segundo_for:
	bge t5, t1, add_element     #si j>=dimention (t5 >= t1), va a add_elemt y termina for, sino hace otra iteracion.

############ INICIO CODIGO MAURO ################

#(SE TRADUCE) aux1 = row*dimention;

	lw t6, 16($fp) #t6 cargo dimention
	lw t7, 24($fp) #t7 cargo row
	mul t8, t6, t7 #t8 tengo aux1 --- aux1=row*dimention	
	
#(SE TRADUCE) aux1 = aux1 + j;

	add t8, t8, t5 #aux= aux1+j											 
										 
#(SE TRADUCE) aux1 = matrix_a->array[aux1];

	lw  t0, 36($fp) #cargo el puntero a la matrix_a en t0.
	sll t0, t0, 2   #corro 4 bytes para apuntar a la direccion de matriz_a->rows.
	sllv t0, t0, t8 #t8 tiene aux1 desplazo por registro aux1
	ld t8, 0(t0)    #cargo el valor apuntado por matrix_a->array[aux1] en t8.
										 
										 
#(SE TRADUCE) aux2 = j*dimention;

	mul t7, t5, t6 #Borro row y obtengo aux2 -- aux2=j*dimention								 
										 
#(SE TRADUCE) aux2 = aux2 + column;

	lw t4, 20($fp)	#En 20($fp) esta el valor de column. Lo cargo en t4. por la dudas, puede sobrar porque creo que no se modifica
	add t7, t7, t4	#t7 tiene aux2 ---- aux2 = aux2 + column;						 
										 
#(SE TRADUCE) aux2 = matrix_b->array[aux2];

	lw  t0, 40($fp) #cargo el puntero a la matrix_b en t0.
	sll t0, t0, 2   #corro 4 bytes para apuntar a la direccion de matriz_b->rows.
	sllv t0, t0, t7 #t7 tiene aux2 desplazo por registro aux2
	ld t7, 0(t0)    #cargo el valor apuntado por matrix_b->array[aux2] en t7.									 
										 
#(SE TRADUCE) aux1 = aux1 * aux2;

	mul t8, t8,t7 #t8 tiene aux1 ---- aux1 = aux1 * aux2;								 
										 
#(SE TRADUCE) element = element + aux1;

	ld f1, 48($fp) #cargo en f1 element, puede estar de mas dado que no veo que se modifique f1
	add f1,t8 #element = element + aux1
	sd f1, 48($fp) 		#element se guarda en el frame en la posicion 48.
	j segundo_for

fin_segundo_for

#(SE TRADUCE) matrix_c->array[i] = element;

	lw t3,28($fp) #cargo el valor de i por las dudas --- puede ser redundante si no se modifica.
	lw  t0, 44($fp) #cargo el puntero a la matrix_b en t0.
	sll t0, t0, 2   #corro 4 bytes para apuntar a la direccion de matriz_b->rows.
	sllv t0, t0, t3 #t3 tiene i desplazo por registro i
	sd f1, 0(t0)    #guardo el valor de element f1 en matrix_c->array[i].

		
    #aux1 = row*dimention;
    #aux1 = aux1 + j;
    #aux1 = matrix_a->array[aux1];
    #aux2 = j*dimention;
    #aux2 = aux2 + column;
    #aux2 = matrix_b->array[aux2];
    #aux1 = aux1 * aux2;
    #element = element + aux1;}
	addi t5, t5, 1		        #j++.

add_element:
    #matrix_c->array[i] = element;
	addi t3, t3, 1		        #i++.

##################################################

ret:
    lw v0,44($fp)

fin:	
    lw	ra,80(sp)
	lw	$fp,76(sp)
	addu sp,sp,88

	jr	ra
	.end 	matrix_multiply
    


	


	
