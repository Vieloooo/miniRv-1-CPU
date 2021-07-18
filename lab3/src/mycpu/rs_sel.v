module rs_sel (
    input [1:0] r_sel,
   input [31:0] id,
   input [31:0] ex,
   input [31:0] dm,
   input [31:0] wb,
   output [31:0] rs_data
);
    assign rs_data = (r_sel == 0) ? id :
                     (r_sel == 1) ? ex:
                     (r_sel == 2) ? dm:
                     wb;
    
endmodule