
module clk_gen(in, out1, out2, rst, acc_write);

input in, rst;

output out1, out2, acc_write;

reg [1:0] s;
reg out1, out2, acc_write;

always @(posedge in or negedge rst)
    begin
        if(!rst)
            begin
                out1 <= 1'b0;
                out2 <= 1'b0;
                acc_write <= 1'b0;
                s <= 2'b00;
            end
        else
            begin
                case(s)
                    2'b00:
                        begin
                            out1 <= 1'b1;
                            out2 <= 1'b0;
                            acc_write <= 1'b0;
                            s <= 2'b01;
                        end
                    2'b01:
                        begin
                            out1 <= 1'b0;
                            out2 <= 1'b1;
                            acc_write <= 1'b0;
                            s <= 2'b10;
                        end
                    2'b10:
                        begin
                            out1 <= 1'b1;
                            out2 <= 1'b0;
                            acc_write <= 1'b1;
                            s <= 2'b11;
                        end
                    2'b11:
                        begin
                            out1 <= 1'b0;
                            out2 <= 1'b0;
                            acc_write <= 1'b0;
                            s <= 2'b00;
                        end
                endcase
            end
    end

endmodule