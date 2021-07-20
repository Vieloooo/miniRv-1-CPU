
module top (
    input  wire clk,
    input  wire rst_n,
    output wire led0_en,
    output wire led1_en,
    output wire led2_en,
    output wire led3_en,
    output wire led4_en,
    output wire led5_en,
    output wire led6_en,
    output wire led7_en,
    output wire led_ca,
    output wire led_cb,
    output wire led_cc,
    output wire led_cd,
    output wire led_ce,
    output wire led_cf,
    output wire led_cg,
    output wire led_dp
);
  wire clk_out;
  clk_wiz_0 myclk
   (
    // Clock out ports
    .clk_out1(clk_out),     // output clk_out1
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
    wire clk_o;
    assign clk_o = clk_out & locked;
    div_1k mydiv(clk_o,rst_n,clk_display);
    
    wire [31:0] pc,ins,dram_wdata,dram_rdata;
    wire [31:0]   dram_addr;
    wire [31:0] debug_x19;
    cpu acpu(rst_n,clk_o,pc,ins,dram_wen,dram_wdata,dram_addr,dram_rdata,debug_x19);
    wire [31:0] waddr_tmp = dram_addr - 16'h4000;
    prgrom irom(pc[15:2],ins);
    dram U_dram (
        .clk    (~clk_o),
        .a      (waddr_tmp[15:2]),
        .spo    (dram_rdata),
        .we     (dram_wen),
        .d      (dram_wdata)
    );
    display dig(
    .clk(clk_display),
    . rst_n(rst_n),
    .z1(debug_x19[31:24])   ,
    .r1(debug_x19[23:16])    ,
    .z2(debug_x19[15:8])   ,
    .r2(debug_x19[7:0])    ,
   .led0_en(led0_en),
    .led1_en(led1_en),
    .led2_en(led2_en),
    .led3_en(led3_en),
     .led4_en(led4_en),
     .led5_en(led5_en),
     .led6_en(led6_en),
      .led7_en(led7_en),
      .led_ca(led_ca),
      .led_cb(led_cb) ,
      .led_cc(led_cc),
      .led_cd(led_cd) ,
      .led_ce(led_ce),
      .led_cf(led_cf) ,
      .led_cg(led_cg) ,
      .led_dp(led_dp)
);
endmodule
