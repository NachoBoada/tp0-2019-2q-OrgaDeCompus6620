	.file	1 "tp1.c"
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
	.text
	.align	2
	.globl	freeInputArray
	.ent	freeInputArray
freeInputArray:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	lw	$2,input
	beq	$2,$0,$L18
	lw	$4,input
	la	$25,free
	jal	$31,$25
$L18:
	sw	$0,input
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
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
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	sw	$0,24($fp)
$L20:
	lw	$2,24($fp)
	lw	$3,48($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L23
	b	$L19
$L23:
	lw	$2,24($fp)
	sll	$3,$2,3
	lw	$2,52($fp)
	addu	$2,$3,$2
	la	$4,$LC0
	lw	$5,24($fp)
	lw	$6,0($2)
	lw	$7,4($2)
	la	$25,printf
	jal	$31,$25
	lw	$2,24($fp)
	addu	$2,$2,1
	sw	$2,24($fp)
	b	$L20
$L19:
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
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
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC3
	lw	$6,40($fp)
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC2
	la	$25,fprintf
	jal	$31,$25
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	la	$25,freeInputArray
	jal	$31,$25
	li	$4,1			# 0x1
	la	$25,exit
	jal	$31,$25
	.end	raiseError
	.size	raiseError, .-raiseError
	.rdata
	.align	2
$LC4:
	.ascii	"FGETC ERROR: I/O error\000"
	.text
	.align	2
	.globl	readLine
	.ent	readLine
readLine:
	.frame	$fp,64,$31		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$31,56($sp)
	sw	$fp,52($sp)
	sw	$28,48($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	li	$2,10			# 0xa
	sw	$2,24($fp)
	sw	$0,36($fp)
	move	$4,$0
	lw	$5,24($fp)
	la	$25,realloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L26
	lw	$2,28($fp)
	sw	$2,40($fp)
	b	$L25
$L26:
	.set	noreorder
	nop
	.set	reorder
$L27:
	lw	$4,64($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,32($fp)
	lw	$3,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L28
	lw	$3,32($fp)
	li	$2,10			# 0xa
	bne	$3,$2,$L29
	b	$L28
$L29:
	addu	$5,$fp,36
	lw	$3,0($5)
	move	$4,$3
	lw	$2,28($fp)
	addu	$4,$4,$2
	lbu	$2,32($fp)
	sb	$2,0($4)
	addu	$3,$3,1
	sw	$3,0($5)
	lw	$3,36($fp)
	lw	$2,24($fp)
	bne	$3,$2,$L27
	lw	$2,24($fp)
	addu	$2,$2,16
	sw	$2,24($fp)
	lw	$4,28($fp)
	move	$5,$2
	la	$25,realloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L27
	lw	$2,28($fp)
	sw	$2,40($fp)
	b	$L25
$L28:
	lhu	$2,__sF+12
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L33
	lw	$4,28($fp)
	la	$25,free
	jal	$31,$25
	la	$4,$LC4
	la	$25,raiseError
	jal	$31,$25
$L33:
	addu	$5,$fp,36
	lw	$3,0($5)
	move	$4,$3
	lw	$2,28($fp)
	addu	$2,$4,$2
	sb	$0,0($2)
	addu	$3,$3,1
	sw	$3,0($5)
	lw	$4,28($fp)
	lw	$5,36($fp)
	la	$25,realloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	sw	$2,40($fp)
$L25:
	lw	$2,40($fp)
	move	$sp,$fp
	lw	$31,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$31
	.end	readLine
	.size	readLine, .-readLine
	.rdata
	.align	2
$LC5:
	.ascii	"%g%n\000"
	.align	2
$LC6:
	.ascii	"SSCANF ERROR: I/O error\000"
	.align	2
$LC7:
	.ascii	"No coincide dimension con cantidad de elementos ingresad"
	.ascii	"os\000"
	.align	2
$LC8:
	.ascii	"Input no numerico\000"
	.text
	.align	2
	.globl	readElementsInLine
	.ent	readElementsInLine
readElementsInLine:
	.frame	$fp,72,$31		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$31,64($sp)
	sw	$fp,60($sp)
	sw	$28,56($sp)
	move	$fp,$sp
	sw	$4,72($fp)
	sw	$5,76($fp)
	la	$4,__sF
	la	$25,readLine
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	sw	$2,28($fp)
	sw	$0,40($fp)
$L35:
	addu	$2,$fp,32
	addu	$3,$fp,36
	lw	$4,28($fp)
	la	$5,$LC5
	move	$6,$2
	move	$7,$3
	la	$25,sscanf
	jal	$31,$25
	sw	$2,44($fp)
	lhu	$2,__sF+12
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L38
	lw	$4,76($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	la	$4,$LC6
	la	$25,raiseError
	jal	$31,$25
$L38:
	lw	$3,44($fp)
	li	$2,1			# 0x1
	bne	$3,$2,$L39
	lw	$3,28($fp)
	lw	$2,36($fp)
	addu	$2,$3,$2
	sw	$2,28($fp)
	lw	$2,40($fp)
	sll	$3,$2,3
	lw	$2,76($fp)
	addu	$2,$3,$2
	l.s	$f0,32($fp)
	cvt.d.s	$f0,$f0
	s.d	$f0,0($2)
	lw	$2,40($fp)
	addu	$2,$2,1
	sw	$2,40($fp)
	b	$L35
$L39:
	lw	$3,44($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L40
	lw	$2,40($fp)
	sw	$2,48($fp)
	lw	$3,72($fp)
	lw	$2,72($fp)
	mult	$3,$2
	mflo	$2
	sll	$3,$2,1
	lw	$2,48($fp)
	beq	$2,$3,$L34
	lw	$4,76($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	la	$4,$LC7
	la	$25,raiseError
	jal	$31,$25
	b	$L34
$L40:
	lw	$3,44($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L35
	lw	$4,76($fp)
	la	$25,free
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	la	$4,$LC8
	la	$25,raiseError
	jal	$31,$25
$L34:
	move	$sp,$fp
	lw	$31,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$31
	.end	readElementsInLine
	.size	readElementsInLine, .-readElementsInLine
	.rdata
	.align	2
$LC9:
	.ascii	"%g\000"
	.align	2
$LC10:
	.ascii	"FSCANF ERROR: I/O error\000"
	.align	2
$LC11:
	.ascii	"Dimension no numerica\000"
	.align	2
$LC12:
	.ascii	"La dimension no es entera positiva\000"
	.align	2
$LC13:
	.ascii	"No se pudo allocar memoria para inputs\000"
	.text
	.align	2
	.globl	readInput
	.ent	readInput
readInput:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	la	$4,__sF
	la	$5,$LC9
	addu	$6,$fp,24
	la	$25,fscanf
	jal	$31,$25
	sw	$2,32($fp)
	lw	$3,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L44
	lhu	$2,__sF+12
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L45
	la	$4,$LC10
	la	$25,raiseError
	jal	$31,$25
	b	$L44
$L45:
	move	$4,$0
	la	$25,exit
	jal	$31,$25
$L44:
	lw	$3,32($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L47
	la	$4,$LC11
	la	$25,raiseError
	jal	$31,$25
$L47:
	l.s	$f0,24($fp)
	trunc.w.s $f0,$f0,$2
	cvt.s.w	$f2,$f0
	l.s	$f0,24($fp)
	sub.s	$f0,$f0,$f2
	s.s	$f0,36($fp)
	l.s	$f2,36($fp)
	mtc1	$0,$f0
	c.lt.s	$f0,$f2
	bc1t	$L49
	l.s	$f2,24($fp)
	mtc1	$0,$f0
	c.le.s	$f2,$f0
	bc1t	$L49
	b	$L48
$L49:
	la	$4,$LC12
	la	$25,raiseError
	jal	$31,$25
$L48:
	lw	$2,56($fp)
	l.s	$f0,24($fp)
	trunc.w.s $f0,$f0,$3
	s.s	$f0,0($2)
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,0($2)
	lw	$2,0($3)
	mult	$4,$2
	mflo	$2
	sll	$2,$2,4
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L50
	la	$4,$LC13
	la	$25,raiseError
	jal	$31,$25
$L50:
	lw	$2,56($fp)
	lw	$4,0($2)
	lw	$5,28($fp)
	la	$25,readElementsInLine
	jal	$31,$25
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	readInput
	.size	readInput, .-readInput
	.rdata
	.align	2
$LC14:
	.ascii	"\000"
	.space	99
	.align	2
$LC15:
	.ascii	"./\000"
	.align	2
$LC16:
	.ascii	"r\000"
	.align	2
$LC17:
	.ascii	"no se pudo abrir archivo de salida\000"
	.align	2
$LC18:
	.ascii	"%c\000"
	.align	2
$LC19:
	.ascii	"FPRINTF ERROR: I/O error\000"
	.text
	.align	2
	.globl	outputFile
	.ent	outputFile
outputFile:
	.frame	$fp,160,$31		# vars= 120, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 16
	sw	$31,152($sp)
	sw	$fp,148($sp)
	sw	$28,144($sp)
	move	$fp,$sp
	sw	$4,160($fp)
	sw	$5,164($fp)
	lbu	$2,$LC14
	sb	$2,24($fp)
	addu	$2,$fp,25
	li	$3,99			# 0x63
	move	$4,$2
	move	$5,$0
	move	$6,$3
	la	$25,memset
	jal	$31,$25
	addu	$4,$fp,24
	la	$5,$LC15
	la	$25,strcat
	jal	$31,$25
	addu	$4,$fp,24
	lw	$5,164($fp)
	la	$25,strcat
	jal	$31,$25
	addu	$4,$fp,24
	la	$5,$LC16
	la	$25,fopen
	jal	$31,$25
	sw	$2,132($fp)
	lw	$2,132($fp)
	bne	$2,$0,$L52
	la	$4,$LC17
	la	$25,raiseError
	jal	$31,$25
$L52:
	.set	noreorder
	nop
	.set	reorder
$L53:
	lb	$3,136($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L55
	b	$L54
$L55:
	lw	$3,132($fp)
	lw	$2,132($fp)
	lw	$2,4($2)
	addu	$2,$2,-1
	sw	$2,4($3)
	bgez	$2,$L56
	lw	$4,132($fp)
	la	$25,__srget
	jal	$31,$25
	sb	$2,137($fp)
	b	$L57
$L56:
	lw	$2,132($fp)
	lw	$3,0($2)
	move	$4,$3
	lbu	$4,0($4)
	sb	$4,137($fp)
	addu	$3,$3,1
	sw	$3,0($2)
$L57:
	lbu	$2,137($fp)
	sb	$2,136($fp)
	lb	$2,136($fp)
	lw	$4,160($fp)
	la	$5,$LC18
	move	$6,$2
	la	$25,fprintf
	jal	$31,$25
	sw	$2,128($fp)
	lw	$2,128($fp)
	bgez	$2,$L53
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
	b	$L53
$L54:
	lhu	$2,__sF+12
	srl	$2,$2,6
	andi	$2,$2,0x1
	beq	$2,$0,$L51
	la	$4,$LC4
	la	$25,raiseError
	jal	$31,$25
$L51:
	move	$sp,$fp
	lw	$31,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$31
	.end	outputFile
	.size	outputFile, .-outputFile
	.rdata
	.align	2
$LC20:
	.ascii	"no se pudo allocar memoria para matriz\000"
	.align	2
$LC21:
	.ascii	"no se pudo allocar memoria para elementos de matriz\000"
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$31		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,44($sp)
	sw	$fp,40($sp)
	sw	$28,36($sp)
	sw	$16,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
	li	$4,12			# 0xc
	la	$25,malloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L61
	la	$4,$LC20
	la	$25,raiseError
	jal	$31,$25
$L61:
	lw	$16,24($fp)
	lw	$3,52($fp)
	lw	$2,48($fp)
	mult	$3,$2
	mflo	$2
	sll	$2,$2,3
	move	$4,$2
	la	$25,malloc
	jal	$31,$25
	sw	$2,8($16)
	lw	$2,24($fp)
	lw	$2,8($2)
	bne	$2,$0,$L62
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	la	$4,$LC21
	la	$25,raiseError
	jal	$31,$25
$L62:
	lw	$3,24($fp)
	lw	$2,48($fp)
	sw	$2,0($3)
	lw	$3,24($fp)
	lw	$2,52($fp)
	sw	$2,4($3)
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	lw	$16,32($sp)
	addu	$sp,$sp,48
	j	$31
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	beq	$2,$0,$L63
	lw	$2,40($fp)
	lw	$4,8($2)
	la	$25,free
	jal	$31,$25
	lw	$4,40($fp)
	la	$25,free
	jal	$31,$25
$L63:
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.align	2
	.globl	fillUpMatrices
	.ent	fillUpMatrices
fillUpMatrices:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	sw	$5,28($fp)
	sw	$6,32($fp)
	sw	$7,36($fp)
	sw	$0,8($fp)
$L66:
	lw	$3,32($fp)
	lw	$2,32($fp)
	mult	$3,$2
	mflo	$3
	lw	$2,8($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L69
	b	$L67
$L69:
	lw	$4,24($fp)
	lw	$2,8($fp)
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$4,$3,$2
	lw	$2,8($fp)
	sll	$3,$2,3
	lw	$2,36($fp)
	addu	$2,$3,$2
	l.d	$f0,0($2)
	s.d	$f0,0($4)
	lw	$2,8($fp)
	addu	$2,$2,1
	sw	$2,8($fp)
	b	$L66
$L67:
	lw	$2,32($fp)
	lw	$3,32($fp)
	mult	$2,$3
	mflo	$2
	sw	$2,8($fp)
$L70:
	lw	$3,32($fp)
	lw	$2,32($fp)
	mult	$3,$2
	mflo	$2
	sll	$3,$2,1
	lw	$2,8($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L73
	b	$L65
$L73:
	lw	$4,28($fp)
	lw	$3,32($fp)
	lw	$2,32($fp)
	mult	$3,$2
	mflo	$3
	lw	$2,8($fp)
	subu	$2,$2,$3
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$4,$3,$2
	lw	$2,8($fp)
	sll	$3,$2,3
	lw	$2,36($fp)
	addu	$2,$3,$2
	l.d	$f0,0($2)
	s.d	$f0,0($4)
	lw	$2,8($fp)
	addu	$2,$2,1
	sw	$2,8($fp)
	b	$L70
$L65:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	fillUpMatrices
	.size	fillUpMatrices, .-fillUpMatrices
	.rdata
	.align	2
$LC22:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,64,$31		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$31,56($sp)
	sw	$fp,52($sp)
	sw	$28,48($sp)
	move	$fp,$sp
	sw	$4,64($fp)
	sw	$5,68($fp)
	lw	$2,68($fp)
	lw	$2,0($2)
	sw	$2,24($fp)
	lw	$4,64($fp)
	la	$5,$LC22
	lw	$6,24($fp)
	la	$25,fprintf
	jal	$31,$25
	sw	$2,44($fp)
	lw	$2,44($fp)
	bgez	$2,$L75
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
$L75:
	lw	$4,64($fp)
	la	$5,$LC18
	li	$6,32			# 0x20
	la	$25,fprintf
	jal	$31,$25
	sw	$2,44($fp)
	lw	$2,44($fp)
	bgez	$2,$L76
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
$L76:
	sw	$0,40($fp)
$L77:
	lw	$3,24($fp)
	lw	$2,24($fp)
	mult	$3,$2
	mflo	$3
	lw	$2,40($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L80
	b	$L78
$L80:
	lw	$4,68($fp)
	lw	$2,40($fp)
	sll	$3,$2,3
	lw	$2,8($4)
	addu	$2,$3,$2
	l.d	$f0,0($2)
	s.d	$f0,32($fp)
	lw	$4,64($fp)
	la	$5,$LC9
	lw	$6,32($fp)
	lw	$7,36($fp)
	la	$25,fprintf
	jal	$31,$25
	sw	$2,44($fp)
	lw	$2,44($fp)
	bgez	$2,$L81
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
$L81:
	lw	$4,64($fp)
	la	$5,$LC18
	li	$6,32			# 0x20
	la	$25,fprintf
	jal	$31,$25
	sw	$2,44($fp)
	lw	$2,44($fp)
	bgez	$2,$L79
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
$L79:
	lw	$2,40($fp)
	addu	$2,$2,1
	sw	$2,40($fp)
	b	$L77
$L78:
	lw	$4,64($fp)
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	sw	$2,44($fp)
	lw	$2,44($fp)
	bgez	$2,$L74
	la	$4,$LC19
	la	$25,raiseError
	jal	$31,$25
$L74:
	move	$sp,$fp
	lw	$31,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$31
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.rdata
	.align	2
$LC23:
	.ascii	"-h\000"
	.align	2
$LC24:
	.ascii	"--help\000"
	.align	2
$LC25:
	.ascii	"help\000"
	.align	2
$LC26:
	.ascii	"-V\000"
	.align	2
$LC27:
	.ascii	"--version\000"
	.align	2
$LC28:
	.ascii	"version\000"
	.align	2
$LC29:
	.ascii	"command parameter invalid\000"
	.align	2
$LC30:
	.ascii	"rows: %d\n\000"
	.align	2
$LC31:
	.ascii	"cols: %d\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,80,$31		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$31,72($sp)
	sw	$fp,68($sp)
	sw	$28,64($sp)
	move	$fp,$sp
	sw	$4,80($fp)
	sw	$5,84($fp)
	la	$2,__sF+88
	sw	$2,24($fp)
	sb	$0,28($fp)
	lw	$2,80($fp)
	slt	$2,$2,2
	bne	$2,$0,$L85
	lw	$2,84($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC23
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L87
	lw	$2,84($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC24
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L86
$L87:
	lw	$2,$LC25
	sw	$2,32($fp)
	lbu	$2,$LC25+4
	sb	$2,36($fp)
	addu	$2,$fp,32
	lw	$4,24($fp)
	move	$5,$2
	la	$25,outputFile
	jal	$31,$25
	li	$2,1			# 0x1
	sb	$2,28($fp)
	b	$L85
$L86:
	lw	$2,84($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC26
	la	$25,strcmp
	jal	$31,$25
	beq	$2,$0,$L90
	lw	$2,84($fp)
	addu	$2,$2,4
	lw	$4,0($2)
	la	$5,$LC27
	la	$25,strcmp
	jal	$31,$25
	bne	$2,$0,$L89
$L90:
	lw	$2,$LC28
	sw	$2,40($fp)
	lw	$2,$LC28+4
	sw	$2,44($fp)
	addu	$2,$fp,40
	lw	$4,24($fp)
	move	$5,$2
	la	$25,outputFile
	jal	$31,$25
	li	$2,1			# 0x1
	sb	$2,28($fp)
	b	$L85
$L89:
	la	$4,$LC29
	la	$25,raiseError
	jal	$31,$25
$L85:
	.set	noreorder
	nop
	.set	reorder
$L92:
	lbu	$2,28($fp)
	beq	$2,$0,$L94
	b	$L93
$L94:
	addu	$2,$fp,60
	move	$4,$2
	la	$25,readInput
	jal	$31,$25
	sw	$2,input
	lw	$4,60($fp)
	lw	$5,60($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,48($fp)
	lw	$4,60($fp)
	lw	$5,60($fp)
	la	$25,create_matrix
	jal	$31,$25
	sw	$2,52($fp)
	lw	$4,48($fp)
	lw	$5,52($fp)
	lw	$6,60($fp)
	lw	$7,input
	la	$25,fillUpMatrices
	jal	$31,$25
	lw	$4,48($fp)
	lw	$5,52($fp)
	la	$25,matrix_multiply
	jal	$31,$25
	sw	$2,56($fp)
	lw	$2,56($fp)
	la	$4,$LC30
	lw	$5,0($2)
	la	$25,printf
	jal	$31,$25
	lw	$2,56($fp)
	la	$4,$LC31
	lw	$5,4($2)
	la	$25,printf
	jal	$31,$25
	lw	$3,60($fp)
	lw	$2,60($fp)
	mult	$3,$2
	mflo	$2
	lw	$3,56($fp)
	move	$4,$2
	lw	$5,8($3)
	la	$25,printArray
	jal	$31,$25
	lw	$4,48($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,52($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	lw	$4,56($fp)
	la	$25,destroy_matrix
	jal	$31,$25
	la	$25,freeInputArray
	jal	$31,$25
	b	$L92
$L93:
	move	$2,$0
	move	$sp,$fp
	lw	$31,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
