// Opram Control

`define a 8'b1
`define b 8'b101

module top(out, clk, rst, out_clk);

input clk, rst;

output [7:0] out;
output out_clk;

wire clock, acc_clk, alu_clk, acc_write;
wire [7:0] acc_data, alu_data;

assign out_clk = !(alu_clk);
assign out = alu_data;

clk_test clk_test(
    .clk_in(clk),
    .rst(rst),
    .clk_out(clock)
    );

clk_gen clk_gen(
    .in(clock),
    .out1(acc_clk), 
    .out2(alu_clk),
    .rst(rst),
    .acc_write(acc_write)
    );

accum accum(
    .write(acc_write),
    .clk(acc_clk),
    .data(acc_data),
    .writedata(alu_data),
    .rst(rst)
    );

alu alu(
    .alu_op(3'b000),
    .a(`a),
    .b(acc_data),
    .clk(alu_clk),
    .ans(alu_data)
    );

endmodule