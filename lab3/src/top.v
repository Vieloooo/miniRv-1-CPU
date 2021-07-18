`timescale 1ns / 1ps


module top(
    input clk,
    input rst,
    output [4:0] debug_wb_addr,
    output [31:0] deubg_wb_data
    );
    wire [31:0] pc,ins,dram_wdata,dram_rdata;
    wire [13:0]   dram_addr;
    cpu acpu(rst,clk,pc,ins,dram_wen,dram_wdata,dram_addr,dram_rdata, debug_wb_addr,deubg_wb_data);
    irom a_irom (
      .a(pc[15:2]),      // input wire [13 : 0] a
      .spo(ins)  // output wire [31 : 0] spo
    );
    dram adram (
  .a(dram_addr),      // input wire [13 : 0] a
  .d(dram_wdata),      // input wire [31 : 0] d
  .clk(~clk),  // input wire clk
  .we(dram_wen),    // input wire we
  .spo(dram_rdata)  // output wire [31 : 0] spo
);
    
endmodule
