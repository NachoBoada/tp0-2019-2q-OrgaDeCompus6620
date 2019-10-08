#include <mips/regdef.h>

	.text
    .extern create_matrix
    .abicalls                   
	.ent matrix_multiply
	.globl matrix_multiply
	
matrix_multiply:	

	.frame 	$fp,56,ra	        
	subu 	sp,sp,56


    sw	ra,48(sp)
	.cprestore 40 
	sw	$fp,44(sp)	
	move	$fp,sp


	sw	a0,56($fp)	            
	sw	a1,60($fp)	                      

    lw  t0, 56($fp)             
    lw  t1, 0(t0)               
    sw  t1, 16($fp)	            

    sw  t1,0($fp)	            
    sw  t1,4($fp)               

    move a0, t1                 
    move a1, t1
    la t9, create_matrix	    
    jal t9 			
    sw  v0, 28($fp)  		    

    li  t3, 0                   
    lw  t1, 16($fp) 	        
    mul t2, t1, t1 	      

primer_for:
	bge  t3, t2, ret            

	divu t0, t3, t1 	       
	sw   t0, 24($fp)	   

	remu t4, t3, t1 	        
	sw   t4, 20($fp)		 

    li  t0, 0
    sw  t0, 32($fp) 		    
    sw  t0, 36($fp) 		   

	li t5, 0			     

segundo_for:
	bge t5, t1, add_element     

	lw t6, 16($fp)              
	lw t7, 24($fp)            
	mul t8, t6, t7             

	add t8, t8, t5            										 
										
	lw  t0, 56($fp)  
    addi t0,t0,8
    lw  t0, 0(t0)   
	sll t8, t8, 3          
	add t0, t0, t8           
	l.d $f2, 0(t0)           

    mul t7, t5, t6                                          								 
									
	lw t4, 20($fp)	           
	add t7, t7, t4	          						 
										
	lw  t0, 60($fp)   
    addi t0,t0,8   
    lw  t0, 0(t0)
	sll t7, t7, 3
    add t0, t0, t7
	l.d $f4, 0(t0)                         
										
	mul.d $f2, $f2, $f4        
										
	l.d  $f0, 32($fp)         
	add.d $f0,$f0,$f2         
	s.d  $f0, 32($fp)

		  

	addi t5, t5, 1	
    b segundo_for	        

add_element:

	lw  t0, 28($fp)        
    addi t0,t0,8      
    lw  t0, 0(t0)     
	sll t8, t3, 3   
	add t0, t0, t8 
    l.d $f0, 32($fp)
	s.d $f0, 0(t0) 

	addi t3, t3, 1
    b primer_for

ret:
    lw v0,28($fp)

fin:	
    lw	ra,48(sp)
	lw	$fp,44(sp)
	addu sp,sp,56

	jr	ra
	.end 	matrix_multiply
    


	


	
