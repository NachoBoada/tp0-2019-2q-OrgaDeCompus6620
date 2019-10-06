#include <mips/regdef.h>

	.text
	.ent matrix_multiply
	.globl matrix_multiply
	
matrix_multiply:	

#Creo stack frame de la callee

	.frame 	$fp,80,ra
	subu 	sp,sp,80

#Creo SRA de la calee

	.cprestore 24 
	sw	ra,32(sp)
	sw	$fp,28(sp)	
	move	$fp,sp

#Creo ABA de la caller

	sw	a0,80($fp)	#Guarda puntero matrix_a en ABA de la caller (main)
	sw	a1,(84)($fp)	#Guarda puntero matrix_b en ABA de la caller (main)

#Creo LTA de la callee

	sw	a0,20($fp)	#Guarda puntero matrix_a en LTA de la callee
	sw	a1,24($fp)	#Guarda puntero matrix_b en LTA de la callee

	



	


	
