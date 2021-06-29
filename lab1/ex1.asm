lui s1,0xFFFFF
lw t1,0x70(s1)
andi a1,t1,0x00F                  #a1????????4¦Ë????
lw t2,0x72(s1)
andi a2,t2,0x80                   #a2???????????

add a3,a1,zero
addi a6,zero,4
LOOP2:
add t3,a1,zero
andi a4,a3,0x008
beq a4,zero,ZERO
addi s9,a6,-1
sll t6,t3,s9
add a5,a5,t6
ZERO:
addi a6,a6,-1
slli a3,a3,1
bne a6,zero,LOOP2			#a5?????????

add a3,a1,zero
addi a6,zero,4
LOOP3:
add a7,a5,zero
andi s2,a3,0x008
beq s2,zero,ZERO2
addi s9,a6,-1
sll t6,a7,s9
add s3,s3,t6
ZERO2:
addi a6,a6,-1
slli a3,a3,1
bne a6,zero,LOOP3			#s3??????????

bne a2,zero,Q3
lui s4,0x00200
addi s4,s4,0x000
sw a5,0x00(s4)
lui s5,0xFFFFF
addi s5,s5,0x060
sw a5,0x00(s5)
jal zero,EXIT
Q3:
lui s4,0x00200
addi s4,s4,0x000
sw s3,0x00(s4)
lui s5,0xFFFFF
addi s5,s5,0x060
sw s3,0x00(s5)
EXIT:
