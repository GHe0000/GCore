// PROGRAM COUNTER

module pc(jump, clk, addr, jumpaddr, rst);

input [7:0] jumpaddr;
input jump, clk, rst;
    
output [7:0] addr;

reg[7:0] addr;

always @(posedge clk or posedge rst)
    begin
        if(rst)
            addr <= 8'b0000_0000;
        else
            if(jump)
                addr <= jumpaddr;
            else
                addr <= addr + 8'b0000_0001;
    end
endmodule
