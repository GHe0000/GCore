// CPU Top

// -------- Include ----------
//`include "accum.v"
//`include "alu.v"
//`include "clock.v"
//`include "control.v"
//`include "imm_builder.v"
//`include "mem_control.v"
//`include "mux.v"
//`include "opram_control.v"
//`include "pc.v"
//`include "sll_builder.v"
// --------------------------


module top(clk, rst, write, writeop, writeaddr, acc_out);

// -------- I/O Set ---------
// Control
input clk;
input rst;

// Set OP
input write;
input [7:0] writeop;
input [7:0] writeaddr; 

// Out
output [7:0] acc_out;
// --------------------------

reg [7:0] op;
assign acc_out = acc_data;

always @ *
    op <= op_reg;

// ------- Module Set -------
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
    .op(op_reg)
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

imm_builder imm_builder(
    .in(op[3:0]),
    .out(imm_data)
    );

sll_builder sll_builder(
    .in(acc_data),
    .out(sll_data)
    );

mux mux(
    .a(mem_data),
    .b(imm_data),
    .c(alu_data),
    .d(sll_data),
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
    .op(aluop),
    .a(acc_data),
    .b(mem_data),
    .clk(clk),//!
    .ans(alu_data),
    .zero(zero)
    );
// --------------------------
endmodule
