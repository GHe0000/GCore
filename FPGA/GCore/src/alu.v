// ALU OP Code define

`define ALU_ADD 3'b000
`define ALU_SUB 3'b001
`define ALU_AND 3'b010
`define ALU_OR  3'b011
`define ALU_XOR 3'b100
`define ALU_SLT 3'b110
`define ALU_BZ  3'b111

module alu(alu_op, a, b, clk, ans, zero);

input [7:0] a, b;
input [2:0] alu_op;
input clk;

output [7:0] ans;
output zero;

reg [7:0] ans;

assign zero = !ans;

always @(posedge clk)
    begin
        case(alu_op)
            `ALU_ADD : ans <= a + b;
            `ALU_SUB : ans <= a - b;
            `ALU_AND : ans <= a & b;
            `ALU_OR  : ans <= a | b;
            `ALU_XOR : ans <= a ^ b;
            `ALU_SLT : ans <= a <  b ? 1:0;
            `ALU_BZ  : ans <= a == 0 ? 1:0;
             default : ans <= 8'bxxxx_xxxx;
        endcase
    end
endmodule
