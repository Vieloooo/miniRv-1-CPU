
module rf(
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] w_addr,
    input wen,
    input [31:0] w_data,
    input clk,
    output reg [31:0] data1,
    output reg [31:0] data2
    );
    reg [31:0] x0,x1,x2,x3,x4,x5,x6,x7;
    reg [31:0] x8,x9,x10,x11,x12,x13,x14,x15;
    reg [31:0] x16,x17,x18,x19,x20,x21,x22,x23;
    reg [31:0] x24,x25,x26,x27,x28,x29,x30,x31;
   // rs1 read out 
    always @(*) begin
        case (rs1)
            0: data1 = 'b0;
            1: data1 = x1;
            2: data1 = x2;
            3: data1 = x3;
            4: data1 = x4;
            5: data1 = x5;
            6: data1 = x6;
            7: data1 = x7;
            8: data1 = x8;
            9: data1 = x9;
            10: data1 = x10;
            11: data1 = x11;
            12: data1 = x12;
            13: data1 = x13;
            14: data1 = x14;
            15: data1 = x15;
            16: data1 = x16;
            17: data1 = x17;
            18: data1 = x18;
            19: data1 = x19;
            20: data1 = x20;
            21: data1 = x21;
            22: data1 = x22;
            23: data1 = x23;
            24: data1 = x24;
            25: data1 = x25;
            26: data1 = x26;
            27: data1 = x27;
            28: data1 = x28;
            29: data1 = x29;
            30: data1 = x30;
            31: data1 = x31;
            default: data1 = 'b0;
        endcase
    end
    always @(*) begin
        case (rs2)
            0: data2 = 'b0;
            1: data2 = x1;
            2: data2 = x2;
            3: data2 = x3;
            4: data2 = x4;
            5: data2 = x5;
            6: data2 = x6;
            7: data2 = x7;
            8: data2 = x8;
            9: data2 = x9;
            10: data2 = x10;
            11: data2 = x11;
            12: data2 = x12;
            13: data2 = x13;
            14: data2 = x14;
            15: data2 = x15;
            16: data2 = x16;
            17: data2 = x17;
            18: data2 = x18;
            19: data2 = x19;
            20: data2 = x20;
            21: data2 = x21;
            22: data2 = x22;
            23: data2 = x23;
            24: data2 = x24;
            25: data2 = x25;
            26: data2 = x26;
            27: data2 = x27;
            28: data2 = x28;
            29: data2 = x29;
            30: data2 = x30;
            31: data2 = x31;
            default: data2 = 'b0;
        endcase
    end
    
always@(posedge clk )begin
        if(wen=='b1)begin
            case (w_addr)
            1: x1 <= w_data;
            2: x2 <= w_data;
            3: x3<= w_data;
            4: x4<= w_data;
            5:  x5<= w_data;
            6:  x6<= w_data;
            7:  x7<= w_data;
            8:  x8<= w_data;
            9:  x9<= w_data;
            10:  x10<= w_data;
            11:  x11<= w_data;
            12:  x12<= w_data;
            13:  x13<= w_data;
            14:  x14<= w_data;
            15:  x15<= w_data;
            16:  x16<= w_data;
            17:  x17<= w_data;
            18:  x18<= w_data;
            19:  x19<= w_data;
            20:  x20<= w_data;
            21:  x21<= w_data;
            22:  x22<= w_data;
            23:  x23<= w_data;
            24:  x24<= w_data;
            25:  x25<= w_data;
            26:  x26<= w_data;
            27:  x27<= w_data;
            28:  x28<= w_data;
            29:  x29<= w_data;
            30:  x30<= w_data;
            31:  x31<= w_data;
            default: x0 <= 'b0;
        endcase
        end
   end
endmodule
