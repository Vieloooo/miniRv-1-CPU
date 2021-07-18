module buffer4 (
    input rst,
    input clk,
    input  wb_en,
    input [4:0] wb_addr,
    input [31:0] wb_data,
    output reg  wb_en_o,
    output reg [4:0] wb_addr_o,
    output reg [31:0] wb_data_o,
    input [31:0] pc,
    output reg [31:0] pc_o,
    input have_ins,
    output reg have_ins_o
);
 always @(posedge clk) begin
      if(~rst) begin   
          wb_en_o <= 'b0;
          wb_addr_o <= 'b0;
          wb_data_o <= 'b0;
          pc_o <=0;
          have_ins_o <= 'b0;
      end else begin
          wb_en_o <= wb_en;
          wb_addr_o <= wb_addr; 
          wb_data_o <= wb_data;
          pc_o<= pc;
          have_ins_o <= have_ins;
      end
end
    
endmodule
    