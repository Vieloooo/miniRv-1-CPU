module clk_halt (
    input clk,
    input halt,
    output clk_o
);
    /*
    clk     halt    clk_o
    1       1       1
    1       0       0
    0       1       0
    0       0       1
    */
   assign  clk_o = clk ^~ halt;
endmodule