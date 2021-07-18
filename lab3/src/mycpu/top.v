`timescale 1ns / 1ps

module top (
    input clk,
    input rst_n,
    output debug_wb_have_inst,
    output [31:0] debug_wb_pc,
    output      debug_wb_ena,
    output   [4:0]   debug_wb_reg,
    output    [31:0]  debug_wb_value
);
    wire [31:0] pc,ins,dram_wdata,dram_rdata;
    wire [13:0]   dram_addr;
    cpu acpu(rst_n,clk,pc,ins,dram_wen,dram_wdata,dram_addr,dram_rdata,debug_wb_have_inst,debug_wb_pc,debug_wb_ena,debug_wb_reg,debug_wb_value);
    inst_mem a_irom(pc[17:2],ins);
    data_mem adram(~clk,{2'b00,dram_addr},dram_wen,dram_wdata,dram_rdata);
endmodule
