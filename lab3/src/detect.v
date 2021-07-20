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
    output reg [1:0] rs2_sel,
    input  [1:0] wb_sel,
    output reg lu_halt
);
always @(*) begin
      if(ex_en && ex_rd == id_rs1 && id_rs1 !=0)rs1_sel = 1;
      else if(dm_en && dm_rd == id_rs1 && id_rs1!=0) rs1_sel =2;
      else if (wb_en && wb_rd == id_rs1 && id_rs1!=0) rs1_sel=3;
      else rs1_sel =0;
      
end

always @(*) begin
      if(ex_en && ex_rd == id_rs2 && id_rs2 != 0)rs2_sel = 1;
      else if(dm_en && dm_rd == id_rs2 && id_rs2 !=0) rs2_sel =2;
      else if (wb_en && wb_rd == id_rs2 && id_rs2 !=0) rs2_sel=3;
      else rs2_sel =0;
      
end
    always @(*) begin
        if (ex_en && wb_sel == 2 && (ex_rd == id_rs1 || ex_rd == id_rs2) && ex_rd !=0) lu_halt = 1;
        else lu_halt = 0;
        
    end
endmodule
