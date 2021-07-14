module cpu (
    input rst,
    input clk,
    output [31:0] irom_pc,
    input [31:0] ins,
    output x_dram_wen,
    output [31:0] x_dram_wdata,
    output [15:0] x_addr,
    input [31:0] dram_rdata,
    output [4:0] debug_wb_addr,
    output [31:0] deubg_wb_data
);
    wire [31:0] rpc,b1_ins,b1_rpc;
    pc apc(clk,rst,'b0,0,rpc);
    assign irom_pc =rpc;
    buffer1 buff1(clk,rst,ins,rpc,b1_ins,b1_rpc);
    wire [31:0] data2, alua, alub, imm,b2_imm,b3_imm;
    wire [1:0] wb_sel,b2_wb_sel,b3_wb_sel;
    wire [2:0] alu_op,b2_alu_op;
    id(clk,b4_wb_addr,b4_wb_data,b4_rf_wen,b1_ins,b1_rpc,data2,alua,alub,imm,wb_sel,rf_wen,alu_op,dram_wen);
    wire [4:0] b2_wb_addr,b3_wb_addr,b4_wb_addr;
    wire [31:0] b2_alua,b2_alub,b2_data2,b3_data2,b2_pc,b3_pc;
    buffer2 buff2(clk,rst,alua,alub,alu_op,dram_wen,data2,wb_sel,b1_ins[11:7],b1_rpc,imm,rf_wen,b2_alua,b2_alub,b2_alu_op,b2_dram_wen,b2_data2,b2_wb_sel,b2_wb_addr,b2_pc,b2_imm,b2_rf_wen);
    wire [31:0] aluc,b3_aluc;
    alu aalu(b2_alua,b2_alub,aluc);
    buffer3 buff3(clk,rst,b2_wb_sel,b2_wb_addr,b2_pc,aluc,b2_dram_wen,b2_data2,b2_imm,b2_rf_wen,b3_wb_sel,b3_wb_addr,b3_pc,b3_aluc,b3_dram_wen,b3_data2,b3_imm,b3_rf_wen);
    assign x_addr = b3_aluc[15:0];
    assign x_dram_wen = b3_dram_wen;
    assign x_dram_wdata = b3_data2;
    wire [31:0] wb_data,b4_wb_data;
    wbSel awbsel(b3_wb_sel,b3_pc+4,b3_aluc,dram_rdata,wb_data,b3_imm);
    buffer4 buff4(rst,clk,b3_rf_wen,b3_wb_addr,wb_data,b4_rf_wen,b4_wb_addr,b4_wb_data);
    assign debug_wb_addr = b4_wb_addr;
    assign deubg_wb_data = b4_wb_data;
endmodule