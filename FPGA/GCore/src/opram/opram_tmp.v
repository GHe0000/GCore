//Copyright (C)2014-2020 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.7.01Beta
//Part Number: GW1N-LV1QN48C6/I5
//Device: GW1N-1
//Created Time: Sat Jan 23 17:20:52 2021

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    opram your_instance_name(
        .dout(dout_o), //output [7:0] dout
        .clk(clk_i), //input clk
        .oce(oce_i), //input oce
        .ce(ce_i), //input ce
        .reset(reset_i), //input reset
        .wre(wre_i), //input wre
        .ad(ad_i), //input [2:0] ad
        .din(din_i) //input [7:0] din
    );

//--------Copy end-------------------
