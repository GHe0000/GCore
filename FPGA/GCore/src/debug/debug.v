//Copyright (C)2014-2020 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.7.01Beta
//Part Number: GW1N-LV1QN48C6/I5
//Device: GW1N-1
//Created Time: Wed Feb 10 19:07:26 2021

module opram (dout, clk, oce, ce, reset, wre, ad, din);

output [7:0] dout;
input clk;
input oce;
input ce;
input reset;
input wre;
input [7:0] ad;
input [7:0] din;

wire [23:0] sp_inst_0_dout_w;
wire gw_gnd;

assign gw_gnd = 1'b0;

SP sp_inst_0 (
    .DO({sp_inst_0_dout_w[23:0],dout[7:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .WRE(wre),
    .BLKSEL({gw_gnd,gw_gnd,gw_gnd}),
    .AD({gw_gnd,gw_gnd,gw_gnd,ad[7:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:0]})
);

defparam sp_inst_0.READ_MODE = 1'b0;
defparam sp_inst_0.WRITE_MODE = 2'b00;
defparam sp_inst_0.BIT_WIDTH = 8;
defparam sp_inst_0.BLK_SEL = 3'b000;
defparam sp_inst_0.RESET_MODE = "SYNC";
defparam sp_inst_0.INIT_RAM_00 = 256'h0000000000000000000000000000000000000000000000000010804342412042;
defparam sp_inst_0.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam sp_inst_0.INIT_RAM_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;

endmodule //opram
