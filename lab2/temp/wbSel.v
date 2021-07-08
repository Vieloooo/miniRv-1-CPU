module wbSel (
    input [2:0] wb_sel,
    input [31:0] pc4,
    input [31:0] aluc,
    input [31:0] dram,
    output [31:0] wb_data,
    input [31:0] imm

);
    assign wb_data = (wb_sel == 0) ? pc4 :
                     (wb_sel == 1) ? aluc:
                     (wb_sel == 2) ? dram:
                     (wb_sel == 3) ? 1:
                     (wb_sel == 4) ? 0:
                     imm;
endmodule

