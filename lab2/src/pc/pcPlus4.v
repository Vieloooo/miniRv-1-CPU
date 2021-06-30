module pcP4 (
    input pc,
    output reg pc4
);
always @(*) begin
    pc4 = pc+4;
end
    
endmodule