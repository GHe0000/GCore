// Opram Control

`define a 8'b10
`define b 8'b101

module top(out, clk, rst, out_clk);

input clk, rst;

output [7:0] out;
output out_clk;

wire clock, acc_clk, acc_write;
wire [7:0] acc_data, alu_data;

assign out_clk = !(acc_clk);
assign out = alu_data;

clk_test clk_test(
    .clk_in(clk),
    .rst(rst),
    .clk_out(clock)
    );

clk_gen clk_gen(
    .clk_in(clock),
    .out(acc_clk), 
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
    .ans(alu_data)
    );

endmodule