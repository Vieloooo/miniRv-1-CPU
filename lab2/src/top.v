module top (
    input clk,
    input halt,
    input rst,
    output [31:0] wb_data,
    output [31:0] alc
);
    wire [2:0] wb_sel,imm_op,alu_op;
    wire [31:0] pc,pc4,npc,ins,imm,rf_wdata,data1,data2,aluc,dram_rdata,alua,alub;
    pcP4 apc4(pc,pc4);
    irom a_irom(pc,ins);
    pcSel pcmux(pc_sel,aluc,pc4,npc);
    regPc apc(clk,en,rst,npc,pc);
    pcControl apcc(ins,halt,en);
    control cu(ins,breq,brlt,pc_sel,wb_sel,imm_op,rf_wen,brun,alu_op,asel,bsel,dram_wen);
    immGen ig(imm_op,ins[31:7],imm);
    rf regfile(ins[19:15],ins[24:20],ins[11:7],rf_wen,rf_wdata,clk,data1,data2);
    wbSel wbmux(wb_sel,pc4,aluc,dram_rdata,rf_wdata,imm);
    branch br(data1,data2,brun,breq,brlt);
    alua_Sel as(pc,data1,asel,alua);
    alub_Sel bs(imm,data2,bsel,alub);
    alu aalu(alua,alub,alu_op,aluc);
    dram adram(clk,aluc,data2,dram_wen,dram_rdata);
    assign alc = aluc;
    assign wb_data = rf_wdata;
endmodule