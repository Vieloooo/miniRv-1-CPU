// Add your code here, or replace this file
module top (
    input clk,
    input rst_n,
    output debug_wb_have_inst,
    output [31:0] debug_wb_pc,
    output      debug_wb_ena,
    output      debug_wb_reg,
    output      debug_wb_value
);
/*
    wire [2:0] wb_sel,imm_op,alu_op;
    wire [31:0] pc,pc4,npc,ins,imm,rf_wdata,data1,data2,aluc,dram_rdata,alua,alub;
    pcP4 apc4(pc,pc4);
    inst_mem a_irom(pc[15:2],ins);
    pcSel pcmux(pc_sel,aluc,pc4,npc);
    regPc apc(clk,en,rst_en,npc,pc);
    pcControl apcc(ins,'b0,en);
    control cu(ins,breq,brlt,pc_sel,wb_sel,imm_op,rf_wen,brun,alu_op,asel,bsel,dram_wen);
    immGen ig(imm_op,ins[31:7],imm);
    rf regfile(ins[19:15],ins[24:20],ins[11:7],rf_wen,rf_wdata,clk,data1,data2);
    wbSel wbmux(wb_sel,pc4,aluc,dram_rdata,rf_wdata,imm);
    branch br(data1,data2,brun,breq,brlt);
    alua_Sel as(pc,data1,asel,alua);
    alub_Sel bs(imm,data2,bsel,alub);
    alu aalu(alua,alub,alu_op,aluc);
    data_mem adram(clk,aluc[13:0],data2,dram_wen,dram_rdata);

    assign debug_wb_have_inst = 1;
    assign debug_wb_pc = pc;
    assign debug_wb_ena = rf_wen;
    assign debug_wb_reg = ins[11:7];
    assign debug_wb_value = rf_wdata;
*/
endmodule