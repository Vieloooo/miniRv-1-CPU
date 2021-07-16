module detect (
    input [4:0] id_rs1,
    input [4:0] id_rs2,
    input [4:0] ex_rd,
    input [4:0] dm_rd,
    input [4:0] wb_rd,
    input  ex_en,
    input  dm_en,
    input  wb_en,
    output reg [1:0] rs1_sel,
    output reg [1:0] rs2_sel
);
always @(*) begin
       if(ex_en) begin
            if(ex_rd == id_rs1) rs1_sel = 1;
            else rs1_sel = 0;
        end
        else if (dm_en) begin 
            if(dm_rd == id_rs1) rs1_sel = 2;
            else rs1_sel = 0;
        end 
        else if (wb_en) begin 
            if(wb_rd == id_rs1) rs1_sel = 3;
            else rs1_sel = 0;
        end 
        else rs1_sel = 0;
end

always @(*) begin
       if(ex_en) begin
            if(ex_rd == id_rs2) rs2_sel = 1;
            else rs2_sel = 0;
        end
        else if (dm_en) begin 
            if(dm_rd == id_rs2) rs2_sel = 2;
            else rs2_sel = 0;
        end 
        else if (wb_en) begin 
            if(wb_rd == id_rs2) rs2_sel = 3;
            else rs2_sel = 0;
        end 
        else rs2_sel = 0;
end
    
endmodule