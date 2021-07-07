module regPc(clk,en,rst,npc,apc);
    input clk;
    input en;
    input rst;
    input [31:0] npc;
    output  [31:0] apc;
    assign apc = pc;
    reg [31:0] pc='b0;
    always @(posedge clk) begin
        if (rst) pc = 0;
        else begin
            if (en) pc = npc;
            else pc = pc;
        end  
    end
endmodule
