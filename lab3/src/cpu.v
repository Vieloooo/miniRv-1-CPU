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
    wire [31:0] npc;
    clk_halt clk_h(clk,pc_halt | h4lu,clk_o);
    pc apc(clk_o,rst,npc,pc_sel,rpc);
    pc_cu pcu(clk,rst,ins[6:0],pc_halt);
    lu_cu lucu(clk,rst,lu_halt,h4lu);
    assign irom_pc =rpc;
    buffer1 buff1(clk ^~ h4lu,rst^b_rst,ins,rpc,b1_ins,b1_rpc);
    wire [31:0] data1,data2, alua, alub, imm,b2_imm,b3_imm;
    wire [1:0] wb_sel,b2_wb_sel,b3_wb_sel;
    wire [2:0] alu_op,b2_alu_op;
    id aid(clk,b4_wb_addr,b4_wb_data,b4_rf_wen,b1_ins,b1_rpc,data1,data2,alua_sel,alub_sel,imm,wb_sel,rf_wen,alu_op,dram_wen,pc_sel,npc);
    wire [4:0] b2_wb_addr,b3_wb_addr,b4_wb_addr;
    wire [31:0] b2_alua,b2_alub,b2_data2,b3_data2,b2_pc,b3_pc;
    wire [31:0] ex_4ward,data1_o,data2_o;
    wire [1:0] rs1_sel,rs2_sel;
    wire b_rst;
    assign b_rst = (b1_ins[6:0]== 'b1100011 && pc_sel = 1) ? 0:1;
    rs_sel rs1_s(rs1_sel,data1,ex_4ward,wb_data,b4_wb_data,data1_o);
    rs_sel rs2_s(rs2_sel,data2,ex_4ward,wb_data,b4_wb_data,data1_o);
    assign alua = alua_sel ? data1:b1_pc; // 1 data1, 0 pc 
    assign alub = alub_sel ? data2:imm; // 1 data1, 0 pc 
    buffer2 buff2(clk ^~ h4lu,rst,alua,alub,alu_op,dram_wen,data2,wb_sel,b1_ins[11:7],b1_rpc,imm,rf_wen,b2_alua,b2_alub,b2_alu_op,b2_dram_wen,b2_data2,b2_wb_sel,b2_wb_addr,b2_pc,b2_imm,b2_rf_wen);
    wire [31:0] aluc,b3_aluc;
    alu aalu(b2_alua,b2_alub,b2_alu_op,aluc);
    pc4_aluc_sel pc4aluc(b2_pc,aluc,b2_wb_sel[0],ex_4ward);
    buffer3 buff3(clk,rst,b2_wb_sel,b2_wb_addr,b2_pc,aluc,b2_dram_wen,b2_data2,b2_imm,b2_rf_wen,b3_wb_sel,b3_wb_addr,b3_pc,b3_aluc,b3_dram_wen,b3_data2,b3_imm,b3_rf_wen);
    assign x_addr = b3_aluc[15:0];
    assign x_dram_wen = b3_dram_wen;
    assign x_dram_wdata = b3_data2;
    wire [31:0] wb_data,b4_wb_data;
    wbSel awbsel(b3_wb_sel,b3_pc+4,b3_aluc,dram_rdata,wb_data,b3_imm);
    buffer4 buff4(rst,clk,b3_rf_wen,b3_wb_addr,wb_data,b4_rf_wen,b4_wb_addr,b4_wb_data);
    assign debug_wb_addr = b4_wb_addr;
    assign deubg_wb_data = b4_wb_data;
    detect adu(b1_ins[19:15],b1_ins[24:20],b2_wb_addr,b3_wb_addr,b4_wb_addr,b2_rf_wen,b3_rf_wen,b4_rf_wen,rs1_sel,rs2_sel,b2_wb_sel,lu_halt);
endmodule