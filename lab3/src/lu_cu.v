module lu_cu (
   input clk,
   input rst,
   input lu_halt,
   output reg h4lu,   // halt for load and use 
  
);
    always @(negedge clk) begin
       if (~rst || h4lu)  h4lu <= 0;
      else begin
         if(lu_halt) h4lu <= 1;
         else h4lu <= 0; 
      end
      
    end
endmodule