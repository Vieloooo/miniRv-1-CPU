`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/18 21:42:44
// Design Name: 
// Module Name: div_1k
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


module div_1k(
    input clk_i,
    input rst_n_i,  
    output  clk_o
    );
    reg [15:0] cnt='h0;
    always @(posedge clk_i or negedge rst_n_i) begin
        if (~rst_n_i)
            cnt <= 15'h0;
        else begin
            cnt <= cnt + 1;
            end              
    end
    assign clk_o = cnt[15];

endmodule
