// Mem Control
// 16-8

module mem_control(write, read, clk, writedata, data, addr, rst);

input [7:0] writedata;
input [3:0] addr;
input write, read, clk, rst;

output [7:0] data;

//--------Copy here to design--------

mem mem(
    .dout(data), //output [7:0] dout
    .clk(clk), //input clk
    .oce(read), //input oce
    .ce(1'b1), //input ce
    .reset(!rst), //input reset
    .wre(write), //input wre
    .ad(addr), //input [1:0] ad
    .din(writedata) //input [7:0] din
);
//--------Copy end-------------------
endmodule
