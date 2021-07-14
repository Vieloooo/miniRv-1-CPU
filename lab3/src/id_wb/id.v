module id (
    input clk,
    input [4:0] w_addr,
    input [31:0] w_data,
    input w_en,
    input [31:0] ins,
    input [31:0] pc,
    output [31:0] data2,
    output [31:0] alua,
    output [31:0] alub,
    output [31:0] imm,
    output [1:0] wb_sel,
    output rf_wen,
    output [2:0] alu_op,
    output wire dram_wen 
);
    wire [31:0] data1;
    wire [2:0] imm_op;
    rf arf(ins[19:15],ins[24:20],w_addr,w_en,w_data,~clk,data1,data2);
    control cu(ins,wb_sel,imm_op,rf_wen,alu_op,alua_sel,alub_sel,dram_wen);
    immGen im(imm_op,ins[31:7],imm);
    assign alua = alua_sel ? data1:pc; // 1 data1, 0 pc 
    assign alub = alub_sel ? data2:imm; // 1 data1, 0 pc 
endmodule