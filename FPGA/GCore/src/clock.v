// Clock

`define s1 3'b000  // pc out
`define s2 3'b001  // opram out
`define s3 3'b010  // mem out & acc out
`define s4 3'b011  // alu out
`define s5 3'b100  // mem read & acc read
`define s6 3'b101
`define s7 3'b110
`define s8 3'b111

module clock(clk_in, pc, opram, mem, acc, alu, ena, rst);

input clk_in, ena, rst;

output pc, opram, mem, acc, alu;

reg pc, opram, mem, acc, alu;
reg [2:0] state;

always @(posedge clk_in or negedge rst)
    begin
        if(!rst)
            begin
                state <= 3'b000;
                pc <= 1'b0;
                opram <= 1'b0;
                mem <= 1'b0;
                acc <= 1'b0;
                alu <= 1'b0;
            end
        else
            begin
                if(ena)
                     begin
                         case(state)
                             `s1:
                                 begin
                                     pc <= 1'b1;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s2;
                                 end
                             `s2:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b1;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s3;
                                 end
                             `s3:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b1;
                                     acc <= 1'b1;
                                     alu <= 1'b0;
                                     state <= `s4;
                                 end
                             `s4:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b1;
                                     state <= `s5;
                                 end
                             `s5:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b1;
                                     acc <= 1'b1;
                                     alu <= 1'b0;
                                     state <= `s6;
                                 end
                             `s6:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s7;
                                 end
                             `s7:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s8;
                                 end
                             `s8:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s1;
                                 end
                             default:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= `s1;
                                 end
                         endcase
                    end
            end
    end              
endmodule