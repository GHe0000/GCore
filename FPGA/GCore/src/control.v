// CONTROLLER

`define NOP   4'b0000
`define JUMP  4'b0001
`define SAVE  4'b0010
`define LOAD  4'b0011
`define LOADI 4'b0100
`define SLL   4'b0101
`define ADD   4'b1000
`define SUB   4'b1001
`define AND   4'b1010
`define OR    4'b1011
`define XOR   4'b1100
`define SLT   4'b1110
`define BZ    4'b1111

`define MemtoAcc 2'b00
`define ImmtoAcc 2'b01
`define ALUtoAcc 2'b10
`define SLLtoAcc 2'b11

`define mux_off 2'bxx
`define alu_off 3'bxxx

module control(op, jump, branch, aluop, accwrite, accdst, memread, memwrite);

input [3:0] op;

output jump, branch, accwrite, memread, memwrite;
output [2:0] aluop;
output [1:0] accdst;

reg [2:0] aluop;
reg [1:0] accdst;
reg jump, branch, accwrite, memread, memwrite;

always @(op)
    begin
        if(op[3]==1)
            begin
                aluop<=op[2:0];
                if(op==`BZ)
                    begin
                        jump<=0;
                        branch<=1;
                        accwrite<=0;
                        memread<=1;
                        memwrite<=0;
                        accdst<=`mux_off;
                    end
                else
                    begin
                        jump<=0;
                        branch<=0;
                        accwrite<=1;
                        memread<=1;
                        memwrite<=0;
                        accdst<=`ALUtoAcc;
                    end
            end
        else
            aluop<=`alu_off; 
            begin
                case(op)
                    `JUMP:
                        begin
                            jump<=1;
                            branch<=0;
                            accwrite<=0;
                            memread<=1;
                            memwrite<=0;
                            accdst<=`mux_off;
                        end
                    `SAVE:
                        begin
                            jump<=0;
                            branch<=0;
                            accwrite<=0;
                            memread<=0;
                            memwrite<=1;
                            accdst<=`mux_off;
                        end
                    `LOAD:
                        begin
                            jump<=0;
                            branch<=0;
                            accwrite<=1;
                            memread<=1;
                            memwrite<=0;
                            accdst<=`MemtoAcc;
                        end
                    `LOADI:
                        begin
                            jump<=0;
                            branch<=0;
                            accwrite<=1;
                            memread<=0;
                            memwrite<=0;
                            accdst<=`ImmtoAcc;
                        end    
                    `SLL:
                        begin 
                            jump<=0;
                            branch<=0;
                            accwrite<=1;
                            memread<=0;
                            memwrite<=0;     
                            accdst<=`SLLtoAcc;
                        end
                endcase
            end
    end    
endmodule
