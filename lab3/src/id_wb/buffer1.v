//cache pc, ins 
module buffer1 (
    input clk,
    input rst,
    input [31:0] if_ins,
    input [31:0] if_pc,
    output reg [31:0] ifIns,
    output reg [31:0] ifPc,
    input halt
);
    always @(posedge clk) begin
        if(~rst) ifPc <= 'b0;
        else begin 
            if (halt) ifPc <=ifPc;
            else ifPc <= if_pc;
        end 
    end
    always @(posedge clk) begin
        if(~rst) ifIns <= 32'h0;
        else  begin 
            if (halt) ifIns <= ifIns;
            else ifIns <= if_ins;
        end 
     end
endmodule