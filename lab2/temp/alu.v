module alu (
    input [31:0] data1,
    input [31:0] data2,
    input [2:0] alu_sel,
    output reg [31:0] c
);
sll asll(data1,data2,sll_out);
srl asrl(data1,data2,srl_out);
sra asra(data1,data2,sra_out);
always @(*) begin
    case (alu_sel)
        0: c = (data1 + data2);
        1: c = (data1 - data2);
        2: c = (data1 & data2);
        3: c = (data1 | data2);
        4: c = (data1 ^ data2);
        5: c = sll_out;
        6: c = srl_out;
        7: begin
            if (data1[31]=='b1) c = sra_out;
            else c = srl_out;
        end 
        default: c = 'b0;
    endcase
end
    
endmodule