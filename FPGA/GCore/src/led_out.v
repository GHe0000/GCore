// LED Pin out

module led_out(acc, addr, out, sel, clk);

input sel;
input clk;
input [7:0] acc, addr;
output [7:0] out;

reg [7:0] out;

always @(posedge clk)
    begin
        if(sel)
            out = acc;
        else
            out = addr;
    end
endmodule