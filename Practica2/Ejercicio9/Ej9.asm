ORG 1000H
MSJ1 DB "ACCESO PERMITIDO"
MSJ2 DB "ACCESO DENEGADO"
CLAVE DB "1234"

ORG 1500H
DATO DB ?
DB ?
DB ?
DB ? 



ORG 2000H
MOV BX, OFFSET DATO
INT 6
MOV CH, [BX]
INC BX
INT 6
MOV CL, [BX]
INC BX
INT 6
MOV DH, [BX]
INC BX
INT 6
MOV DL, [BX]

MOV BX, OFFSET CLAVE
CMP CH, [BX]
JNZ DENEGADO
INC BX
CMP CL, [BX]
JNZ DENEGADO
INC BX
CMP DH, [BX]
JNZ DENEGADO
INC BX
CMP DL, [BX]
JNZ DENEGADO
PERMITIDO: MOV BX, OFFSET MSJ1
MOV AL, OFFSET MSJ2-OFFSET MSJ1
INT 7
JMP FIN
DENEGADO: MOV BX, OFFSET MSJ2
MOV AL, OFFSET CLAVE-OFFSET MSJ2
INT 7
FIN: HLT
END