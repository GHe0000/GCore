// MULTIPLEXOR

module mux(a, b, c, d, sel, out);

input [7:0] a, b, c, d;
input [1:0] sel;

output [7:0] out;

reg [7:0] out;

always @(a, b, c, d, sel)
    begin
        case(sel)
            2'b00:out = a;
            2'b01:out = b;
            2'b10:out = c;
            2'b11:out = d;
            default:out = 8'bxxxx_xxxx;
        endcase
    end
endmodule
