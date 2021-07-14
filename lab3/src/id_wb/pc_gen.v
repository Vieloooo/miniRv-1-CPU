module pc_gen (
    input [6:0] op7,
    input [2:0] b_t,
    input [31:0] pc,
    input [31:0] data1,
    input [31:0] imm,
    output reg pc_sel,
    output [31:0] reg npc,
);
    always @(*) begin
          if (op7 == 'b1100111 || op7 == 'b1101111) pc_sel =1;
          else if(op7 == 'b1100011)begin
                
          end
          else pc_sel = 0;
    end
endmodule