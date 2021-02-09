// ALU
module alu(alu_op, a, b, clk, ans);

input [7:0] a, b;
input [2:0] alu_op;
input clk;

output [7:0] ans;

reg [7:0] ans;

parameter ALU_ADD = 3'b000,
          ALU_SUB = 3'b001,
          ALU_AND = 3'b010,
          ALU_OR  = 3'b011,
          ALU_XOR = 3'b100,
          ALU_SLT = 3'b110,
          ALU_BZ  = 3'b111;

always @(posedge clk)
    begin
        casex(alu_op)
            ALU_ADD : ans <= a + b;
            ALU_SUB : ans <= a - b;
            ALU_AND : ans <= a & b;
            ALU_OR  : ans <= a | b;
            ALU_XOR : ans <= a ^ b;
            ALU_SLT : ans <= a <  b ? 1:0;
            ALU_BZ  : ans <= a == 0 ? 1:0;
            default : ans <= 8'bxxxx_xxxx;
        endcase
    end
endmodule