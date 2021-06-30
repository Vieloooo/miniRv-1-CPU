//pc_sel 1 aluc, 0 pc+4 
module pcSel (
    input pc_sel,
    input [31:0] aluc,
    input [31:0] pc4,
    output [31:0]  npc
);
assign npc = pc_sel ? aluc:pc4;
endmodule