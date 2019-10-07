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

#CODIGO MAURO

ret:
    lw v0,44($fp)

fin:	
    lw	ra,80(sp)
	lw	$fp,76(sp)
	addu	sp,sp,88

	jr	ra
	.end 	matrix_multiply
    


	


	
