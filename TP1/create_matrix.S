#include <mips/regdef.h>

	.text
    .abicalls
	.ent create_matrix
	.globl create_matrix
	
create_matrix:	

#Se crea stack frame de la callee

	.frame 	$fp,40,ra

	#.set	noreorder	        # apaga reordenamiento de instrucciones
	#.cpload t9		            # directiva usada para codigo PIC
	#.set	reorder		        # enciende reordenamiento de instrucciones

	subu 	sp,sp,24

#Se crea SRA de la callee

    sw	ra,32(sp)
	.cprestore 24 
	sw	$fp,28(sp)	
	move	$fp,sp

#Se guardan parametros en ABA de caller

    sw a0,40($fp)               # guardo rows
    sw a1,44($fp)               # guardo cols

#(SE TRADUCE) matrix_t *matriz = malloc(sizeof(matrix_t));

    li a0,12                    # quiero 12 bytes = 4 bytes (cols) + 4 bytes (rows) + 4 bytes (puntero)
    jal mymalloc

#(SE TRADUCE) if (matriz== NULL){ return NULL};

    beqz v0, error1
    sw v0,16($fp)               # guardo matriz en stackframe

#(SE TRADUCE) matriz->array = malloc(sizeof(double) * cols * rows);

    lw t0,40($fp)
    lw t1,44($fp)
    mul t0,t0,t1
    sll t0,t0,3                 # quiero rows bytes * cols bytes * 8 bytes (double)

    move a0,t0                 
    jal mymalloc
  
#(SE TRADUCE) if (matriz->array== NULL){free(matriz); return NULL};

    beqz v0, error2
    sw v0,20($fp)               # guardo array en stackframe

#asiganciones

    lw t0,40($fp)               # cargo rows (el valor numerico)
    lw t1,16($fp)               # cargo matriz (pero tambien estoy apuntando a matriz->rows)
    sw t0,t1                    # cargo el valor numerico de row en matriz->rows

    lw t0,44($fp)               # cargo cols (el valor numerico)
    lw t1,16($fp)               # cargo matriz
    addiu t1,t1,4               # apunto a matriz->cols
    sw t0,t1                    # cargo el valor numerico de cols en matriz->cols

    lw t0,20($fp)               # cargo array
    lw t1,16($fp)               # cargo matriz
    addiu t0,t1,8               # apunto a matriz->array
    sw t0,t1                    # cargo el valor de array en matriz->array 

    lw t1,16($fp)               # cargo matriz
    move v0,t1                  # cargo el puntero a matriz a v0 para retorno

ret:	
    lw	ra,32(sp)
	lw	$fp,28(sp)
	addu sp,sp,40

	jr	ra
	.end 	create_matrix

error1:
    li v0,0                     # se retorna NULL (osea 0)
    b ret

error2:
    lw a0,16($fp)               # cargo matriz
    jal myfree
    li v0,0                     # se retorna NULL (osea 0)
    b ret
