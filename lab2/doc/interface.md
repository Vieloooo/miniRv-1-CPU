# function unit interface

## pc

1. pc reg 32 bits
   ```
   input:
   1.  clk 
   2. wen
   output:
   1. currentpc
   ```
2. pc mux
   ```
   input:
   1. pc_sel:(pc+4,alu.c)
   2. pc+4
   3. alu.c 
   output:
   1. npc
   ```
3. pcPlus4 (combinational logic)
   1. input:
      1.currentpc
   2. output
      1. pc+4
4. ins control
   1. input : instruction
   2. output: pc.en

## IROM

1. com logic
2. input: currentpc
3. output 32 bits instructions Ins

## IMM-gen

1. input
   1. imm_op
      1. type:r,i,i-shift,s,b,u,uj
         1. r 0
         2. i 1
         3. is 2, ishift
         4. s 3 store
         5. b 4
         6. u 5 lui
         7. uj 6 jal
   2. Ins[31:7]
2. output
   1. 32bits imm

## reg file

1. combinational logic
2. input
   1. Ins[19:15] as rs1
   2. Ins[24:20] as rs2
   3. Ins[11:7] as w.addr
   4. w_en from control unit
   5. wdata from rfw.mux
3. output
   1. rf.data1 from addr rs1
   2. rf.data2 from addr rs2

## reg wb mux

1. comb logic
2. input
   1. wb sel
      1. pc+4	0
      2. alu		1
      3. dram.rd   >=2
   2. pc+4
   3. aul.c
   4. dram.rd
3. output: wdata

## alu mux

1. alu.a mux

   1. input
   2. pc.currentpc
   3. rf.data1
   4. alu.a sel
   5. output alu.a
2. alu.b mux

   1. input
      1. imm
      2. rf.data2
      3. alu.b.sel
   2. output : alu.b

## alu

1. input
   1. alu.a
   2. alu.b
   3. alu.op
2. output
   1. alu.c

## branch comp

1. input

   1. rf.data1
   2. rf.data2
   3. control.bun
2. output

   1. blt
   2. beq

## Dram

1. all comb
2. input
   1. addr from alu.c
   2. wen from control init
   3. w data from rf.data2
3. output
   1. dram.data
