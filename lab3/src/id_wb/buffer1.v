//cache pc, ins 
module buffer1 (
    input clk,
    input rst,
    input [31:0] if_ins,
    input [31:0] if_pc,
    output reg [31:0] ifIns,
    output reg [31:0] ifPc,
    input halt,
    output reg have_ins
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
      always @(posedge clk) begin
        if(~rst) have_ins <= 'b0;
        else begin 
            if (halt) have_ins <=have_ins;
            else have_ins <= 1;
        end 
    end
endmodule