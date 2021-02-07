// Clock

module clk_gen(clk_in, pc, opram, mem, acc, alu, ena, rst, out);

input clk_in, ena, rst;

output pc, opram, mem, acc, alu, out;

reg pc, opram, mem, acc, alu, out;
reg [2:0] state;

parameter s1 = 3'b000,  // pc out
          s2 = 3'b001,  // opram out
          s3 = 3'b010,  // mem out & acc out
          s4 = 3'b011,  // alu out
          s5 = 3'b100,  // mem read & acc read
          s6 = 3'b101,
          s7 = 3'b110,
          s8 = 3'b111;

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
                out <= 1'b0;
            end
        else
            begin
                if(ena)
                     begin
                         case(state)
                             s1:
                                 begin
                                     pc <= 1'b1;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     out <= 1'b0;
                                     state <= s2;
                                 end
                             s2:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b1;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     out <= 1'b0;
                                     state <= s3;
                                 end
                             s3:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b1;
                                     acc <= 1'b1;
                                     alu <= 1'b0;
                                     out <= 1'b0;
                                     state <= s4;
                                 end
                             s4:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b1;
                                     out <= 1'b0;
                                     state <= s5;
                                 end
                             s5:
                                 begin
                                     pc <= 1'b1;
                                     opram <= 1'b0;
                                     mem <= 1'b1;
                                     acc <= 1'b1;
                                     alu <= 1'b0;
                                     out <= 1'b0;
                                     state <= s6;
                                 end
                             s6:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     //out <= 1'b0;
                                     out <= 1'b1;
                                     state <= s7;
                                 end
                             s7:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     out <= 1'b0;
                                     state <= s8;
                                 end
                             s8:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     out <= 1'b1;
                                     state <= s1;
                                 end
                             default:
                                 begin
                                     pc <= 1'b0;
                                     opram <= 1'b0;
                                     mem <= 1'b0;
                                     acc <= 1'b0;
                                     alu <= 1'b0;
                                     state <= s1;
                                 end
                         endcase
                    end
            end
    end              
endmodule