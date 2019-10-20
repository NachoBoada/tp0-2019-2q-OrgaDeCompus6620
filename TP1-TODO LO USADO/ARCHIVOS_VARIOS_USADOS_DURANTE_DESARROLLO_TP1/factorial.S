#include <mips/regdef.h>

	.text
	.ent factorial
	.globl factorial
	
factorial:	

	.frame 	$fp,40,ra

	subu 	sp,sp,40 	#Stack frame creation

	.cprestore 24		#Saved register area. 
	sw	ra,32(sp)
	sw	$fp,28(sp)	
	move	$fp,sp

	sw	a0,40($fp)	#Argument Building Area
	sw	a0,16($fp)	#Local and Temporary Area.
				
	lw	t0,16($fp)
	li	t1,2
	bltu	t0,t1,$ret1


$rec:	lw	t0,16($fp)	#n>=2
	subu	t0,t0,1
	sw	t0,16($fp)
	addu	a0,t0,zero
	jal	factorial	#factorial(n-1)
	
	lw	t0,40($fp)	
	mul	v0,v0,t0	
	b	$fin

$ret1:	li	v0,1		#return 1

$fin:	lw	ra,32(sp)
	lw	$fp,28(sp)
	addu	sp,sp,40

	jr	ra
	.end 	factorial
	



	


	
