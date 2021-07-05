// it seems that address in vivado divided by instructions 
module sim_pc_irom ();
  reg clk = 'b0;
  wire [31:0] pc,npc,ins;
  wire en;
  always #10 clk = ~clk;
  pcP4 apc4(pc,npc);
  irom sim_irom(pc,ins);
  regPc apc(clk,en,npc,pc);
  pcControl apcc(ins,'b0,en);

endmodule