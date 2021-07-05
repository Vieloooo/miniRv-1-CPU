module regPc(clk,en,npc,apc);
    input clk;
    input en;
    input [31:0] npc;
    output  [31:0] apc;
    assign apc = pc;
    reg [31:0] pc='b0;
    always @(posedge clk) begin
        if (en)begin
            pc = npc;
        end else begin
            pc =0;
        end
    end

endmodule
