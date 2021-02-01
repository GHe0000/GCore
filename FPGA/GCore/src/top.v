// GCore CPU Top


//
//module top(clk, rst, write, writeop, writeaddr, write_rst, acc_out);
module top(clk, rst, acc_out);

input clk;
input rst;

//input write, write_rst;
//input [7:0] writeop;
//input [7:0] writeaddr; 

output [7:0] acc_out;

wire jump, branch, zero, accwrite,memwrite, memread;
wire [1:0] accdst;
wire [2:0] aluop;

wire [7:0] op, op_addr, acc_data, mem_data, alu_data, mux_data;

wire pc_clk, opram_clk, mem_clk, acc_clk, alu_clk;

wire clk_t; //Test clk

assign acc_out = acc_data;

clk_in_test clk_in_test(
    .clk_in(clk),
    .rst(rst),
    .clk_out(clk_t)
);//Test module

clock clock(
    .clk_in(clk_t),
    .pc(pc_clk),
    .opram(opram_clk),
    .mem(mem_clk),
    .acc(acc_clk),
    .alu(alu_clk),
    .ena(1'b1),
    .rst(rst)
);

/*
clock clock(
    .clk_in(clk),
    .pc(pc_clk),
    .opram(opram_clk),
    .mem(mem_clk),
    .acc(acc_clk),
    .alu(alu_clk),
    .ena(1'b1),
    .rst(rst)
);
*/

pc pc(
    .jump(jump|(branch&zero)),
    .clk(pc_clk),//!
    .addr(op_addr),
    .jumpaddr(mem_data),
    .rst(rst)
    );

opram_control opram_control(
    .write(1'b0),
    .clk(opram_clk),//!
    .rst(1'b0),
    .addr(op_addr),
    .writeop(8'b0000_0000),
    .op(op)
    );

/*
pc pc(
    .jump(jump|(branch&zero)),
    .clk(pc_clk),//!
    .addr(op_addr),
    .jumpaddr(mem_data),
    .rst(rst)
    );

opram_control opram_control(
    .write(write),
    .clk(opram_clk),//!
    .rst(write_rst),
    .addr(op_addr),
    .writeop(writeop),
    .op(op)
    );
*/
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
    .clk(mem_clk), //!
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
    .clk(acc_clk),//!
    .rst(rst),
    .data(acc_data)
    );

alu alu(
    .alu_op(aluop),
    .a(acc_data),
    .b(mem_data),
    .clk(alu_clk),//!
    .ans(alu_data),
    .zero(zero)
    );

endmodule