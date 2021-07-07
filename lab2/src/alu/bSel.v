module alub_Sel (
    input [31:0] imm,
    input [31:0] data2,
    input alub_sel,
    output [31:0] alub
);
    assign alub = alub_sel ? data2:imm;// 1 data2, 0 imm 
endmodule