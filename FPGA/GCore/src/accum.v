// ACCUMULATOR

module accum(write, clk, data, writedata, rst);

input [7:0] writedata;
input write, clk, rst;

output [7:0] data;
reg[7:0] accum;

assign data = accum;

always @(posedge clk)
    begin
        if(rst)
            accum <= 8'b0000_0000;
        else
            if(write)
                accum <= writedata;
    end
endmodule
