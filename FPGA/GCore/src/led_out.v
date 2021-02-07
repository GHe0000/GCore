// LED Pin out

module led_out(acc, addr, out, clk, sel_out);

input clk;
input [7:0] acc, addr;

output sel_out;
output [7:0] out;

reg [7:0] out;
reg sel_out, state;

always @(posedge clk)
    begin
        if(!state)
            begin
                out = acc;
                sel_out = 1'b0;
                state = 1'b1;
            end
        else
            begin
                out = addr;
                sel_out = 1'b1;
                state = 1'b0;
            end
    end
endmodule

/*
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
*/