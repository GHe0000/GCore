// LED Pin out

module led(acc, addr, out, out_sel, clk);

input out_sel;
input clk;
input [7:0] acc, addr;

output [7:0] out;

reg [7:0] out;

always @(posedge clk)
    begin
        if(!out_sel)
            out = addr;
        else
            out = acc;
    end

endmodule