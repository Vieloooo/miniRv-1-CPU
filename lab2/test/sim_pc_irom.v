// it seems that address in vivado divided by instructions 
module sim_pc_irom ();
  reg clk = 'b0;
  wire [31:0] pc,pc4,ins;
  wire en;
  always #10 clk = ~clk;
  pcP4 apc4(pc,pc4);
  irom sim_irom(pc,ins);
  regPc apc(clk,en,'b0,pc4,pc);
  pcControl apcc(ins,'b0,en);
  wire [2:0] pc_sel,wb_sel,imm_op,alu_op;
  control acu(ins,breq,brlt,pc_sel,wb_sel,imm_op,rf_en,burn,alu_op,asel,bsel);
endmodule