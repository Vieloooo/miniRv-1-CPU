/*
if b, j halt 1 cycle  
*/
module pc_cu (
    input clk,
    input [6:0] op7,
    output reg halt_pc
);
always @(negedge clk) begin
    if (halt_pc) hlat_pc <= 0;
    else begin
        if (op7 == 'b1100111 || op7 =='b1100011 || op7 == 'b1101111) halt_pc <=1;
        else halt_pc <= 0;
    end
     
end
   
endmodule