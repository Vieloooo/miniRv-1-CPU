/*
1. if j instruction, just change npc and pc_sel
2. if branch instruction, halt pc for 1 cycle, wait for the answer in 
*/
module pc_cu (
    input [6:0] op7,
    input pc_valid,
    output reg halt_pc
);
    always @(*) begin
        if (pc_valid) halt_pc = 0;
        else begin
            if (op7 == 'b1100111 || op7 =='b1100011 || op7 == 'b1101111) halt_pc =1;
            else halt_pc = 0;
        end

    end
    
endmodule