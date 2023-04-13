PIC EQU 20H
EOI EQU 20H
N_F10 EQU 10

ORG 40
IP_F10 DW RUT_F10

ORG 1000H
NUM DB ?
ORG 3000H
RUT_F10: PUSH AX
MOV NUM, AX
MOV BX, OFFSET NUM
MOV AL, 1
INT 7
MOV AL, EOI
OUT PIC, AL
POP AX
INT 0
IRET

ORG 2000H
CLI
MOV AL, 0FEH
OUT PIC+1, AL ; PIC: registro IMR
MOV AL, N_F10
OUT PIC+4, AL ; PIC: registro INT0
MOV DX, 0
MOV AX, 41H
STI

MOV DX, 5AH
LAZO: MOV AX, 41H
SIGO: CMP DX, AX
JS LAZO
INC AX
JMP SIGO
HLT
END