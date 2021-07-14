module pc (
    input clk,
    input rst,
    input [31:0] xpc,
    input pc_sel,
    output [31:0] rpc
);
    wire [31:0] npc;
    assign npc = (~pc_sel) ? (rpc+4):xpc;
regpc aregpc(clk,rst,npc,rpc);
    
endmodule