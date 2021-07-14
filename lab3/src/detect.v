module detect (
    input rst,
    input [4:0] if_rs1,
    input [4:0] if_rs2,
    input [4:0] id_rd,
    input [4:0] ex_rd,
    input [4:0] dm_rd,
    input  id_en,
    input  ex_en,
    input  dm_en,
    output reg halt_if,
    output reg halt_id,
    output reg halt_ex,
);
always @(*) begin
    if (rst == 'b0)begin
        halt_if = 0;
        halt_id = 0;
        halt_ex = 0;
    end else begin
        if( id_en && (id_rd==if_rs1 || id_rd==if_rs1) ) begin
            halt_if = 1;
            halt_id = 1;
            halt_ex = 1;
        end
        else if(ex_en && (ex_rd==if_rs1 || ex_rd==if_rs1))begin
            halt_if = 1;
            halt_id = 1;
            halt_ex = 0;
        end
        else if(dm_en && (dm_rd==if_rs1 || dm_rd==if_rs1))begin
            halt_if = 1;
            halt_id = 0;
            halt_ex = 0;
        end
        else begin
            halt_if = 0;
            halt_id = 0;
            halt_ex = 0;
        end
    end
end
    
endmodule