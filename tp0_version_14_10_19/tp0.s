	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.globl	input
	.globl	input
	.section	.bss
	.align	2
	.type	input, @object
	.size	input, 4
input:
	.space	4
	.globl	matrix_a
	.globl	matrix_a
	.align	2
	.type	matrix_a, @object
	.size	matrix_a, 4
matrix_a:
	.space	4
	.globl	matrix_b
	.globl	matrix_b
	.align	2
	.type	matrix_b, @object
	.size	matrix_b, 4
matrix_b:
	.space	4
	.globl	matrix_c
	.globl	matrix_c
	.align	2
	.type	matrix_c, @object
	.size	matrix_c, 4
matrix_c:
	.space	4
	.text
	.align	2
	.globl	freeInputArray
	.ent	freeInputArray
freeInputArray:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	lw	$v0,input
	beq	$v0,$zero,$L18
	lw	$a0,input
	la	$t9,free
	jal	$ra,$t9
$L18:
	sw	$zero,input
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	freeInputArray
	.size	freeInputArray, .-freeInputArray
	.rdata
	.align	2
$LC0:
	.ascii	"elemento %d: %g\n\000"
	.text
	.align	2
	.globl	printArray
	.ent	printArray
printArray:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$zero,24($fp)
$L20:
	lw	$v0,24($fp)
	lw	$v1,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L23
	b	$L19
$L23:
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	la	$a0,$LC0
	lw	$a1,24($fp)
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L20
$L19:
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	printArray
	.size	printArray, .-printArray
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	beq	$v0,$zero,$L24
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
$L24:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC1:
	.ascii	"\n\000"
	.align	2
$LC2:
	.ascii	"=======================\n\000"
	.align	2
$LC3:
	.ascii	"ERROR MESSAGE: %s\n\000"
	.text
	.align	2
	.globl	raiseError
	.ent	raiseError
