module buffer3 (
    input clk,
    input rst,
    input [1:0] wb_sel,
    input [4:0] wb_addr,
    input [31:0] pc,
    input [31:0] aluc,
    input dram_wen ,
    input [31:0] data2,
    input [31:0] imm,
    input rf_wen,
    output reg [1:0] wb_sel_o,
    output reg [4:0] wb_addr_o,
    output reg [31:0] pc_o,
    output reg [31:0] aluc_o,
    output reg dram_wen_o,
    output reg [31:0] data2_o,
    output reg [31:9] imm_o
    output reg rf_wen_o
);
always @(posedge clk) begin
      if(~rst) begin   
          wb_sel_o <= 'b0;
          wb_addr_o <= 'b0;
          pc_o <= 'b0;
          aluc_o <= 'b0;
          dram_wen_o <= 'b0;
          data2_o <= 'b0;
          imm_o <= 'b0;
          rf_wen_o <= 'b0;
      end else begin
          wb_sel_o <= wb_sel;
          wb_addr_o <= wb_addr; 
          pc_o <= pc;
          aluc_o <= aluc;
          dram_wen_o <= dram_wen;
          data2_o <= data2;
          imm_o <= imm;
          rf_wen_o <= rf_wen;
      end
end
    
endmodule