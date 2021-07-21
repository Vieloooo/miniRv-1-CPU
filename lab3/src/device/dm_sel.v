module dm_sel (
    input clk,
    input [31:0] addr,
    input wen,
    input [31:0] wdata,
    input [23:0] kg,
    output reg [31:0] rdata,
    output  [7:0] r1,
    output  [7:0] r2,
    output  [7:0] r3,
    output  [7:0] r4,
    output [23:0] lights
);
 reg dram_wen,led_wen,dig_wen;
    dig mydig(clk,wdata,dig_wen,r1,r2,r3,r4);
    led myled(clk,wdata,led_wen,lights);
    wire [31:0] dram_rdata;
    always @(*) begin
        if(addr == 32'hfffff000) rdata = {8'b0,kg};
        else if (addr == 32'hfffff001)  rdata = {8'b0,lights};
        else if (addr == 32'hfffff002)  rdata = {r1,r2,r3,r4};
        else rdata = dram_rdata;
    end
   
    always @(*) begin
        if(addr == 32'hfffff001)led_wen= wen;
        else led_wen = 0;
    end
    always @(*) begin
        if(addr == 32'hfffff002)dig_wen= wen;
        else led_wen = 0;
    end
    always @(*) begin
        if(addr[31:12] != 20'hfffff) dram_wen = wen;
        else dram_wen = 0;
    end
endmodule