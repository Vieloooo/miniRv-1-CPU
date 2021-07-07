module control (
    input [31:0] ins,
    input breq,
    input brlt,
    output reg pc_sel,
    output reg [2:0] wb_sel,
    output reg [2:0] imm_op,
    output reg rf_wen,
    output reg brun,
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
    // handle pcsel 
    always @(*) begin
        if(typpp == 'b111 || typpp == 'b010)begin     // jal and jalr 
            pc_sel = 'b1;
        end else if (typpp == 'b100)begin            // branch ins 
            case (ins[14:12])
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
                3'b110:begin                         //bltu
                    if(brlt)    pc_sel = 'b1;
                    else        pc_sel = 'b0;
                end
                'b101:begin                         //bge
                    if(brlt=='b0 && breq =='b0)    pc_sel = 'b1;    
                    else        pc_sel = 'b0;
                end
                3'b111:begin                         //bgeu
                    if(brlt=='b0 && breq =='b0)    pc_sel = 'b1;    
                    else        pc_sel = 'b0;
                end
                default: pc_sel = 'b0;
            endcase
        end else begin                              // others 
            pc_sel = 'b0;
        end
    end
    //handle wb_sel 
    always @(*) begin
        if (typpp =='b101 )wb_sel = 'b101;       // lui
        else if(typpp == 'b110)  wb_sel = 'b1;   //auipc 
        else if (typpp == 'b111 || typpp == 'b010) wb_sel = 'b0;     //jal,jalr
        else if (typpp == 'b001 && ins[14:12]== 'b010) wb_sel = 'b10;      //lw
        else begin                                          //slt,sltu
            if(ins[14:12]=='b010 || ins[14:12]=='b011)begin
                if(brlt)    wb_sel = 'b11;
                else        wb_sel = 'b100;
            end else begin
                wb_sel = 'b1;
            end
        end
        
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
        if (typpp =='b100 || typpp == 'b011)  rf_wen = 'b0;
        else rf_wen = 'b1;
    end
    //handle brun 
    always @(*) begin
        if(typpp == 'b0 || typpp == 'b1)begin
            if (ins[14:12]== 'b011) brun = 'b1;     //sltu, sltiu
            else brun = 'b0;
        end else if (typpp =='b100)begin             // branch 
            if (ins[14:12]== 'b110 || ins[14:12]== 'b111) brun = 'b1;
            else brun = 'b0;
        end else brun = 'b0;
       
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