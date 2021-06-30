module regPc(clk,en,npc,pc);
    input clk;
    input en;
    input [31:0] npc;
    output reg pc[31:0];
    always @(posedge clk) begin
        if (en)begin
            pc <= npc;
        end else begin
            pc <=0;
        end
    end

endmodule
