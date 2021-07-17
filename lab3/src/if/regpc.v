module regpc(clk,rst,npc,apc);
    input clk;
    input rst;
    input [31:0] npc;
    output  [31:0] apc;
    reg [31:0] pc='b0;
    assign apc = pc;
    
    always @(posedge clk ) begin
        if (rst=='b0) pc <= 0;
        else begin
            pc <= npc; 
        end  
    end
endmodule
