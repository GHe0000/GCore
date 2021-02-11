// GCore CPU Top

module top(clk, rst, out_sel, led_out, clk_out);

// IO
input clk;
input rst;
input out_sel;

output clk_out;
output [7:0] led_out;

// Control Signal
wire jump, branch, zero, accwrite, memwrite, memread;

wire [1:0] accdst;
wire [2:0] aluop;

// Data Access
wire [7:0] op, op_addr, acc_data, mem_data, alu_data, mux_data;

// Clock
wire pc_clk, opram_clk, mem_clk, acc_clk, led_out_clk;
wire clk_t;

// Clk Out
assign clk_out = !(led_out_clk);

// Module
led led(
    .acc(acc_data),
    .addr(op_addr),
    .out(led_out),
    .out_sel(out_sel),
    .clk(led_out_clk)
    );

test_clk test_clk(
    .clk_in(clk),
    .rst(rst),
    .clk_out(clk_t)
    );

clk_gen clk_gen(
    .clk_in(clk_t),
    .pc_clk(pc_clk),
    .opram_clk(opram_clk),
    .mem_clk(mem_clk),
    .acc_clk(acc_clk),
    .led_out_clk(led_out_clk),
    .ena(1'b1),
    .rst(rst)
    );

pc pc(
    .jump(jump|(branch&zero)),
    .clk(pc_clk),//!
    .addr(op_addr),
    .jumpaddr(mem_data),
    .rst(rst)
    );

opram_control opram_control(
    .write(1'b0),
    .clk(opram_clk),
    .rst(1'b1),
    .addr(op_addr),
    .writeop(8'b0000_0000),
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
    .clk(mem_clk),
    .rst(rst),
    .data(mem_data)
    );

mux mux(
    .a(mem_data),
    .b({4'b0, op[3:0]}),
    .c(alu_data),
    .d({acc_data[3:0], 4'b0}),
    .sel(accdst),
    .out(mux_data)
    );

accum accum(
    .writedata(mux_data),
    .write(accwrite),
    .clk(acc_clk),
    .rst(rst),
    .data(acc_data)
    );

alu alu(
    .alu_op(aluop),
    .a(acc_data),
    .b(mem_data),
    .ans(alu_data),
    .zero(zero)
    );

endmodule