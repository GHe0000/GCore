// PROGRAM COUNTER

module pc(jump, clk, addr, jumpaddr, rst);

input [7:0] jumpaddr;
input jump, clk, rst;
    
output [7:0] addr;

reg[7:0] addr;
reg state;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                addr <= 8'b0;
                state <= 0;
            end
        else
            begin
                if(state)
                    begin
                        state <= 1'b0;
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
                else
                    begin
                        state <= 1'b1;
                    end
            end
                        
    end

/*
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
*/
endmodule
