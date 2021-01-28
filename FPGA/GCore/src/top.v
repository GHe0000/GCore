// GCore CPU Top

module top(clk, rst, write, writeop, writeaddr, acc_out);

input clk;
input rst;

input write;
input [7:0] writeop;
input [7:0] writeaddr; 

output [7:0] acc_out;

wire jump, branch, zero, accwrite,memwrite, memread;
wire [1:0] accdst;
wire [2:0] aluop;
wire [7:0] op, op_addr, acc_data, mem_data, alu_data, mux_data;

assign acc_out = acc_data;

pc pc(
    .jump(jump|(branch&zero)),
    .clk(clk),//!
    .addr(op_addr),
    .jumpaddr(mem_data),
    .rst(rst)
    );

opram_control opram_control(
    .write(write),
    .clk(clk),//!
    .rst(rst),
    .addr(op_addr),
    .writeop(writeop),
    .op(op)
    );

control control(
    .op(op[7:4]),
    .jump(jump),
    .branch(branch),
    .aluop(aluop),
    .accwrite(accwrite),
    .accdst(accdst),
    .memread(memread),
    .memwrite(memwrite)
    );

mem_control mem_control(
    .write(memwrite),
    .read(memread),
    .addr(op[3:0]),
    .writedata(acc_data),
    .clk(clk), //!
    .rst(rst),
    .data(mem_data)
    );

mux mux(
    .a(mem_data),
    .b({4'b0000, op[3:0]}),
    .c(alu_data),
    .d({acc_data[3:0], 4'b0000}),
    .sel(accdst),
    .out(mux_data)
    );

accum accum(
    .writedata(mux_data),
    .write(accwrite),
    .clk(clk),//!
    .rst(rst),
    .data(acc_data)
    );

alu alu(
    .alu_op(aluop),
    .a(acc_data),
    .b(mem_data),
    .clk(clk),//!
    .ans(alu_data),
    .zero(zero)
    );

endmodule
