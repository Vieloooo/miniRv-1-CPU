module pcP4 (
    input [31:0] pc,
    output [31:0] npc
);
reg [31:0] pc4;
assign npc = pc4;
always @(*) begin
    pc4 = pc+4;
end
    
endmodule