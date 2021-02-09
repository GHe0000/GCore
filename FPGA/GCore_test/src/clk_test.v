// Test

module clk_test(clk_in, rst, clk_out);

parameter wide = 24,
          c = 24'd1200_0000,
          zero = 24'd0,
          d = 24'd1;

localparam c2 = c / 2;

input clk_in;
input rst;

output clk_out;

reg [wide-1:0] counter;
reg clk_out;

always @(posedge clk_in or negedge rst)
    begin
        if (!rst)
            counter <= zero;
        else
            if (counter <c)
                counter <= counter + d;
            else
                counter <= zero;
    end

always @(posedge clk_in or negedge rst)
    begin
        if (!rst)
            clk_out <= 1'b0;
        else
            begin
                if ((counter < c)&(counter > (c2)))
                    clk_out <= 1'b1;
                else
                    clk_out <= 1'b0;
            end
    end
endmodule