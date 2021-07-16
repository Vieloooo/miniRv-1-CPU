module control (
    input [31:0] ins,
    output reg [1:0] wb_sel,
    output reg [2:0] imm_op,
    output reg rf_wen,
    output reg [2:0] alu_op,
    output reg alua_sel,
    output reg alub_sel,
    output wire dram_wen
);
// immediate vars
reg [2:0] typpp;

// get instructions typpp 
/*
interface:
0,r
1,i
2,jalr
3,s
4,b
5,lui
6,auipc 
7,jal
*/
    always @(*) begin
        case (ins[6:0])
            'b0110011: typpp = 0;
            'b0010011: typpp = 1;
            'b0000011: typpp = 1;
            'b1100111: typpp = 2;
            'b0100011: typpp = 3;
            'b1100011: typpp = 4;
            'b0110111: typpp = 5;
            'b0010111: typpp = 6;
            'b1101111: typpp = 7;
            default: typpp = 0;
        endcase
    end
    
    //handle wb_sel 
    always @(*) begin
        if (typpp =='b101 )wb_sel = 'b11;       // lui
        else if(typpp == 'b110)  wb_sel = 'b1;   //auipc 
        else if (typpp == 'b111 || typpp == 'b010) wb_sel = 'b0;     //jal,jalr
        else if (typpp == 'b001 && ins[14:12]== 'b010) wb_sel = 'b10;      //lw
        else                  wb_sel = 'b1;
    end
    // handl imm_op 
    always @(*) begin
        case (typpp)
            0: imm_op = 0;
            1: imm_op = 1;
            2: imm_op = 1;
            3: imm_op = 2;
            4: imm_op = 3;
            5: imm_op = 4;
            6: imm_op = 4;
            7: imm_op = 5;
            default: imm_op = 'b0;
        endcase
    end
    // handle rf_wen 
    always @(*) begin
        if (typpp =='b100 || typpp == 'b011 || ins[6:0] == 'b1111111)  rf_wen = 'b0;
        else rf_wen = 'b1;
    end
    //handle alua_sel 
    always @(*) begin
        if (typpp == 'b111 || typpp == 'b110 || typpp == 'b100) alua_sel = 'b0;    //jalr , auipc, branch pick pc 
        else alua_sel = 'b1;
    end

    //handle alub_sel 
    always @(*) begin
        if(typpp == 'b0)alub_sel = 'b1;
        else alub_sel = 'b0;
    end
    //handle alu_op 
    always @(*) begin
        if (typpp == 'b0)begin
            if(ins[14:12] == 'b000 && ins[31:25]== 'b0100000) alu_op = 'b1;
            else if (ins[14:12] == 'b111) alu_op = 2;
            else if (ins[14:12] == 'b110) alu_op = 3; 
            else if (ins[14:12] == 'b100) alu_op = 4;
            else if (ins[14:12] == 'b001) alu_op = 5; 
            else if (ins[14:12] == 'b101 && ins[31:25]== 'b0000000) alu_op = 6;
            else if (ins[14:12] == 'b101 && ins[31:25]== 'b0100000) alu_op = 7;
            else alu_op = 'b0;
        end else if (typpp == 'b1)begin
            if(ins[14:12] == 'b000 ) alu_op = 'b0;
            else if (ins[14:12] == 'b111) alu_op = 2;
            else if (ins[14:12] == 'b110) alu_op = 3; 
            else if (ins[14:12] == 'b100) alu_op = 4;
            else if (ins[14:12] == 'b001) alu_op = 5; 
            else if (ins[14:12] == 'b101 && ins[31:25]== 'b0000000) alu_op = 6;
            else if (ins[14:12] == 'b101 && ins[31:25]== 'b0100000) alu_op = 7;
            else alu_op = 'b0;
        end else alu_op = 'b0;
    end
    //dram wen 
    assign dram_wen = (typpp == 'b011) ? 1:0;
endmodule