#include <mips/regdef.h>

	.text
	.ent matrix_multiply
	.globl matrix_multiply
	
matrix_multiply:	

#Creo stack frame de la callee

	.frame 	$fp,40,ra
	subu 	sp,sp,40 	#Stack frame creation

#Creo SRA de la calee

	.cprestore 24		#Saved register area. 
	sw	ra,32(sp)
	sw	$fp,28(sp)	
	move	$fp,sp

#Creo ABA de la caller

	sw	a0,40($fp)	#Guarda puntero matrix_a en ABA de la caller (main)
	sw	a0,16($fp)	#Guarda puntero matrix_a en LTA de la callee

	sw	a1,44($fp)	#Guarda puntero matrix_b en ABA de la caller (main)
	sw	a1,20($fp)	#Guarda puntero matrix_b en LTA de la callee

#Creo LTA de la callee

	sw	t0,16($fp)  #aux1
	sw	t1,20($fp)  #aux2
	sw	t2,24($fp)  #row
	sw	t3,28($fp)  #column
	sw	t4,32($fp)  #i
	sw	t5,36($fp)  #j
	sw	t6,40($fp)  #dimention

#Creo FRA de la callee

	sd	t7,44($fp)  #element (ocupa el t7 y el t8)

	



	


	
