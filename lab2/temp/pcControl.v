module pcControl (
    input [31:0] ins,
    input halt,
    output reg en
);
    always @(*) begin
        if (halt) en = 'b0;
        
        if (ins == 'b0) begin
            en = 'b0;
        end else begin
            en = 'b1 ;
        end
    end
endmodule