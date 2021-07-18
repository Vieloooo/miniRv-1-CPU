module cpu (
    input rst,
    input clk,
    output [31:0] irom_pc,
    input [31:0] ins,
    output x_dram_wen,
    output [31:0] x_dram_wdata,
    output [13:0] x_addr,
    input [31:0] dram_rdata,
    //debug 
    output debug_wb_have_inst,
    output [31:0] debug_wb_pc,
    output      debug_wb_ena,
    output   [4:0]   debug_wb_reg,
    output    [31:0]  debug_wb_value
);
    wire [31:0] rpc,b1_ins,b1_rpc;
    wire [31:0] npc;
    // reg pc 
    pc apc(clk,rst,npc,pc_sel,rpc,lu_halt);
    // irom pc 
    assign irom_pc =rpc;
    wire b_rst;  
    // if/id buffer 
    buffer1 buff1(clk,rst & b_rst,ins,rpc,b1_ins,b1_rpc,lu_halt,b1_have_ins);
    wire [31:0] data1,data2, alua, alub, imm,b2_imm,b3_imm;
    wire [1:0] wb_sel,b2_wb_sel,b3_wb_sel;
    wire [2:0] alu_op,b2_alu_op;
    wire [4:0] b2_wb_addr,b3_wb_addr,b4_wb_addr;
  
    wire [31:0] b2_alua,b2_alub,b2_data2,b3_data2,b2_pc,b3_pc;
    wire [31:0] ex_4ward,data1_o,data2_o;
    wire [1:0] rs1_sel,rs2_sel;
   
    wire [31:0] wb_data,b4_wb_data; 
    wire [31:0] aluc,b3_aluc;
    // id module 
    id aid(clk,b4_wb_addr,b4_wb_data,b4_rf_wen,b1_ins,b1_rpc,data1,data2,alua_sel,alub_sel,imm,wb_sel,rf_wen,alu_op,dram_wen,pc_sel,npc);
    // detect branch and choose npc not pc4, b_rst = 0;
    // branch predict and jump handle 
    assign b_rst = ((b1_ins[6:0]== 'b1100011 || b1_ins[6:0]== 'b1101111 || b1_ins[6:0]== 'b1100111 ) && pc_sel == 1) ? 0:1;
    // rs1,rs2 forward select 
    rs_sel rs1_s(rs1_sel,data1,ex_4ward,wb_data,b4_wb_data,data1_o);
    rs_sel rs2_s(rs2_sel,data2,ex_4ward,wb_data,b4_wb_data,data2_o);
    // alua, alub sel 
    assign alua = alua_sel ? data1_o:b1_rpc; // 1 data1, 0 pc 
    assign alub = alub_sel ? data2_o:imm; // 1 data1, 0 pc 
    // id/ex buffer 
    buffer2 buff2(
        clk,
        rst &(~lu_halt),
        alua,alub,alu_op,dram_wen,data2,wb_sel,b1_ins[11:7],b1_rpc,imm,rf_wen,b2_alua,b2_alub,b2_alu_op,b2_dram_wen,b2_data2,b2_wb_sel,b2_wb_addr,b2_pc,b2_imm,b2_rf_wen,b1_have_ins,
        b2_have_ins);
   // alu 
    alu aalu(b2_alua,b2_alub,b2_alu_op,aluc);
    // ex forward sel
    pc4_aluc_sel pc4aluc(b2_pc,aluc,b2_wb_sel[0],ex_4ward);
    //ex/dm buffer 
    buffer3 buff3(
        clk,rst,b2_wb_sel,b2_wb_addr,b2_pc,aluc,b2_dram_wen,b2_data2,b2_imm,b2_rf_wen,b3_wb_sel,b3_wb_addr,b3_pc,b3_aluc,b3_dram_wen,b3_data2,b3_imm,
        b3_rf_wen,b2_have_ins,b3_have_ins);
    //data to dram 
    assign x_addr = b3_aluc[15:2];
    assign x_dram_wen = b3_dram_wen;
    assign x_dram_wdata = b3_data2;
    // wb data sel 
    wbSel awbsel(b3_wb_sel,b3_pc+4,b3_aluc,dram_rdata,wb_data,b3_imm);
    // dm/wb buffer
    wire [31:0] b4_pc; 
    buffer4 buff4(
        rst,clk,b3_rf_wen,b3_wb_addr,wb_data,b4_rf_wen,b4_wb_addr,b4_wb_data,b3_pc,b4_pc,b3_have_ins,b4_have_ins);
    assign debug_wb_have_inst = b4_have_ins;
    assign debug_wb_pc = b4_pc;
    assign debug_wb_ena = b4_rf_wen;
    assign debug_wb_reg = b4_wb_addr;
    assign debug_wb_value = b4_wb_data;
    // hazard detect 
    detect adu(b1_ins[19:15],b1_ins[24:20],b2_wb_addr,b3_wb_addr,b4_wb_addr,b2_rf_wen,b3_rf_wen,b4_rf_wen,rs1_sel,rs2_sel,b2_wb_sel,lu_halt);
endmodule