raiseError:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC3
	lw	$a2,40($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,matrix_a
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,matrix_b
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,matrix_c
	la	$t9,destroy_matrix
	jal	$ra,$t9
	la	$t9,freeInputArray
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
	.end	raiseError
	.size	raiseError, .-raiseError
	.rdata
	.align	2
$LC4:
	.ascii	"FGETC ERROR: I/O error\000"
	.align	2
$LC5:
	.ascii	"REALLOC ERROR: null pointer returned\000"
	.text
	.align	2
	.globl	readLine
	.ent	readLine
readLine:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	li	$v0,10			# 0xa
	sw	$v0,24($fp)
	sw	$zero,36($fp)
	move	$a0,$zero
	lw	$a1,24($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L28
	lw	$v0,28($fp)
	sw	$v0,40($fp)
	b	$L27
$L28:
	.set	noreorder
	nop
	.set	reorder
$L29:
	lw	$a0,64($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L30
	lw	$v1,32($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L31
	b	$L30
$L31:
	addu	$a1,$fp,36
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,28($fp)
	addu	$a0,$a0,$v0
	lbu	$v0,32($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	lw	$v1,36($fp)
	lw	$v0,24($fp)
	bne	$v1,$v0,$L29
	lw	$v0,24($fp)
	addu	$v0,$v0,16
	sw	$v0,24($fp)
	lw	$a0,28($fp)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L29
	lw	$v0,28($fp)
	sw	$v0,40($fp)
	b	$L27
$L30:
	lhu	$v0,__sF+12
	srl	$v0,$v0,6
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L35
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC4
	la	$t9,raiseError
	jal	$ra,$t9
$L35:
	addu	$a1,$fp,36
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,28($fp)
	addu	$v0,$a0,$v0
	sb	$zero,0($v0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	lw	$a0,28($fp)
	lw	$a1,36($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L36
	la	$a0,$LC5
	la	$t9,raiseError
	jal	$ra,$t9
$L36:
	lw	$v0,28($fp)
	sw	$v0,40($fp)
$L27:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	readLine
	.size	readLine, .-readLine
	.rdata
	.align	2
$LC6:
	.ascii	"%g%n\000"
	.align	2
$LC7:
	.ascii	"SSCANF ERROR: I/O error\000"
	.align	2
$LC8:
	.ascii	"La cantidad de numeros es mayor a lo especificado segun "
	.ascii	"la dimension\000"
	.align	2
$LC9:
	.ascii	"La cantidad de numeros es menor a lo especificado segun "
	.ascii	"la dimension\000"
	.align	2
$LC10:
	.ascii	"Input no numerico\000"
	.text
	.align	2
	.globl	readElementsInLine
	.ent	readElementsInLine
readElementsInLine:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	la	$a0,__sF
	la	$t9,readLine
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	sw	$v0,28($fp)
	sw	$zero,40($fp)
	sw	$zero,48($fp)
$L38:
	addu	$v0,$fp,32
	addu	$v1,$fp,36
	lw	$a0,28($fp)
	la	$a1,$LC6
	move	$a2,$v0
	move	$a3,$v1
	la	$t9,sscanf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lhu	$v0,__sF+12
	srl	$v0,$v0,6
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L41
	lw	$a0,76($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC7
	la	$t9,raiseError
	jal	$ra,$t9
$L41:
	lw	$v1,44($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L42
	lw	$v1,28($fp)
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	sw	$v0,28($fp)
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,76($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,32($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,40($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L38
	lw	$a0,76($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,raiseError
	jal	$ra,$t9
	b	$L38
$L42:
	lw	$v1,44($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L44
	lw	$v0,40($fp)
	sw	$v0,48($fp)
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,48($fp)
	beq	$v0,$v1,$L37
	lw	$a0,76($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC9
	la	$t9,raiseError
	jal	$ra,$t9
	b	$L37
$L44:
	lw	$v1,44($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L38
	lw	$a0,76($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC10
	la	$t9,raiseError
	jal	$ra,$t9
$L37:
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	readElementsInLine
	.size	readElementsInLine, .-readElementsInLine
	.rdata
	.align	2
$LC11:
	.ascii	"%g\000"
	.align	2
$LC12:
	.ascii	"FSCANF ERROR: I/O error\000"
	.align	2
$LC13:
	.ascii	"Dimension no numerica\000"
	.align	2
$LC14:
	.ascii	"La dimension no es entera positiva\000"
	.align	2
$LC15:
	.ascii	"No se pudo allocar memoria para inputs\000"
	.text
	.align	2
	.globl	readInput
	.ent	readInput
readInput:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	la	$a0,__sF
	la	$a1,$LC11
	addu	$a2,$fp,24
	la	$t9,fscanf
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L48
	lhu	$v0,__sF+12
	srl	$v0,$v0,6
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L49
	la	$a0,$LC12
	la	$t9,raiseError
	jal	$ra,$t9
	b	$L48
$L49:
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L48:
	lw	$v1,32($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L51
	la	$a0,$LC13
	la	$t9,raiseError
	jal	$ra,$t9
$L51:
	l.s	$f0,24($fp)
	trunc.w.s $f0,$f0,$v0
	cvt.s.w	$f2,$f0
	l.s	$f0,24($fp)
	sub.s	$f0,$f0,$f2
	s.s	$f0,36($fp)
	l.s	$f2,36($fp)
	mtc1	$zero,$f0
	c.lt.s	$f0,$f2
	bc1t	$L53
	l.s	$f2,24($fp)
	mtc1	$zero,$f0
	c.le.s	$f2,$f0
	bc1t	$L53
	b	$L52
$L53:
	la	$a0,$LC14
	la	$t9,raiseError
	jal	$ra,$t9
$L52:
	lw	$v0,56($fp)
	l.s	$f0,24($fp)
	trunc.w.s $f0,$f0,$v1
	s.s	$f0,0($v0)
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,0($v0)
	lw	$v0,0($v1)
	mult	$a0,$v0
	mflo	$v0
	sll	$v0,$v0,4
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L54
	la	$a0,$LC15
	la	$t9,raiseError
	jal	$ra,$t9
$L54:
	lw	$v0,56($fp)
	lw	$a0,0($v0)
	lw	$a1,28($fp)
	la	$t9,readElementsInLine
	jal	$ra,$t9
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	readInput
	.size	readInput, .-readInput
	.rdata
	.align	2
$LC16:
	.ascii	"\000"
	.space	99
	.align	2
$LC17:
	.ascii	"./\000"
	.align	2
$LC18:
	.ascii	"r\000"
	.align	2
$LC19:
	.ascii	"no se pudo abrir archivo de salida\000"
	.align	2
$LC20:
	.ascii	"%c\000"
	.align	2
$LC21:
	.ascii	"FPRINTF ERROR: I/O error\000"
	.text
	.align	2
	.globl	outputFile
	.ent	outputFile
outputFile:
	.frame	$fp,160,$ra		# vars= 120, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 16
	sw	$ra,152($sp)
	sw	$fp,148($sp)
	sw	$gp,144($sp)
	move	$fp,$sp
	sw	$a0,160($fp)
	sw	$a1,164($fp)
	lbu	$v0,$LC16
	sb	$v0,24($fp)
	addu	$v0,$fp,25
	li	$v1,99			# 0x63
	move	$a0,$v0
	move	$a1,$zero
	move	$a2,$v1
	la	$t9,memset
	jal	$ra,$t9
	addu	$a0,$fp,24
	la	$a1,$LC17
	la	$t9,strcat
	jal	$ra,$t9
	addu	$a0,$fp,24
	lw	$a1,164($fp)
	la	$t9,strcat
	jal	$ra,$t9
	addu	$a0,$fp,24
	la	$a1,$LC18
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,132($fp)
	lw	$v0,132($fp)
	bne	$v0,$zero,$L56
	la	$a0,$LC19
	la	$t9,raiseError
	jal	$ra,$t9
$L56:
	.set	noreorder
	nop
	.set	reorder
$L57:
	lb	$v1,136($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L59
	b	$L58
$L59:
	lw	$v1,132($fp)
	lw	$v0,132($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,-1
	sw	$v0,4($v1)
	bgez	$v0,$L60
	lw	$a0,132($fp)
	la	$t9,__srget
	jal	$ra,$t9
	sb	$v0,137($fp)
	b	$L61
$L60:
	lw	$v0,132($fp)
	lw	$v1,0($v0)
	move	$a0,$v1
	lbu	$a0,0($a0)
	sb	$a0,137($fp)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
$L61:
	lbu	$v0,137($fp)
	sb	$v0,136($fp)
	lb	$v0,136($fp)
	lw	$a0,160($fp)
	la	$a1,$LC20
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,128($fp)
	lw	$v0,128($fp)
	bgez	$v0,$L57
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
	b	$L57
$L58:
	lhu	$v0,__sF+12
	srl	$v0,$v0,6
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L55
	la	$a0,$LC4
	la	$t9,raiseError
	jal	$ra,$t9
$L55:
	move	$sp,$fp
	lw	$ra,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$ra
	.end	outputFile
	.size	outputFile, .-outputFile
	.rdata
	.align	2
$LC22:
	.ascii	"no se pudo allocar memoria para matriz\000"
	.align	2
$LC23:
	.ascii	"no se pudo allocar memoria para elementos de matriz\000"
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L65
	la	$a0,$LC22
	la	$t9,raiseError
	jal	$ra,$t9
$L65:
	lw	$s0,24($fp)
	lw	$v1,52($fp)
	lw	$v0,48($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L66
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC23
	la	$t9,raiseError
	jal	$ra,$t9
$L66:
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	fillUpMatrices
	.ent	fillUpMatrices
fillUpMatrices:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	sw	$a2,32($fp)
	sw	$a3,36($fp)
	sw	$zero,8($fp)
$L68:
	lw	$v1,32($fp)
	lw	$v0,32($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,8($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L71
	b	$L69
$L71:
	lw	$a0,24($fp)
	lw	$v0,8($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a0,$v1,$v0
	lw	$v0,8($fp)
	sll	$v1,$v0,3
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,0($a0)
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	b	$L68
$L69:
	lw	$v0,32($fp)
	lw	$v1,32($fp)
	mult	$v0,$v1
	mflo	$v0
	sw	$v0,8($fp)
$L72:
	lw	$v1,32($fp)
	lw	$v0,32($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,8($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L75
	b	$L67
$L75:
	lw	$a0,28($fp)
	lw	$v1,32($fp)
	lw	$v0,32($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,8($fp)
	subu	$v0,$v0,$v1
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a0,$v1,$v0
	lw	$v0,8($fp)
	sll	$v1,$v0,3
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,0($a0)
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	b	$L72
$L67:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	fillUpMatrices
	.size	fillUpMatrices, .-fillUpMatrices
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$v0,72($fp)
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,28($fp)
	sw	$zero,40($fp)
$L77:
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L80
	b	$L78
$L80:
	lw	$v1,40($fp)
	lw	$v0,24($fp)
	div	$0,$v1,$v0
	mflo	$v1
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	sw	$v1,32($fp)
	lw	$v1,40($fp)
	lw	$v0,24($fp)
	div	$0,$v1,$v0
	mfhi	$v1
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	sw	$v1,36($fp)
	sw	$zero,48($fp)
	sw	$zero,52($fp)
	sw	$zero,44($fp)
$L81:
	lw	$v0,44($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L84
	b	$L82
$L84:
	lw	$a0,72($fp)
	lw	$v1,32($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,44($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$a1,$v1,$v0
	lw	$a0,76($fp)
	lw	$v1,44($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,36($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,48($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,48($fp)
	lw	$v0,44($fp)
	addu	$v0,$v0,1
	sw	$v0,44($fp)
	b	$L81
$L82:
	lw	$a0,28($fp)
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L77
$L78:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.rdata
	.align	2
$LC24:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	lw	$v0,68($fp)
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$a0,64($fp)
	la	$a1,$LC24
	lw	$a2,24($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bgez	$v0,$L86
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
$L86:
	lw	$a0,64($fp)
	la	$a1,$LC20
	li	$a2,32			# 0x20
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bgez	$v0,$L87
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
$L87:
	sw	$zero,40($fp)
$L88:
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L91
	b	$L89
$L91:
	lw	$a0,68($fp)
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,32($fp)
	lw	$a0,64($fp)
	la	$a1,$LC11
	lw	$a2,32($fp)
	lw	$a3,36($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bgez	$v0,$L92
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
$L92:
	lw	$a0,64($fp)
	la	$a1,$LC20
	li	$a2,32			# 0x20
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bgez	$v0,$L90
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
$L90:
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L88
$L89:
	lw	$a0,64($fp)
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,44($fp)
	bgez	$v0,$L85
	la	$a0,$LC21
	la	$t9,raiseError
	jal	$ra,$t9
$L85:
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.rdata
	.align	2
$LC25:
	.ascii	"-h\000"
	.align	2
$LC26:
	.ascii	"--help\000"
	.align	2
$LC27:
	.ascii	"help\000"
	.align	2
$LC28:
	.ascii	"-V\000"
	.align	2
$LC29:
	.ascii	"--version\000"
	.align	2
$LC30:
	.ascii	"version\000"
	.align	2
$LC31:
	.ascii	"command parameter invalid\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	la	$v0,__sF+88
	sw	$v0,24($fp)
	sb	$zero,28($fp)
	lw	$v0,72($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L96
	lw	$v0,76($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC25
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L98
	lw	$v0,76($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC26
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L97
$L98:
	lw	$v0,$LC27
	sw	$v0,32($fp)
	lbu	$v0,$LC27+4
	sb	$v0,36($fp)
	addu	$v0,$fp,32
	lw	$a0,24($fp)
	move	$a1,$v0
	la	$t9,outputFile
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,28($fp)
	b	$L96
$L97:
	lw	$v0,76($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC28
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L101
	lw	$v0,76($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC29
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L100
$L101:
	lw	$v0,$LC30
	sw	$v0,40($fp)
	lw	$v0,$LC30+4
	sw	$v0,44($fp)
	addu	$v0,$fp,40
	lw	$a0,24($fp)
	move	$a1,$v0
	la	$t9,outputFile
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,28($fp)
	b	$L96
$L100:
	la	$a0,$LC31
	la	$t9,raiseError
	jal	$ra,$t9
$L96:
	.set	noreorder
	nop
	.set	reorder
$L103:
	lbu	$v0,28($fp)
	beq	$v0,$zero,$L105
	b	$L104
$L105:
	addu	$v0,$fp,48
	move	$a0,$v0
	la	$t9,readInput
	jal	$ra,$t9
	sw	$v0,input
	lw	$a0,48($fp)
	lw	$a1,48($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,matrix_a
	lw	$a0,48($fp)
	lw	$a1,48($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,matrix_b
	lw	$a0,matrix_a
	lw	$a1,matrix_b
	lw	$a2,48($fp)
	lw	$a3,input
	la	$t9,fillUpMatrices
	jal	$ra,$t9
	lw	$a0,matrix_a
	lw	$a1,matrix_b
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,matrix_c
	lw	$a0,24($fp)
	lw	$a1,matrix_c
	la	$t9,print_matrix
	jal	$ra,$t9
	lw	$a0,matrix_a
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,matrix_b
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,matrix_c
	la	$t9,destroy_matrix
	jal	$ra,$t9
	la	$t9,freeInputArray
	jal	$ra,$t9
	b	$L103
$L104:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
