ori a0,x0,100 # led1 loop times const 
ori a1,x0,100 # lea2 loop times const 
ori a2,x0,150 # led3 loop times const 
ori a3,x0,1     # const 1
lui a4,0xFFFFF  #  address const 
addi a5,x0,1    
slli a5,a5,23   # const 0x800000
add a6,x0,x0	#flag
#--------const end ----------
#-------- loop 1 ------------------
loop1:
#init led1
add s0,x0,x0    #s0 is delay timer 
ori s4,x0,1     # s4 control upper 12 led lights 
slli s4,s4,11   
ori s3,x0,0x1   # s3 control bottom 12 leds 
led1:
# send s3,s4 signal to led 
andi s5,s4,0xF
slli s5,s5,12
or s5,s5,s3
sw s5,0x60(a4)
srli s5,s4,4
sw s5,0x62(a4)
## ----------control unit 1
## if all lights off 
beq s4,x0,loop2     # goto next flash method 
## if all lights are turned on
beq a6,a3,allon1
andi s5,s4,0x1
beq s5,a3,allon1
## if there are some lights off, update s3,s4 
slli s3,s3,1
ori s3,s3,1
srli s4,s4,1
addi s8,x0,0x1
slli s8,s8,11
or s4,s4,s8
jal delay1  ## goto delay 1 unit 
allon1:## if all lights have been turned on, just shift s3,s4
addi a6,x0,1
srli s3,s3,1
slli s4,s4,1
#--------finish update,start to delay 0.5s 
delay1:
bgt s0,a0,led1
addi s0,s0,1
jal delay1

#------------loop2 -------------
loop2:
# initialize led2
add s1,x0,x0
ori,s3,x0,1
slli s3,s3,23   #use s3 control all 24 leds 
led2:
##----send s3 into led 
or s4,s3,x0
sw s4,0x60(a4)
srli s4,s4,16
sw s4,0x62(a4)
## if all lights off 
beq s3,x0,loop3
## if all lights on 
andi s5,s3,1
beq s5,a3,allon2
## not all on
srli s3,s3,1
or s3,s3,a5
jal delay2
allon2:
srli s3,s3,1
delay2:
bgt s1,a1,led2
addi s1,s1,1
jal delay2

#-----------loop3--------------
loop3:
add s2,x0,x0
add s3,x0,x0
add s4,x0,x0
add s5,x0,x0
lw s3,0x70(a4)	#count in s3
## init led3 primitive lights 
enlight:
beq s5,s3,led3
srli,s4,s4,1
or s4,s4,a5
addi s5,s5,1
jal enlight
led3:
## send s4 to reg 
or s6,s4,x0
sw s6,0x60(a4)
srli s6,s6,16
sw s6,0x62(a4)
## if the end of the s4=1
andi s5,s4,1
beq s5,a3,loopshift
## if end is zero 
srli s4,s4,1
jal delay3
loopshift:
srli s4,s4,1
or s4,s4,a5
delay3:
bgt s2,a2,led3
addi s2,s2,1
jal delay3