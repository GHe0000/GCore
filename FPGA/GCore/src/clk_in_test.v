// Test

`define wide 24
`define c 24'd600_0000
`define zero 24'd0
`define d 24'd1

module clk_in_test(clk_in, rst, clk_out);

input clk_in;
input rst;

output clk_out;

reg [`wide-1:0] counter;
reg clk_out;

always @(posedge clk_in or negedge rst)
    begin
        if (!rst)
            counter <= `zero;
        else
            if (counter <`c)
                counter <= counter + `d;
            else
                counter <= `zero;
    end

always @(posedge clk_in or negedge rst)
    begin
        if (!rst)
            clk_out <= 1'b0;
        else
            begin
                if (counter == `c)
                    clk_out <= 1'b1;
                else
                    clk_out <= 1'b0;
            end
    end
endmodule