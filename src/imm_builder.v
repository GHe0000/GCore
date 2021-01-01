// Imm-Builder

module imm_bulider(in, out);
    input [3:0] in;

    output [7:0] out;

    assign out[7:4] = 4'b000;
    assign out[3:0] = in;
endmodule
