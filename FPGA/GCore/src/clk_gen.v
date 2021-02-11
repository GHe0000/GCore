// Clock Generater

module clk_gen(clk_in, pc_clk, opram_clk, mem_clk, acc_clk, led_out_clk, ena, rst);

input clk_in, ena, rst;

output pc_clk, opram_clk, mem_clk, acc_clk, led_out_clk;

reg pc_clk, opram_clk, mem_clk, acc_clk, led_out_clk;
reg [2:0] state;

parameter s1 = 3'b000,
          s2 = 3'b001,
          s3 = 3'b010,
          s4 = 3'b011,
          s5 = 3'b100,
          s6 = 3'b101,
          s7 = 3'b110,
          s8 = 3'b111;

always @(posedge clk_in or negedge rst)
    begin
        if(!rst)
            begin
                state <= 3'b000;
                pc_clk <= 1'b0;
                opram_clk <= 1'b0;
                mem_clk <= 1'b0;
                acc_clk <= 1'b0;
                led_out_clk <= 1'b0;
            end
        else
            begin
                if(ena)
                     begin
                         case(state)
                             s1:
                                 begin
                                     pc_clk <= 1'b1;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s2;
                                 end
                             s2:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b1;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s3;
                                 end
                             s3:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b1;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s4;
                                 end
                             s4:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s5;
                                 end
                             s5:
                                 begin
                                     pc_clk <= 1'b1;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b1;
                                     acc_clk <= 1'b1;
                                     led_out_clk <= 1'b0;
                                     state <= s6;
                                 end
                             s6:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s7;
                                 end
                             s7:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b0;
                                     state <= s8;
                                 end
                             s8:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     led_out_clk <= 1'b1;
                                     state <= s1;
                                 end
                             default:
                                 begin
                                     pc_clk <= 1'b0;
                                     opram_clk <= 1'b0;
                                     mem_clk <= 1'b0;
                                     acc_clk <= 1'b0;
                                     state <= s1;
                                 end
                         endcase
                    end
            end
    end              
endmodule