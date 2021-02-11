
module clk_gen(clk_in, out, rst, acc_write);

input clk_in, rst;

output out, acc_write;

reg [1:0] s;
reg out, acc_write;

always @(posedge clk_in or negedge rst)
    begin
        if(!rst)
            begin
                out <= 1'b0;
                acc_write <= 1'b0;
                s <= 2'b00;
            end
        else
            begin
                case(s)
                    2'b00:
                        begin
                            out <= 1'b1;
                            acc_write <= 1'b0;
                            s <= 2'b01;
                        end
                    2'b01:
                        begin
                            out <= 1'b0;
                            acc_write <= 1'b1;
                            s <= 2'b10;
                        end
                    2'b10:
                        begin
                            out <= 1'b1;
                            acc_write <= 1'b1;
                            s <= 2'b11;
                        end
                    2'b11:
                        begin
                            out <= 1'b0;
                            acc_write <= 1'b0;
                            s <= 2'b00;
                        end
                endcase
            end
    end

endmodule