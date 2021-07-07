`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 10:45:09
// Design Name: 
// Module Name: dram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dram(
    input clk,
    input [31:0] addr,
    input [31:0] data,
    input wen,
    output [31:0] rd
    );
    
    dataram adram (
    .a(addr[13:0]),        // input wire [13 : 0] a
    .d(data),        // input wire [31 : 0] d
    .clk(clk),    // input wire clk
    .we(wen),      // input wire we
    .spo(rd)  // output wire [31 : 0] qspo
    );
  
endmodule
