// CONTROLLER

module control(op, jump, branch, aluop, accwrite, accdst, memread, memwrite);

input [3:0] op;

output jump, branch, accwrite, memread, memwrite;
output [2:0] aluop;
output [1:0] accdst;

reg [2:0] aluop;
reg [1:0] accdst;
reg jump, branch, accwrite, memread, memwrite;

parameter NOP   = 4'b0000,
          JUMP  = 4'b0001,
          SAVE  = 4'b0010,
          LOAD  = 4'b0011,
          LOADI = 4'b0100,
          SLL   = 4'b0101,
          ADD   = 4'b1000,
          SUB   = 4'b1001,
          AND   = 4'b1010,
          OR    = 4'b1011,
          XOR   = 4'b1100,
          SLT   = 4'b1110,
          BZ    = 4'b1111,

          MemtoAcc = 2'b00,
          ImmtoAcc = 2'b01,
          ALUtoAcc = 2'b10,
          SLLtoAcc = 2'b11,

          mux_off = 2'bxx,
          alu_off = 3'bxx;

/*
always @(op)
    begin
        if(op[3]==1)
            begin
                aluop = op[2:0];
                if(op == BZ)
                    begin
                        jump = 0;
                        branch = 1;
                        accwrite = 0;
                        memread = 1;
                        memwrite = 0;
                        accdst = mux_off;
                    end
                else
                    begin
                        jump = 0;
                        branch = 0;
                        accwrite = 1;
                        memread = 1;
                        memwrite = 0;
                        accdst = ALUtoAcc;
                    end
            end
        else
            aluop = alu_off; 
            begin
                case(op)
                    JUMP:
                        begin
                            jump = 1;
                            branch = 0;
                            accwrite = 0;
                            memread = 1;
                            memwrite = 0;
                            accdst = mux_off;
                        end
                    SAVE:
                        begin
                            jump = 0;
                            branch = 0;
                            accwrite = 0;
                            memread = 0;
                            memwrite = 1;
                            accdst = mux_off;
                        end
                    LOAD:
                        begin
                            jump = 0;
                            branch = 0;
                            accwrite = 1;
                            memread = 1;
                            memwrite = 0;
                            accdst = MemtoAcc;
                        end
                    LOADI:
                        begin
                            jump = 0;
                            branch = 0;
                            accwrite = 1;
                            memread = 0;
                            memwrite = 0;
                            accdst = ImmtoAcc;
                        end    
                    SLL:
                        begin 
                            jump = 0;
                            branch = 0;
                            accwrite = 1;
                            memread = 0;
                            memwrite = 0;     
                            accdst = SLLtoAcc;
                        end
                    default:
                        begin
                            jump = 0;
                            branch = 0;
                            accwrite = 0;
                            memread = 0;
                            memwrite = 0;     
                            accdst = mux_off;
                        end
                endcase
            end
    end
*/

always @(op)
    begin
        case(op)
            ADD:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            SUB:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            AND:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            OR:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            XOR:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            SLT:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= ALUtoAcc;
                    aluop <= op[2:0];
                end
            BZ:
                begin
                    jump <= 0;
                    branch <= 1;
                    accwrite <= 0;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= mux_off;
                    aluop <= op[2:0];
                end
            JUMP:
                begin
                    jump <= 1;
                    branch <= 0;
                    accwrite <= 0;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= mux_off;
                    aluop <= alu_off;
                end
            SAVE:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 0;
                    memread <= 0;
                    memwrite <= 1;
                    accdst <= mux_off;
                    aluop <= alu_off;
                end
            LOAD:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 1;
                    memwrite <= 0;
                    accdst <= MemtoAcc;
                    aluop <= alu_off;
                end
            LOADI:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 0;
                    memwrite <= 0;
                    accdst <= ImmtoAcc;
                    aluop <= alu_off;
                end
            SLL:
                begin 
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 1;
                    memread <= 0;
                    memwrite <= 0; 
                    accdst <= SLLtoAcc;
                    aluop <= alu_off;
                end
            default:
                begin
                    jump <= 0;
                    branch <= 0;
                    accwrite <= 0;
                    memread <= 0;
                    memwrite <= 0; 
                    accdst <= mux_off;
                    aluop = alu_off;
                end
        endcase
    end
endmodule
