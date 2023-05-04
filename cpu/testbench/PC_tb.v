module PC_tb();
    reg reset = 0;
    reg[31:0] new_address = 0;

    initial 
    begin
        //Test Case 1 - Reset without value
        # 5 reset = 1;
        # 5 reset = 0;

        //Test Case 2 - Non-0 address
        # 5 new_address = 10;

        //Test Case 3 - Reset with value 
        # 5 reset = 1;
        # 5 reset = 0;

        //Test Case 4 - Non-0 address
        # 5 new_address = 30;
        # 5
        
        $finish;
    end

    wire [31:0] out;

    PC pc (out, clk, reset, new_address);
    reg clk = 0;
    always #1 clk = !clk;

    initial
    begin
        $dumpfile("pc.vcd");
        $dumpvars(0, PC_tb);

    end
    
endmodule