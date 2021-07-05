`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/02 10:45:09
// Design Name: 
// Module Name: irom
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


module irom(
    input [31:0] pc,
    output [31:0] ins
    );
    prgrom irom (
  .a(pc[13:0]),      // input wire [13 : 0] a
  .spo(ins)  // output wire [31 : 0] spo
);
endmodule
