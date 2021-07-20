module pc4_aluc_sel (
    input [31:0] pc,
    input [31:0] aluc,
    input [31:0] imm,
    input [1:0]  wb_sel,
    output [31:0] for_id
);
    assign for_id = (wb_sel=='b0) ? (pc+4):
		    (wb_sel=='b01) ? aluc:
		    (wb_sel== 'b10) ? 'b0:
			imm;
endmodule