module pc4_aluc_sel (
    input [31:0] pc,
    input [31:0] aluc,
    input wb_sel,
    output [31:0] for_id
);
    assign for_id = (~wb_sel) ? (pc+4):aluc;
endmodule