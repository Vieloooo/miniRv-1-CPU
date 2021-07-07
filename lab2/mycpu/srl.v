module srl (
    input [31:0] data,
    input [31:0] shiftBits,
    output reg [31:0] sdata
);
    always @(*) begin
        case (shiftBits[4:0])
        0: sdata = data;
        1: sdata = {1'b0,data[31:1]};
        2: sdata = {2'b0,data[31:2]};
        3: sdata = {3'b0,data[31:3]};
        4: sdata = {4'b0,data[31:4]};
        5: sdata = {5'b0,data[31:5]};
        6: sdata = {6'b0,data[31:6]};
        7: sdata = {7'b0,data[31:7]};
        8: sdata = {8'b0,data[31:8]};
        9: sdata = {9'b0,data[31:9]};
        10: sdata = {10'b0,data[31:10]};
        11: sdata = {11'b0,data[31:11]};
        12: sdata = {12'b0,data[31:12]};
        13: sdata = {13'b0,data[31:13]};
        14: sdata = {14'b0,data[31:14]};
        15: sdata = {15'b0,data[31:15]};
        16: sdata = {16'b0,data[31:16]};
        17: sdata = {17'b0,data[31:17]};
        18: sdata = {18'b0,data[31:18]};
        19: sdata = {19'b0,data[31:19]};
        20: sdata = {20'b0,data[31:20]};
        21: sdata = {21'b0,data[31:21]};
        22: sdata = {22'b0,data[31:22]};
        23: sdata = {23'b0,data[31:23]};
        24: sdata = {24'b0,data[31:24]};
        25: sdata = {25'b0,data[31:25]};
        26: sdata = {26'b0,data[31:26]};
        27: sdata = {27'b0,data[31:27]};
        28: sdata = {28'b0,data[31:28]};
        29: sdata = {29'b0,data[31:29]};
        30: sdata = {30'b0,data[31:30]};
        31: sdata = {31'b0,data[31]};
        default: sdata= 'b0;
    endcase
    end
    
endmodule