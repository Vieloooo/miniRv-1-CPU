module clk_halt (
    input clk,
    input rst,
    input halt,
    output reg clk_o
);
    /*
    clk     halt    clk_o
    1       1       1
    1       0       0
    0       1       0
    0       0       1
    */
   always @(posedge clk or negedge clk) begin
    if (~rst)begin
        clk_o = 0;
    end
    else begin
        if (halt) clk_o<= clk_o;
        else clk_o <= ~clk_o;
    end
      
   end
endmodule