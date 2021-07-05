module wbSel (
    input [1:0] wb_sel,
    input [31:0] pc4,
    input [31:0] aluc,
    input [31:0] dram,
    output [31:0] wb_data
);
    assign wb_data = (wb_sel == 0) ? pc4 :
                     (wb_sel == 1) ? aluc:
                     (wb_sel == 2) ? dram:
                     1;

endmodule

