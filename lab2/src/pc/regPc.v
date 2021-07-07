module regPc(clk,en,rst,npc,apc);
    input clk;
    input en;
    input rst;
    input [31:0] npc;
    output  [31:0] apc;
    reg [31:0] pc='b0;
    assign apc = pc;
    
    always @(posedge clk) begin
        if (rst=='b0) pc = 0;
        else begin
            if (en) pc = npc;
            else pc = pc;
        end  
    end
endmodule
