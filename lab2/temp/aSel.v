module alua_Sel (
    input [31:0] pc,
    input [31:0] data1,
    input alua_sel,
    output [31:0] alua
);
    assign alua = alua_sel ? data1:pc; // 1 data1, 0 pc 
endmodule