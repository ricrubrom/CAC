ORG 1000H
CHAR DB "AEIOUP"
VOC DB "AaEeIiOoUu"
FINAL DB ?

ORG 3000H
ES_VOCAL: MOV BX, OFFSET VOC
FOR: CMP BX, OFFSET FINAL
JZ FIN
CMP AH,[BX]
JNZ SIG
MOV CL, 0FFH
JMP FIN
SIG: INC BX
JMP FOR
FIN: RET

VOCALES: NOP
FOR2: CMP BX, OFFSET VOC
JZ FIN2
MOV AH, [BX]
PUSH BX
MOV CL, 0
CALL ES_VOCAL
POP BX
CMP CL, 0FFH
JNZ SIG2
INC AL
SIG2: INC BX
JMP FOR2
FIN2: RET

ORG 2000H
MOV AL, 0
MOV CX, 0
MOV BX, OFFSET CHAR
CALL VOCALES
HLT
END