module buffer2 (
    input clk,
    input rst,
    // for alu 
    input [31:0] alua,
    input [31:0] alub,
    input [2:0] alu_sel,
    //for mem 
    input dram_wen,
    input [31:0] data2,
    //for wb 
    input [1:0] wb_sel,
    input [4:0] wb_addr,
    input [31:0] pc,
    input [31:0] imm,
    input rf_wen,
    output reg [31:0] alua_o,
    output reg [31:0] alub_o,
    output reg [2:0] alu_sel_o,
    output reg dram_wen_o,
    output reg [31:0] data2_o,
    output reg [1:0] wb_sel_o,
    output reg [4:0] wb_addr_o,
    output reg [31:0] pc_o,
    output reg [31:0] imm_o,
    output reg rf_wen_o
);
always @(posedge clk) begin
      if(~rst) begin
          alua_o = 'b0;
          alub_o = 'b0;
          alu_sel_o = 'b0;
          dram_wen_o <= 'b0;
          data2_o <= 'b0;
          wb_sel_o <= 'b0;
          wb_addr_o <= 'b0;
          pc_o <= 'b0;
          imm_o <= 'b0;
          rf_wen_o <= 'b0;
      end else begin
          alua_o <= alua;
          alub_o <= alub;
          alu_sel_o <= alu_sel;
          dram_wen_o <= dram_wen;
          data2_o <= data2;
          wb_sel_o <= wb_sel;
          wb_addr_o <= wb_addr; 
          pc_o <= pc;
          imm_o <= imm;
          rf_wen_o <= rf_wen;     
      end
end
    
endmodule