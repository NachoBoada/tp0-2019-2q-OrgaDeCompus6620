        .file   1 "tp1.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .rdata
        .align  2
$LC0:
        .ascii  "elemento %d: %g\n\000"
        .text
        .align  2
        .globl  printArray
        .ent    printArray
printArray:
        .frame  $fp,48,$ra              # vars= 8, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,48
        .cprestore 16
        sw      $ra,40($sp)
        sw      $fp,36($sp)
        sw      $gp,32($sp)
        move    $fp,$sp
        sw      $a0,48($fp)
        sw      $a1,52($fp)
        sw      $zero,24($fp)
$L18:
        lw      $v0,24($fp)
        lw      $v1,48($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L21
        b       $L17
$L21:
        lw      $v0,24($fp)
        sll     $v1,$v0,3
        lw      $v0,52($fp)
        addu    $v0,$v1,$v0
        la      $a0,$LC0
        lw      $a1,24($fp)
        lw      $a2,0($v0)
        lw      $a3,4($v0)
        la      $t9,printf
        jal     $ra,$t9
        lw      $v0,24($fp)
        addu    $v0,$v0,1
        sw      $v0,24($fp)
        b       $L18
$L17:
        move    $sp,$fp
        lw      $ra,40($sp)
        lw      $fp,36($sp)
        addu    $sp,$sp,48
        j       $ra
        .end    printArray
        .size   printArray, .-printArray
        .align  2
        .globl  destroy_matrix
        .ent    destroy_matrix
destroy_matrix:
        .frame  $fp,40,$ra              # vars= 0, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,40
        .cprestore 16
        sw      $ra,32($sp)
        sw      $fp,28($sp)
        sw      $gp,24($sp)
        move    $fp,$sp
        sw      $a0,40($fp)
        lw      $v0,40($fp)
        beq     $v0,$zero,$L22
        lw      $v0,40($fp)
        lw      $a0,8($v0)
        la      $t9,myfree
        jal     $ra,$t9
        lw      $a0,40($fp)
        la      $t9,myfree
        jal     $ra,$t9
$L22:
        move    $sp,$fp
        lw      $ra,32($sp)
        lw      $fp,28($sp)
        addu    $sp,$sp,40
        j       $ra
        .end    destroy_matrix
        .size   destroy_matrix, .-destroy_matrix
        .rdata
        .align  2
$LC1:
        .ascii  "\n\000"
        .align  2
$LC2:
        .ascii  "=======================\n\000"
        .align  2
$LC3:
        .ascii  "ERROR MESSAGE: %s\n\000"
        .text
        .align  2
        .globl  raiseError
        .ent    raiseError
raiseError:
        .frame  $fp,40,$ra              # vars= 0, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,40
        .cprestore 16
        sw      $ra,32($sp)
        sw      $fp,28($sp)
        sw      $gp,24($sp)
        move    $fp,$sp
        sw      $a0,40($fp)
        la      $a0,__sF+176
        la      $a1,$LC1
        la      $t9,fprintf
        jal     $ra,$t9
        la      $a0,__sF+176
        la      $a1,$LC2
        la      $t9,fprintf
        jal     $ra,$t9
        la      $a0,__sF+176
        la      $a1,$LC3
        lw      $a2,40($fp)
        la      $t9,fprintf
        jal     $ra,$t9
        la      $a0,__sF+176
        la      $a1,$LC2
        la      $t9,fprintf
        jal     $ra,$t9
        la      $a0,__sF+176
        la      $a1,$LC1
        la      $t9,fprintf
        jal     $ra,$t9
        move    $sp,$fp
        lw      $ra,32($sp)
        lw      $fp,28($sp)
        addu    $sp,$sp,40
        j       $ra
        .end    raiseError
        .size   raiseError, .-raiseError
        .rdata
        .align  2
$LC4:
        .ascii  "REALLOC ERROR: null pointer returned\000"
        .align  2
$LC5:
        .ascii  "FGETC ERROR: I/O error\000"
        .text
        .align  2
        .globl  readLine
        .ent    readLine
readLine:
        .frame  $fp,64,$ra              # vars= 24, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,64
        .cprestore 16
        sw      $ra,56($sp)
        sw      $fp,52($sp)
        sw      $gp,48($sp)
        move    $fp,$sp
        sw      $a0,64($fp)
        sw      $a1,68($fp)
        li      $v0,10                  # 0xa
        sw      $v0,24($fp)
        sw      $zero,28($fp)
        sw      $zero,32($fp)
        sw      $zero,40($fp)
        move    $a0,$zero
        lw      $a1,24($fp)
        la      $t9,realloc
        jal     $ra,$t9
        sw      $v0,28($fp)
        lw      $v0,28($fp)
        bne     $v0,$zero,$L28
        lw      $a0,68($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC4
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,32($fp)
        sw      $v0,44($fp)
        b       $L25
$L28:
        lw      $a0,64($fp)
        la      $t9,fgetc
        jal     $ra,$t9
        sw      $v0,36($fp)
        lw      $v1,36($fp)
        li      $v0,-1                  # 0xffffffffffffffff
        beq     $v1,$v0,$L27
        lw      $v1,36($fp)
        li      $v0,10                  # 0xa
        bne     $v1,$v0,$L30
        b       $L27
$L30:
        addu    $a1,$fp,40
        lw      $v1,0($a1)
        move    $a0,$v1
        lw      $v0,28($fp)
        addu    $a0,$a0,$v0
        lbu     $v0,36($fp)
        sb      $v0,0($a0)
        addu    $v1,$v1,1
        sw      $v1,0($a1)
        lw      $v1,40($fp)
        lw      $v0,24($fp)
        bne     $v1,$v0,$L28
        lw      $v0,24($fp)
        addu    $v0,$v0,16
        sw      $v0,24($fp)
        lw      $a0,28($fp)
        move    $a1,$v0
        la      $t9,realloc
        jal     $ra,$t9
        sw      $v0,28($fp)
        lw      $v0,28($fp)
        bne     $v0,$zero,$L28
        lw      $a0,28($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,68($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC4
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,32($fp)
        sw      $v0,44($fp)
        b       $L25
$L27:
        lhu     $v0,__sF+12
        srl     $v0,$v0,6
        andi    $v0,$v0,0x1
        beq     $v0,$zero,$L34
        lw      $a0,28($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,68($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC5
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,32($fp)
        sw      $v0,44($fp)
        b       $L25
$L34:
        addu    $a1,$fp,40
        lw      $v1,0($a1)
        move    $a0,$v1
        lw      $v0,28($fp)
        addu    $v0,$a0,$v0
        sb      $zero,0($v0)
        addu    $v1,$v1,1
        sw      $v1,0($a1)
        lw      $a0,28($fp)
        lw      $a1,40($fp)
        la      $t9,realloc
        jal     $ra,$t9
        sw      $v0,28($fp)
        lw      $v0,28($fp)
        bne     $v0,$zero,$L35
        lw      $a0,28($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,68($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC4
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,32($fp)
        sw      $v0,44($fp)
        b       $L25
$L35:
        lw      $v0,28($fp)
        sw      $v0,44($fp)
$L25:
        lw      $v0,44($fp)
        move    $sp,$fp
        lw      $ra,56($sp)
        lw      $fp,52($sp)
        addu    $sp,$sp,64
        j       $ra
        .end    readLine
        .size   readLine, .-readLine
        .rdata
        .align  2
$LC6:
        .ascii  "%g%n\000"
        .align  2
$LC7:
        .ascii  "SSCANF ERROR: I/O error\000"
        .align  2
$LC8:
        .ascii  "La cantidad de numeros es mayor a lo especificado segun "
        .ascii  "la dimension\000"
        .align  2
$LC9:
        .ascii  "La cantidad de numeros es menor a lo especificado segun "
        .ascii  "la dimension\000"
        .align  2
$LC10:
        .ascii  "Input no numerico\000"
        .text
        .align  2
        .globl  readElementsInLine
        .ent    readElementsInLine
readElementsInLine:
        .frame  $fp,80,$ra              # vars= 40, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,80
        .cprestore 16
        sw      $ra,72($sp)
        sw      $fp,68($sp)
        sw      $gp,64($sp)
        move    $fp,$sp
        sw      $a0,80($fp)
        sw      $a1,84($fp)
        la      $a0,__sF
        lw      $a1,84($fp)
        la      $t9,readLine
        jal     $ra,$t9
        sw      $v0,24($fp)
        lw      $v0,24($fp)
        sw      $v0,28($fp)
        sw      $zero,40($fp)
        sw      $zero,48($fp)
        li      $v0,1                   # 0x1
        sw      $v0,52($fp)
$L37:
        addu    $v0,$fp,32
        addu    $v1,$fp,36
        lw      $a0,28($fp)
        la      $a1,$LC6
        move    $a2,$v0
        move    $a3,$v1
        la      $t9,sscanf
        jal     $ra,$t9
        sw      $v0,44($fp)
        lhu     $v0,__sF+12
        srl     $v0,$v0,6
        andi    $v0,$v0,0x1
        beq     $v0,$zero,$L40
        lw      $a0,84($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,24($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC7
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,52($fp)
        sw      $v0,56($fp)
        b       $L36
$L40:
        lw      $v1,44($fp)
        li      $v0,1                   # 0x1
        bne     $v1,$v0,$L41
        lw      $v1,28($fp)
        lw      $v0,36($fp)
        addu    $v0,$v1,$v0
        sw      $v0,28($fp)
        lw      $v0,40($fp)
        sll     $v1,$v0,3
        lw      $v0,84($fp)
        addu    $v0,$v1,$v0
        l.s     $f0,32($fp)
        cvt.d.s $f0,$f0
        s.d     $f0,0($v0)
        lw      $v0,40($fp)
        addu    $v0,$v0,1
        sw      $v0,40($fp)
        lw      $v1,80($fp)
        lw      $v0,80($fp)
        mult    $v1,$v0
        mflo    $v0
        sll     $v1,$v0,1
        lw      $v0,40($fp)
        slt     $v0,$v1,$v0
        beq     $v0,$zero,$L37
        lw      $a0,84($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,24($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC8
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,52($fp)
        sw      $v0,56($fp)
        b       $L36
$L41:
        lw      $v1,44($fp)
        li      $v0,-1                  # 0xffffffffffffffff
        bne     $v1,$v0,$L43
        lw      $v0,40($fp)
        sw      $v0,48($fp)
        lw      $v1,80($fp)
        lw      $v0,80($fp)
        mult    $v1,$v0
        mflo    $v0
        sll     $v1,$v0,1
        lw      $v0,48($fp)
        beq     $v0,$v1,$L38
        lw      $a0,84($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,24($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC9
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,52($fp)
        sw      $v0,56($fp)
        b       $L36
$L43:
        lw      $v1,44($fp)
        li      $v0,1                   # 0x1
        beq     $v1,$v0,$L37
        lw      $a0,84($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,24($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC10
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,52($fp)
        sw      $v0,56($fp)
        b       $L36
$L38:
        lw      $a0,24($fp)
        la      $t9,free
        jal     $ra,$t9
        sw      $zero,56($fp)
$L36:
        lw      $v0,56($fp)
        move    $sp,$fp
        lw      $ra,72($sp)
        lw      $fp,68($sp)
        addu    $sp,$sp,80
        j       $ra
        .end    readElementsInLine
        .size   readElementsInLine, .-readElementsInLine
        .rdata
        .align  2
$LC11:
        .ascii  "%g\000"
        .align  2
$LC12:
        .ascii  "FSCANF ERROR: I/O error\000"
        .align  2
$LC13:
        .ascii  "Dimension no numerica\000"
        .align  2
$LC14:
        .ascii  "La dimension no es entera positiva\000"
        .align  2
$LC15:
        .ascii  "No se pudo allocar memoria para inputs\000"
        .text
        .align  2
        .globl  readInput
        .ent    readInput
readInput:
        .frame  $fp,64,$ra              # vars= 24, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,64
        .cprestore 16
        sw      $ra,56($sp)
        sw      $fp,52($sp)
        sw      $gp,48($sp)
        move    $fp,$sp
        sw      $a0,64($fp)
        sw      $zero,28($fp)
        sw      $zero,36($fp)
        la      $a0,__sF
        la      $a1,$LC11
        addu    $a2,$fp,24
        la      $t9,fscanf
        jal     $ra,$t9
        sw      $v0,32($fp)
        lw      $v1,32($fp)
        li      $v0,-1                  # 0xffffffffffffffff
        bne     $v1,$v0,$L47
        lhu     $v0,__sF+12
        srl     $v0,$v0,6
        andi    $v0,$v0,0x1
        beq     $v0,$zero,$L48
        la      $a0,$LC12
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L48:
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L47:
        lw      $v1,32($fp)
        li      $v0,1                   # 0x1
        beq     $v1,$v0,$L50
        la      $a0,$LC13
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L50:
        l.s     $f0,24($fp)
        trunc.w.s $f0,$f0,$v0
        cvt.s.w $f2,$f0
        l.s     $f0,24($fp)
        sub.s   $f0,$f0,$f2
        s.s     $f0,40($fp)
        l.s     $f2,40($fp)
        mtc1    $zero,$f0
        c.lt.s  $f0,$f2
        bc1t    $L52
        l.s     $f2,24($fp)
        mtc1    $zero,$f0
        c.le.s  $f2,$f0
        bc1t    $L52
        b       $L51
$L52:
        la      $a0,$LC14
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L51:
        lw      $v0,64($fp)
        l.s     $f0,24($fp)
        trunc.w.s $f0,$f0,$v1
        s.s     $f0,0($v0)
        lw      $v0,64($fp)
        lw      $v1,64($fp)
        lw      $a0,0($v0)
        lw      $v0,0($v1)
        mult    $a0,$v0
        mflo    $v0
        sll     $v0,$v0,4
        move    $a0,$v0
        la      $t9,malloc
        jal     $ra,$t9
        sw      $v0,28($fp)
        lw      $v0,28($fp)
        bne     $v0,$zero,$L53
        la      $a0,$LC15
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L53:
        lw      $v0,64($fp)
        lw      $a0,0($v0)
        lw      $a1,28($fp)
        la      $t9,readElementsInLine
        jal     $ra,$t9
        beq     $v0,$zero,$L54
        lw      $v0,36($fp)
        sw      $v0,44($fp)
        b       $L46
$L54:
        lw      $v0,28($fp)
        sw      $v0,44($fp)
$L46:
        lw      $v0,44($fp)
        move    $sp,$fp
        lw      $ra,56($sp)
        lw      $fp,52($sp)
        addu    $sp,$sp,64
        j       $ra
        .end    readInput
        .size   readInput, .-readInput
        .rdata
        .align  2
$LC16:
        .ascii  "\000"
        .space  99
        .align  2
$LC17:
        .ascii  "./\000"
        .align  2
$LC18:
        .ascii  "r\000"
        .align  2
$LC19:
        .ascii  "no se pudo abrir archivo de salida\000"
        .align  2
$LC20:
        .ascii  "%c\000"
        .align  2
$LC21:
        .ascii  "FPRINTF ERROR: I/O error\000"
        .text
        .align  2
        .globl  outputFile
        .ent    outputFile
outputFile:
        .frame  $fp,168,$ra             # vars= 128, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,168
        .cprestore 16
        sw      $ra,160($sp)
        sw      $fp,156($sp)
        sw      $gp,152($sp)
        move    $fp,$sp
        sw      $a0,168($fp)
        sw      $a1,172($fp)
        lbu     $v0,$LC16
        sb      $v0,24($fp)
        addu    $v0,$fp,25
        li      $v1,99                  # 0x63
        move    $a0,$v0
        move    $a1,$zero
        move    $a2,$v1
        la      $t9,memset
        jal     $ra,$t9
        addu    $a0,$fp,24
        la      $a1,$LC17
        la      $t9,strcat
        jal     $ra,$t9
        addu    $a0,$fp,24
        lw      $a1,172($fp)
        la      $t9,strcat
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,132($fp)
        addu    $a0,$fp,24
        la      $a1,$LC18
        la      $t9,fopen
        jal     $ra,$t9
        sw      $v0,136($fp)
        lw      $v0,136($fp)
        bne     $v0,$zero,$L56
        la      $a0,$LC19
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,132($fp)
        sw      $v0,144($fp)
        b       $L55
$L56:
        .set    noreorder
        nop
        .set    reorder
$L57:
        lb      $v1,140($fp)
        li      $v0,-1                  # 0xffffffffffffffff
        bne     $v1,$v0,$L59
        b       $L58
$L59:
        lw      $v1,136($fp)
        lw      $v0,136($fp)
        lw      $v0,4($v0)
        addu    $v0,$v0,-1
        sw      $v0,4($v1)
        bgez    $v0,$L60
        lw      $a0,136($fp)
        la      $t9,__srget
        jal     $ra,$t9
        sb      $v0,148($fp)
        b       $L61
$L60:
        lw      $v0,136($fp)
        lw      $v1,0($v0)
        move    $a0,$v1
        lbu     $a0,0($a0)
        sb      $a0,148($fp)
        addu    $v1,$v1,1
        sw      $v1,0($v0)
$L61:
        lbu     $v0,148($fp)
        sb      $v0,140($fp)
        lb      $v0,140($fp)
        lw      $a0,168($fp)
        la      $a1,$LC20
        move    $a2,$v0
        la      $t9,fprintf
        jal     $ra,$t9
        sw      $v0,128($fp)
        lw      $v0,128($fp)
        bgez    $v0,$L57
        la      $a0,$LC21
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,132($fp)
        sw      $v0,144($fp)
        b       $L55
$L58:
        lhu     $v0,__sF+12
        srl     $v0,$v0,6
        andi    $v0,$v0,0x1
        beq     $v0,$zero,$L63
        la      $a0,$LC5
        la      $t9,raiseError
        jal     $ra,$t9
        lw      $v0,132($fp)
        sw      $v0,144($fp)
        b       $L55
$L63:
        sw      $zero,144($fp)
$L55:
        lw      $v0,144($fp)
        move    $sp,$fp
        lw      $ra,160($sp)
        lw      $fp,156($sp)
        addu    $sp,$sp,168
        j       $ra
        .end    outputFile
        .size   outputFile, .-outputFile
        .align  2
        .globl  fillUpMatrices
        .ent    fillUpMatrices
fillUpMatrices:
        .frame  $fp,24,$ra              # vars= 8, regs= 2/0, args= 0, extra= 8
        .mask   0x50000000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,24
        .cprestore 0
        sw      $fp,20($sp)
        sw      $gp,16($sp)
        move    $fp,$sp
        sw      $a0,24($fp)
        sw      $a1,28($fp)
        sw      $a2,32($fp)
        sw      $a3,36($fp)
        sw      $zero,8($fp)
$L65:
        lw      $v1,32($fp)
        lw      $v0,32($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,8($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L68
        b       $L66
$L68:
        lw      $a0,24($fp)
        lw      $v0,8($fp)
        sll     $v1,$v0,3
        lw      $v0,8($a0)
        addu    $a0,$v1,$v0
        lw      $v0,8($fp)
        sll     $v1,$v0,3
        lw      $v0,36($fp)
        addu    $v0,$v1,$v0
        l.d     $f0,0($v0)
        s.d     $f0,0($a0)
        lw      $v0,8($fp)
        addu    $v0,$v0,1
        sw      $v0,8($fp)
        b       $L65
$L66:
        lw      $v0,32($fp)
        lw      $v1,32($fp)
        mult    $v0,$v1
        mflo    $v0
        sw      $v0,8($fp)
$L69:
        lw      $v1,32($fp)
        lw      $v0,32($fp)
        mult    $v1,$v0
        mflo    $v0
        sll     $v1,$v0,1
        lw      $v0,8($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L72
        b       $L64
$L72:
        lw      $a0,28($fp)
        lw      $v1,32($fp)
        lw      $v0,32($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,8($fp)
        subu    $v0,$v0,$v1
        sll     $v1,$v0,3
        lw      $v0,8($a0)
        addu    $a0,$v1,$v0
        lw      $v0,8($fp)
        sll     $v1,$v0,3
        lw      $v0,36($fp)
        addu    $v0,$v1,$v0
        l.d     $f0,0($v0)
        s.d     $f0,0($a0)
        lw      $v0,8($fp)
        addu    $v0,$v0,1
        sw      $v0,8($fp)
        b       $L69
$L64:
        move    $sp,$fp
        lw      $fp,20($sp)
        addu    $sp,$sp,24
        j       $ra
        .end    fillUpMatrices
        .size   fillUpMatrices, .-fillUpMatrices
        .rdata
        .align  2
$LC22:
        .ascii  "%d\000"
        .text
        .align  2
        .globl  print_matrix
        .ent    print_matrix
print_matrix:
        .frame  $fp,64,$ra              # vars= 24, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,64
        .cprestore 16
        sw      $ra,56($sp)
        sw      $fp,52($sp)
        sw      $gp,48($sp)
        move    $fp,$sp
        sw      $a0,64($fp)
        sw      $a1,68($fp)
        lw      $v0,68($fp)
        lw      $v0,0($v0)
        sw      $v0,24($fp)
        lw      $a0,64($fp)
        la      $a1,$LC22
        lw      $a2,24($fp)
        la      $t9,fprintf
        jal     $ra,$t9
        bgez    $v0,$L74
        li      $v0,1                   # 0x1
        sw      $v0,44($fp)
        b       $L73
$L74:
        lw      $a0,64($fp)
        la      $a1,$LC20
        li      $a2,32                  # 0x20
        la      $t9,fprintf
        jal     $ra,$t9
        bgez    $v0,$L75
        li      $v0,1                   # 0x1
        sw      $v0,44($fp)
        b       $L73
$L75:
        sw      $zero,40($fp)
$L76:
        lw      $v1,24($fp)
        lw      $v0,24($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,40($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L79
        b       $L77
$L79:
        lw      $a0,68($fp)
        lw      $v0,40($fp)
        sll     $v1,$v0,3
        lw      $v0,8($a0)
        addu    $v0,$v1,$v0
        l.d     $f0,0($v0)
        s.d     $f0,32($fp)
        lw      $a0,64($fp)
        la      $a1,$LC11
        lw      $a2,32($fp)
        lw      $a3,36($fp)
        la      $t9,fprintf
        jal     $ra,$t9
        bgez    $v0,$L80
        li      $v0,1                   # 0x1
        sw      $v0,44($fp)
        b       $L73
$L80:
        lw      $a0,64($fp)
        la      $a1,$LC20
        li      $a2,32                  # 0x20
        la      $t9,fprintf
        jal     $ra,$t9
        bgez    $v0,$L78
        li      $v0,1                   # 0x1
        sw      $v0,44($fp)
        b       $L73
$L78:
        lw      $v0,40($fp)
        addu    $v0,$v0,1
        sw      $v0,40($fp)
        b       $L76
$L77:
        lw      $a0,64($fp)
        la      $a1,$LC1
        la      $t9,fprintf
        jal     $ra,$t9
        bgez    $v0,$L82
        li      $v0,1                   # 0x1
        sw      $v0,44($fp)
        b       $L73
$L82:
        sw      $zero,44($fp)
$L73:
        lw      $v0,44($fp)
        move    $sp,$fp
        lw      $ra,56($sp)
        lw      $fp,52($sp)
        addu    $sp,$sp,64
        j       $ra
        .end    print_matrix
        .size   print_matrix, .-print_matrix
        .rdata
        .align  2
$LC23:
        .ascii  "-h\000"
        .align  2
$LC24:
        .ascii  "--help\000"
        .align  2
$LC25:
        .ascii  "help\000"
        .align  2
$LC26:
        .ascii  "-V\000"
        .align  2
$LC27:
        .ascii  "--version\000"
        .align  2
$LC28:
        .ascii  "version\000"
        .align  2
$LC29:
        .ascii  "command parameter invalid\000"
        .align  2
$LC30:
        .ascii  "No se pudo allocar memoria para elementos de matriz\000"
        .align  2
$LC31:
        .ascii  "No se pudo allocar memoria para elementos de matriz resu"
        .ascii  "ltante\000"
        .text
        .align  2
        .globl  main
        .ent    main
main:
        .frame  $fp,88,$ra              # vars= 48, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,88
        .cprestore 16
        sw      $ra,80($sp)
        sw      $fp,76($sp)
        sw      $gp,72($sp)
        move    $fp,$sp
        sw      $a0,88($fp)
        sw      $a1,92($fp)
        la      $v0,__sF+88
        sw      $v0,24($fp)
        sb      $zero,28($fp)
        lw      $v0,88($fp)
        slt     $v0,$v0,2
        bne     $v0,$zero,$L84
        lw      $v0,92($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC23
        la      $t9,strcmp
        jal     $ra,$t9
        beq     $v0,$zero,$L86
        lw      $v0,92($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC24
        la      $t9,strcmp
        jal     $ra,$t9
        bne     $v0,$zero,$L85
$L86:
        lw      $v0,$LC25
        sw      $v0,32($fp)
        lbu     $v0,$LC25+4
        sb      $v0,36($fp)
        addu    $v0,$fp,32
        lw      $a0,24($fp)
        move    $a1,$v0
        la      $t9,outputFile
        jal     $ra,$t9
        beq     $v0,$zero,$L87
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L87:
        li      $v0,1                   # 0x1
        sb      $v0,28($fp)
        b       $L84
$L85:
        lw      $v0,92($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC26
        la      $t9,strcmp
        jal     $ra,$t9
        beq     $v0,$zero,$L90
        lw      $v0,92($fp)
        addu    $v0,$v0,4
        lw      $a0,0($v0)
        la      $a1,$LC27
        la      $t9,strcmp
        jal     $ra,$t9
        bne     $v0,$zero,$L89
$L90:
        lw      $v0,$LC28
        sw      $v0,40($fp)
        lw      $v0,$LC28+4
        sw      $v0,44($fp)
        addu    $v0,$fp,40
        lw      $a0,24($fp)
        move    $a1,$v0
        la      $t9,outputFile
        jal     $ra,$t9
        beq     $v0,$zero,$L91
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L91:
        li      $v0,1                   # 0x1
        sb      $v0,28($fp)
        b       $L84
$L89:
        la      $a0,$LC29
        la      $t9,raiseError
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L84:
        sw      $zero,48($fp)
        sw      $zero,52($fp)
        sw      $zero,56($fp)
        sw      $zero,60($fp)
$L93:
        lbu     $v0,28($fp)
        beq     $v0,$zero,$L95
        b       $L94
$L95:
        addu    $v0,$fp,64
        move    $a0,$v0
        la      $t9,readInput
        jal     $ra,$t9
        sw      $v0,48($fp)
        lw      $v0,48($fp)
        bne     $v0,$zero,$L96
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L96:
        lw      $a0,64($fp)
        lw      $a1,64($fp)
        la      $t9,create_matrix
        jal     $ra,$t9
        sw      $v0,52($fp)
        lw      $v0,52($fp)
        bne     $v0,$zero,$L97
        lw      $a0,48($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC30
        la      $t9,raiseError
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L97:
        lw      $a0,64($fp)
        lw      $a1,64($fp)
        la      $t9,create_matrix
        jal     $ra,$t9
        sw      $v0,56($fp)
        lw      $v0,56($fp)
        bne     $v0,$zero,$L98
        lw      $a0,52($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,48($fp)
        la      $t9,free
        jal     $ra,$t9
        la      $a0,$LC30
        la      $t9,raiseError
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L98:
        lw      $a0,52($fp)
        lw      $a1,56($fp)
        lw      $a2,64($fp)
        lw      $a3,48($fp)
        la      $t9,fillUpMatrices
        jal     $ra,$t9
        lw      $a0,52($fp)
        lw      $a1,56($fp)
        la      $t9,matrix_multiply
        jal     $ra,$t9
        sw      $v0,60($fp)
        lw      $v0,60($fp)
        bne     $v0,$zero,$L99
        lw      $a0,48($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,52($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,56($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        la      $a0,$LC31
        la      $t9,raiseError
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L99:
        lw      $a0,24($fp)
        lw      $a1,60($fp)
        la      $t9,print_matrix
        jal     $ra,$t9
        beq     $v0,$zero,$L100
        lw      $a0,48($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,52($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,56($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,60($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        la      $a0,$LC21
        la      $t9,raiseError
        jal     $ra,$t9
        li      $v0,1                   # 0x1
        sw      $v0,68($fp)
        b       $L83
$L100:
        lw      $a0,48($fp)
        la      $t9,free
        jal     $ra,$t9
        lw      $a0,52($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,56($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        lw      $a0,60($fp)
        la      $t9,destroy_matrix
        jal     $ra,$t9
        b       $L93
$L94:
        sw      $zero,68($fp)
$L83:
        lw      $v0,68($fp)
        move    $sp,$fp
        lw      $ra,80($sp)
        lw      $fp,76($sp)
        addu    $sp,$sp,88
        j       $ra
        .end    main
        .size   main, .-main
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
