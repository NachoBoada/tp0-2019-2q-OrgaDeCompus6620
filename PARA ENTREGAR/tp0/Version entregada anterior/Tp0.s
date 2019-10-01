	.file	1 "Tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
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
$L18:
	lw	$v0,24($fp)
	lw	$v1,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L21
	b	$L17
$L21:
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
	b	$L18
$L17:
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	printArray
	.size	printArray, .-printArray
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
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
	.end	raiseError
	.size	raiseError, .-raiseError
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
	bne	$v0,$zero,$L24
	lw	$v0,28($fp)
	sw	$v0,40($fp)
	b	$L23
$L24:
	.set	noreorder
	nop
	.set	reorder
$L25:
	lw	$a0,64($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L26
	lw	$v1,32($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L27
	b	$L26
$L27:
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
	bne	$v1,$v0,$L25
	lw	$v0,24($fp)
	addu	$v0,$v0,16
	sw	$v0,24($fp)
	lw	$a0,28($fp)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L25
	lw	$v0,28($fp)
	sw	$v0,40($fp)
	b	$L23
$L26:
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
	sw	$v0,40($fp)
$L23:
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
$LC4:
	.ascii	"%g%n\000"
	.align	2
$LC5:
	.ascii	"No coincide dimension con cantidad de elementos ingresad"
	.ascii	"os\000"
	.align	2
$LC6:
	.ascii	"Input no numerico\000"
	.text
	.align	2
	.globl	readElementsInLine
	.ent	readElementsInLine
readElementsInLine:
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
	la	$a0,__sF
	la	$t9,readLine
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,36($fp)
$L32:
	addu	$v0,$fp,28
	addu	$v1,$fp,32
	lw	$a0,24($fp)
	la	$a1,$LC4
	move	$a2,$v0
	move	$a3,$v1
	la	$t9,sscanf
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L35
	lw	$v1,24($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sw	$v0,24($fp)
	lw	$v0,36($fp)
	sll	$v1,$v0,3
	lw	$v0,68($fp)
	addu	$v0,$v1,$v0
	l.s	$f0,28($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($v0)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L32
$L35:
	lw	$v1,40($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L36
	lw	$v0,36($fp)
	sw	$v0,44($fp)
	lw	$v1,64($fp)
	lw	$v0,64($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,44($fp)
	beq	$v0,$v1,$L31
	lw	$a0,68($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC5
	la	$t9,raiseError
	jal	$ra,$t9
	b	$L31
$L36:
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L32
	lw	$a0,68($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC6
	la	$t9,raiseError
	jal	$ra,$t9
$L31:
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	readElementsInLine
	.size	readElementsInLine, .-readElementsInLine
	.rdata
	.align	2
$LC7:
	.ascii	"%g\000"
	.align	2
$LC8:
	.ascii	"Dimension no numerica\000"
	.align	2
$LC9:
	.ascii	"La dimension no es entera positiva\000"
	.align	2
$LC10:
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
	la	$a1,$LC7
	addu	$a2,$fp,24
	la	$t9,fscanf
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L40
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L40:
	lw	$v1,32($fp)
	li	$v0,1			# 0x1
	beq	$v1,$v0,$L41
	la	$a0,$LC8
	la	$t9,raiseError
	jal	$ra,$t9
$L41:
	l.s	$f0,24($fp)
	trunc.w.s $f0,$f0,$v0
	cvt.s.w	$f2,$f0
	l.s	$f0,24($fp)
	sub.s	$f0,$f0,$f2
	s.s	$f0,36($fp)
	l.s	$f2,36($fp)
	mtc1	$zero,$f0
	c.lt.s	$f0,$f2
	bc1t	$L43
	l.s	$f2,24($fp)
	mtc1	$zero,$f0
	c.le.s	$f2,$f0
	bc1t	$L43
	b	$L42
$L43:
	la	$a0,$LC9
	la	$t9,raiseError
	jal	$ra,$t9
$L42:
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
	bne	$v0,$zero,$L44
	la	$a0,$LC10
	la	$t9,raiseError
	jal	$ra,$t9
$L44:
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
$LC11:
	.ascii	"\000"
	.space	99
	.align	2
$LC12:
	.ascii	"./\000"
	.align	2
$LC13:
	.ascii	"r\000"
	.align	2
$LC14:
	.ascii	"no se pudo abrir archivo de salida\000"
	.align	2
$LC15:
	.ascii	"%c\000"
	.text
	.align	2
	.globl	outputFile
	.ent	outputFile
outputFile:
	.frame	$fp,152,$ra		# vars= 112, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,152
	.cprestore 16
	sw	$ra,144($sp)
	sw	$fp,140($sp)
	sw	$gp,136($sp)
	move	$fp,$sp
	sw	$a0,152($fp)
	sw	$a1,156($fp)
	lbu	$v0,$LC11
	sb	$v0,24($fp)
	addu	$v0,$fp,25
	li	$v1,99			# 0x63
	move	$a0,$v0
	move	$a1,$zero
	move	$a2,$v1
	la	$t9,memset
	jal	$ra,$t9
	addu	$a0,$fp,24
	la	$a1,$LC12
	la	$t9,strcat
	jal	$ra,$t9
	addu	$a0,$fp,24
	lw	$a1,156($fp)
	la	$t9,strcat
	jal	$ra,$t9
	addu	$a0,$fp,24
	la	$a1,$LC13
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,128($fp)
	lw	$v0,128($fp)
	bne	$v0,$zero,$L46
	la	$a0,$LC14
	la	$t9,raiseError
	jal	$ra,$t9
$L46:
	.set	noreorder
	nop
	.set	reorder
$L47:
	lb	$v1,132($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L49
	b	$L45
$L49:
	lw	$v1,128($fp)
	lw	$v0,128($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,-1
	sw	$v0,4($v1)
	bgez	$v0,$L50
	lw	$a0,128($fp)
	la	$t9,__srget
	jal	$ra,$t9
	sb	$v0,133($fp)
	b	$L51
$L50:
	lw	$v0,128($fp)
	lw	$v1,0($v0)
	move	$a0,$v1
	lbu	$a0,0($a0)
	sb	$a0,133($fp)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
$L51:
	lbu	$v0,133($fp)
	sb	$v0,132($fp)
	lb	$v0,132($fp)
	lw	$a0,152($fp)
	la	$a1,$LC15
	move	$a2,$v0
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L47
$L45:
	move	$sp,$fp
	lw	$ra,144($sp)
	lw	$fp,140($sp)
	addu	$sp,$sp,152
	j	$ra
	.end	outputFile
	.size	outputFile, .-outputFile
	.rdata
	.align	2
$LC16:
	.ascii	"no se pudo allocar memoria para matriz\000"
	.align	2
$LC17:
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
	bne	$v0,$zero,$L53
	la	$a0,$LC16
	la	$t9,raiseError
	jal	$ra,$t9
$L53:
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
	bne	$v0,$zero,$L54
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	la	$a0,$LC17
	la	$t9,raiseError
	jal	$ra,$t9
$L54:
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
	beq	$v0,$zero,$L55
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
$L55:
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
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
$L58:
	lw	$v1,32($fp)
	lw	$v0,32($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,8($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L61
	b	$L59
$L61:
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
	b	$L58
$L59:
	lw	$v0,32($fp)
	lw	$v1,32($fp)
	mult	$v0,$v1
	mflo	$v0
	sw	$v0,8($fp)
$L62:
	lw	$v1,32($fp)
	lw	$v0,32($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v1,$v0,1
	lw	$v0,8($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L65
	b	$L57
$L65:
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
	b	$L62
$L57:
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
$L67:
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L70
	b	$L68
$L70:
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
$L71:
	lw	$v0,44($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L74
	b	$L72
$L74:
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
	b	$L71
$L72:
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
	b	$L67
$L68:
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
$LC18:
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
	la	$a1,$LC18
	lw	$a2,24($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,64($fp)
	la	$a1,$LC15
	li	$a2,32			# 0x20
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,40($fp)
$L76:
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,40($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L79
	b	$L77
$L79:
	lw	$a0,68($fp)
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,32($fp)
	lw	$a0,64($fp)
	la	$a1,$LC7
	lw	$a2,32($fp)
	lw	$a3,36($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,64($fp)
	la	$a1,$LC15
	li	$a2,32			# 0x20
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L76
$L77:
	lw	$a0,64($fp)
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.rdata
	.align	2
$LC19:
	.ascii	"-h\000"
	.align	2
$LC20:
	.ascii	"--help\000"
	.align	2
$LC21:
	.ascii	"help\000"
	.align	2
$LC22:
	.ascii	"-V\000"
	.align	2
$LC23:
	.ascii	"--version\000"
	.align	2
$LC24:
	.ascii	"version\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,88,$ra		# vars= 48, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,88
	.cprestore 16
	sw	$ra,80($sp)
	sw	$fp,76($sp)
	sw	$gp,72($sp)
	move	$fp,$sp
	sw	$a0,88($fp)
	sw	$a1,92($fp)
	la	$v0,__sF+88
	sw	$v0,24($fp)
	sb	$zero,28($fp)
	lw	$v0,88($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L81
	lw	$v0,92($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC19
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L83
	lw	$v0,92($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC20
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L82
$L83:
	lw	$v0,$LC21
	sw	$v0,32($fp)
	lbu	$v0,$LC21+4
	sb	$v0,36($fp)
	addu	$v0,$fp,32
	lw	$a0,24($fp)
	move	$a1,$v0
	la	$t9,outputFile
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,28($fp)
$L82:
	lw	$v0,92($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC22
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L85
	lw	$v0,92($fp)
	addu	$v0,$v0,4
	lw	$a0,0($v0)
	la	$a1,$LC23
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L81
$L85:
	lw	$v0,$LC24
	sw	$v0,40($fp)
	lw	$v0,$LC24+4
	sw	$v0,44($fp)
	addu	$v0,$fp,40
	lw	$a0,24($fp)
	move	$a1,$v0
	la	$t9,outputFile
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sb	$v0,28($fp)
$L81:
	li	$v0,1			# 0x1
	sb	$v0,48($fp)
$L86:
	lbu	$v0,48($fp)
	beq	$v0,$zero,$L87
	lbu	$v0,28($fp)
	bne	$v0,$zero,$L87
	addu	$v0,$fp,64
	move	$a0,$v0
	la	$t9,readInput
	jal	$ra,$t9
	sw	$v0,68($fp)
	lw	$a0,64($fp)
	lw	$a1,64($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$a0,64($fp)
	lw	$a1,64($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,56($fp)
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	lw	$a2,64($fp)
	lw	$a3,68($fp)
	la	$t9,fillUpMatrices
	jal	$ra,$t9
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,60($fp)
	lw	$a0,24($fp)
	lw	$a1,60($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	lw	$a0,52($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,56($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,60($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$v0,68($fp)
	beq	$v0,$zero,$L86
	lw	$a0,68($fp)
	la	$t9,free
	jal	$ra,$t9
	b	$L86
$L87:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,80($sp)
	lw	$fp,76($sp)
	addu	$sp,$sp,88
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
