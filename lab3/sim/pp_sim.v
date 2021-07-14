module pp_sim (
);
    reg clk = 'b0;
    reg rst = 'b0;
    top atop(clk,rst);
    always #10 clk = ~clk;
 
    initial begin
        #50 rst = 'b0;
        #30 rst = 'b1;
    end
endmodule