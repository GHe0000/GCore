// PROGRAM COUNTER

module pc(jump, clk, addr, jumpaddr, rst);

input [7:0] jumpaddr;
input jump, clk, rst;
    
output [7:0] addr;

reg[7:0] addr;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            addr <= 8'b0;
        else
            begin
                if(jump)
                    addr <= jumpaddr;
                else
                    begin
                        if(addr == 8'b1111_1111)
                            addr <= 8'b0;
                        else
                            addr <= addr + 8'b1;
                    end
            end
    end

endmodule
