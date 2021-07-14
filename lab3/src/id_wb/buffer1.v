//cache pc, ins 
module buffer1 (
    input clk,
    input rst,
    input [31:0] if_ins,
    input [31:0] if_pc,
    output reg [31:0] ifPc,
    output reg [31:0] ifIns
);
    reg [31:0] ifPc,ifIns;
    always @(posedge clk) begin
        if(~rst) ifPc <= 'b0;
        else ifPc <= if_pc;
    end
    always @(posedge clk) begin
        if(~rst) ifIns <= 'b0;
        else ifIns <= if_ins;
    end
    
endmodule