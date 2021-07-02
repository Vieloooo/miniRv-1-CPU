module sll (
    input [31:0] data,
    input [31:0] shiftBits,
    output reg [31:0] sdata
);
    always @(*) begin
        case (shiftBits[4:0])
        0: sdata = data;
        1: sdata = {data[30:0],1'b0};
        2: sdata = {data[29:0],2'b0};
        3: sdata = {data[28:0],3'b0};
        4: sdata = {data[27:0],4'b0};
        5: sdata = {data[26:0],5'b0};
        6: sdata = {data[25:0],6'b0};
        7: sdata = {data[24:0],7'b0};
        8: sdata = {data[23:0],8'b0};
        9: sdata = {data[22:0],9'b0};
        10: sdata = {data[21:0],10'b0};
        11: sdata = {data[20:0],11'b0};
        12: sdata = {data[19:0],12'b0};
        13: sdata = {data[18:0],13'b0};
        14: sdata = {data[17:0],14'b0};
        15: sdata = {data[16:0],15'b0};
        16: sdata = {data[15:0],16'b0};
        17: sdata = {data[14:0],17'b0};
        18: sdata = {data[13:0],18'b0};
        19: sdata = {data[12:0],19'b0};
        20: sdata = {data[11:0],20'b0};
        21: sdata = {data[10:0],21'b0};
        22: sdata = {data[9:0],22'b0};
        23: sdata = {data[8:0],23'b0};
        24: sdata = {data[7:0],24'b0};
        25: sdata = {data[6:0],25'b0};
        26: sdata = {data[5:0],26'b0};
        27: sdata = {data[4:0],27'b0};
        28: sdata = {data[3:0],28'b0};
        29: sdata = {data[2:0],29'b0};
        30: sdata = {data[1:0],30'b0};
        31: sdata = {data[0],31'b0};
        default: sdata= 'b0;

    endcase
    end
    
endmodule