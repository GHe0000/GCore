// PROGRAM COUNTER

module pc(jump, clk, addr, jumpaddr, rst);

    input [7:0] jumpaddr;
    input jump, clk, rst;
    
    output [7:0] addr;
    
    reg[7:0] pc;
    
    assign addr = pc;
    
    always @(posedge clk)
        begin
            if(rst)
                pc <= 8'b0000_0000;
            else
                if(jump)
                    pc <= jumpaddr;
                else
                    pc <= pc + 1;
        end
endmodule