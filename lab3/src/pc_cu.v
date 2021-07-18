/*
if b, j halt 1 cycle  
*/
module pc_cu (
    input clk,
    input rst,
    input [6:0] op7,
    output reg halt_pc
);
always @(negedge clk) begin
    if (~rst || halt_pc) halt_pc <= 0;
    else begin
        if (op7 == 'b1100111 || op7 == 'b1101111) halt_pc <=1;// jump instructions
        else halt_pc <= 0;
    end
end
   
endmodule