module pcControl (
    input [31:0] ins,
    output en
);
    always @(input) begin
        if (input == 'b0) begin
            en = 0;
        end else begin
            en = 1 ;
        end
    end
endmodule