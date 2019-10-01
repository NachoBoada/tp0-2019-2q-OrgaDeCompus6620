
PRELIMINARES
==========================
Organice las carpetas y archivos para separar lo de antes de entregar de lo de ahora

Actualice el ToDo



SOBRE PERDIDA DE MEMORIA EN GENERAL
==========================
Puse como global double* input

Agrege una funcion freeInputArray()

Agrege que en raiseError() antes de hacer exit() ejecute freeInputArray()



CORECCION 1
==========================
En readLine() fuera del while agrege un if que chequea si ferror() es distinto de 0 y en tal caso llama a raiseError()

En outputFile() hago lo mismo

Dentro del if que agregue en readLine() y antes de llamar a raiseError() libero el puntero a str a memoria alocada porque se que despues, cuando llame a raiseError(), el programa se va a cortar



CORRECCION 2
==========================
En readElementsInLine() agregue char* head_line_pointer = line; porque de lo contrario perdiamos la referencia a line al sumarle el offset.

Dentro del while de readElementsInLine() cambie los "line" por "head_line_pointer"

En readElementsInLine() antes de tirar error agregue free(line); porque antes no lo haciamos y perdiamos la memoria alocada por readLine()



CORRECCION 3
==========================
En readElementsInLine() veo si el EOF de fscanf se debia a un error o no con la funcion ferror().



CORRECCION 4
==========================
AgEn la funcion print_matrix() y en la funcion outputFile() agrego la variable return_value

En la funcion print_matrix() y en la funcion outputFile() se cambian todos los fprintf por:
if ((return_value = fprintf(out,"%c",' ')) < 0){raiseError("FPRINTF ERROR: I/O error");} 
validando que si el return_value es negativo es un error segun la documentacion


VARIOS
==========================
Agregue para que cuando uno ingresa un parametro de comando invalido tire error

Se agrega if (ferror(stdin) != 0){{raiseError("SSCANF ERROR: I/O error");}} abajo del sscanf en readElementsInLine()

