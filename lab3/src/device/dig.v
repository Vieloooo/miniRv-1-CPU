module dig (
    input clk,
    input [32:0] data,
    input en,
    output  [7:0] r1,
    output  [7:0] r2,
    output  [7:0] r3,
    output  [7:0] r4
);
    reg [32:0] mydig =0;
    always @(posedge clk) begin
        if(en) mydig <= data;
        else mydig <= mydig;
    end
    assign r4 = mydig[7:0];
    assign r3 = mydig[15:8];
    assign r2 = mydig[23:16];
    assign r1 = mydig[31:24];
endmodule