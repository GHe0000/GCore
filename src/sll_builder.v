//SLL-Builder

module sll_builder(in, out);

    input [7:0] in;

    output [7:0] out;

    assign out[7:4] = in[3:0];
    assign out[3:0] = 4'b0000;

endmodule
