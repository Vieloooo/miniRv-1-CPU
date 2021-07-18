module id (
    input clk,
    input [4:0] w_addr,
    input [31:0] w_data,
    input w_en,
    input [31:0] ins,
    input [31:0] pc,
    output [31:0] data1,
    output [31:0] data2,
    output  alua_sel,
    output  alub_sel,
    output [31:0] imm,
    output [1:0] wb_sel,
    output rf_wen,
    output [2:0] alu_op,
    output  dram_wen ,
    output pc_sel,
    output [31:0] npc
);
    wire [2:0] imm_op;
    rf arf(ins[19:15],ins[24:20],w_addr,w_en,w_data,~clk,data1,data2);
    control cu(ins,wb_sel,imm_op,rf_wen,alu_op,alua_sel,alub_sel,dram_wen);
    immGen im(imm_op,ins[31:7],imm);
    branch br(data1,data2,breq,brlt);
    pc_gen pc_generator(ins[6:0],ins[14:12],pc,data1,imm,breq,brlt,pc_sel,npc);
   
endmodule