lui s0,0xFFFFF
addi a0,x0,0x20     # save restart flag const 'b0010000
addi a1,x0,0x40     # const 'b01000000
addi a2,x0,0x80     #const 'b10000000
addi a3,x0,1       # const 1 
addi a4,x0,4        # const 4
restart:
#-------------control------
# load sw[3:0] in s1,sw[23,16] in s2
lw s1,0x70(s0)
lw s2,0x72(s0)
# handle sw21,22,23,use s3
andi s3,s2,0x20     # get sw21
beq s3,a0,restart # if sw21 = 1 , restart
andi s3,s2,0x40     # get sw22
beq s3,a1,xmx # if sw22 =1 ,go x*x 
andi s3,s2,0x80 # get sw23 
beq s3,a2,xmxmx # if sw23 =1 x*x 
jal restart     # if sw21,22,23 =0, restart 
#------- x*x -------#
xmx:
add s4,x0,x0    #counter 
add s5,x0,s1 # use s5 as mul
slli s6,s1,4 # s6 is basic, answer in s7
add s7,x0,x0
loop1:
bge s4,a4,end#if counter >= 4 goto end 
andi s8,s5,1    # get the end of the mul 
bne s8,a3,notmul1     # if the end of the mul = 1 
add s7,s7,s6       # add basic s6
notmul1:
srli s7,s7,1    #s7 >>1
srli s5,s5,1    #s5 >>1 
jal loop1
#---------x*x*x-----------
xmxmx:
add s4,x0,x0    #counter 
add s5,x0,s1 # use s5 as mul
slli s6,s1,4 # s6 is basic, answer in s7
add s7,x0,x0
loop2:
bge s4,a4,next  # finish cal x*x goto next to cal x*x*x
andi s8,s5,1
bne s8,a3,notMul2
add s7,s7,s6
notMul2:
srli s7,s7,1
srli s5,s5,1
jal loop2
next:   # x*x is in s7 
add s4,x0,x0    #counter 
add s5,x0,s1 # use s5 as mul
slli s6,s7,4 # s6 is basic, answer in s7
slli s7,s7,4
loop3:
bge s4,a4,end
andi s8,s5,1
bne s8,a3,notMul3
add s7,s7,s6
notMul3:
srli s7,s7,1
srli s5,s5,1
jal loop3
#---------------------
end:
# send s7 to led 
sw s7,0x60(s0)
loopread:
# read again 
lw s2,0x72(s0)
andi s3,s2,0x20
beq s3,a0,reset     # if sw21 =1 , 
jal loopread
#----------
reset:
add s1,x0,x0
add s2,x0,x0
add s3,x0,x0
add s4,x0,x0
add s5,x0,x0
add s6,x0,x0
add s7,x0,x0
add s8,x0,x0
sw s0,0x60(s0)
jal restart


