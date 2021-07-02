module pcControl (
    input [31:0] ins,
    input halt,
    output en
);
    always @(input) begin
        if (halt) en = 'b0;
        if (input == 'b0) begin
            en = 0;
        end else begin
            en = 1 ;
        end
    end
endmodule