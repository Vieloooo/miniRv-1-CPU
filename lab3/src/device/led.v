module led (
    input clk,
    input [31:0] data,
    input en,
    output reg [23:0] lights
);
    always @(posedge clk) begin
        if (en) lights <= data[23:0];
        else lights <= lights;
    end
endmodule