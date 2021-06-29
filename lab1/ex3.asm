ori a0,x0,100 # led1 loop times const 
ori a1,x0,100 # lea2 loop times const 
ori a2,x0,100 # led3 loop times const 
ori a3,x0,1     # const 1
lui a3,0xFFFFF
loop1:
#init led1
add s0,x0,x0
ori s3,x0,0x8000
ori s4,x0,0x1
led1:
## send s3,s4 into led 
andi s5,s4,0xF
slli s5,s5,12
or s5,s5,s3
sw s5,0x60(a3)
srai s5,s4,4
sw s5,0x60(a3)
#flash method1
andi s6,s3,1
beq s6,a3,turnoff
srli s3,s3,1
ori s3,s3,0x
turnoff:


#--------finish update,start to delay 0.5s 



addi s0,s0,1
jal led1

loop2:
add s1,x0,x0
led2:
bgt s1,a1,loop3
#flash method2
addi s1,s1,1
jal led2



loop3:
add s2,x0,x0
led3:
bgt s2,a2,loop1
#flash method3
addi s2,s2,1
jal led3
