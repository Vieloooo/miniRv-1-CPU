add x1,x2,x3
sub x1,x3,x0
and x1,x2,x3
or x1,x2,x3
xor x1,x3,x0
sll x1,x2,x3
srl x1,x2,x3
sra x1,x3,x0
slt x1,x2,x3
sltu x1,x2,x3
loop1:
addi x1,x2,1
andi x1,x2,1
ori x1,x2,1
xori x1,x3,1
slli x1,x2,1
srli x1,x2,1
srai x1,x3,1
slti x1,x2,1
sltiu x1,x2,1
# lw x1,0x00(x0)
# jalr x2,0(x0)
# 