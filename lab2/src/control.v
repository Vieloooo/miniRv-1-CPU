module control (
    input [31:0] ins,
    input breq,
    input brlt,
    output pc_sel,
    output [1:0] wb_sel,
    output reg [2:0] imm_op,
    output reg rf.wen,
    output reg brun,
    output reg [2:0] alu_op,
    output alua_sel,
    output alub_sel
);
// handle pc 
    
endmodule