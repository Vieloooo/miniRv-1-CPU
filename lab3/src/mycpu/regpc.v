module regpc(clk,rst,npc,apc,halt);
    input clk;
    input rst;
    input [31:0] npc;
    output  [31:0] apc;
    input halt;
    reg [31:0] pc='b0;
    assign apc = pc;
    
    always @(posedge clk ) begin
        if (rst=='b0) pc <= 32'h0;
        else begin
            if (halt) pc <= pc;
            else pc <= npc; 
        end  
    end
endmodule
