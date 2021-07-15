module pc_gen (
    input [6:0] op7,
    input [2:0] b_t,
    input [31:0] pc,
    input [31:0] data1,
    input [31:0] imm,
    input breq,
    input brlt,
    output reg pc_sel,
    output [31:0] reg npc,
);
    always @(*) begin
          if (op7 == 'b1100111 || op7 == 'b1101111) pc_sel =1;
          else if(op7 == 'b1100011)begin    //branch 
                case (b_t)
                   3'b000: begin                        //beq
                    if(breq)    pc_sel = 'b1;
                    else        pc_sel = 'b0;
                end
                3'b001:begin                         //bne
                    if(breq)    pc_sel = 'b0;
                    else        pc_sel = 'b1;
                end
                3'b100:begin                         //blt
                    if(brlt)    pc_sel = 'b1;
                    else        pc_sel = 'b0;
                end
                'b101:begin                         //bge
                    if(brlt=='b0 )    pc_sel = 'b1;    
                    else        pc_sel = 'b0;
                end
                default: pc_sel = 'b0;
                endcase
          end
          else pc_sel = 0;
    end
    always @(*) begin
        if (op7 == 'b1100111) npc = data1 + imm;
        else npc = pc + imm;
    end
endmodule