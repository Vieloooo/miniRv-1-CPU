/*
interface:
* input
  1. imm_op
     1. type:r,i,i-shift,s,b,u,uj
        1. r  0
        2. i  1
        //3. Is 2(i- shift)
        4. s  3 (store)
        5. b  4
        6. u  5 (lui)
        7. uj 6 (jal)
  2. Ins[31:7] as ins[24:0]
* output
  1. 32bits imm
*/
module immGen (
    input [2:0] im_op,
    input [24:0] ins,
    output reg [31:0] imm
);
    always @(*) begin
        case (im_op)
            0:imm = 0;
            1:begin
                if (ins[24] == 'b1)begin
                    imm = {20'hfffff,ins[24:13]};
                end else begin
                     imm = {20'b0,ins[24:12]};
                end
            end 
            //2: imm = {27'b0,ins[17:13]};
            3:begin
                if (ins[24] == 'b1)begin
                    imm = {20'hfffff,ins[24:18],ins[6:0]};
                end else begin
                     imm = {20'h0,ins[24:18],ins[6:0]};
                end
            end 
            4: begin
                if (ins[24] == 'b1)begin
                    imm = {19'b1111111111111111111,ins[24],ins[0],ins[23:18],ins[4:1],1'b0};
                end else begin
                    imm = {19'b0,ins[24],ins[0],ins[23:18],ins[4:1],1'b0};
                end
            end
            5:imm = {ins[24:5],12'b0};
            6:begin
                if (ins[24] == 'b1)begin
                    imm = {11'b11111111111,ins[24],ins[12:5],ins[13],ins[23:14],1'b0};
                end else begin
                    imm = {11'b0,ins[24],ins[12:5],ins[13],ins[23:14],1'b0};
                end
            end
            default: imm  = 'b0;
        endcase
    end
endmodule