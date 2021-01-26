// Opram Control

//`include "opram/opram.v"

module opram_control(write, writeop, clk, op, addr, rst);
    input [7:0] writeop;
    input [3:0] addr;
    input write, clk, rst;

    output [7:0] op;
//--------Copy here to design--------

    opram opram(
        .dout(op), //output [7:0] dout
        .clk(clk), //input clk
        .oce(!(write)), //input oce
        .ce(1'b1), //input ce
        .reset(rst), //input reset
        .wre(write), //input wre
        .ad(addr), //input [2:0] ad
        .din(writeop) //input [7:0] din
    );
//--------Copy end-------------------
endmodule