module PC_tb();
    reg reset = 0;
    reg[31:0] new_address = 0;

    initial 
    begin
        # 4 reset = 1;
        # 5 reset = 0;
        # 10 new_address = 10;
        # 50 reset = 1;
        # 51 reset = 0;
        # 60 new_address = 30;
        # 100 $stop;
    end

    wire [31:0] out;

    PC pc (out, clk, reset, new_address);
    reg clk = 0;
    always #1 clk = !clk;

    initial
    begin
        $dumpfile("pc.vcd");
        $dumpvars(0, PC_tb);
        $dumpvars(0, out);
        //$dumpvars(0, out);
        //$dumpvars(0, clk);
        //$dumpvars(0, reset);
        //$dumpvars(0, set);
        //$dumpvars(0, new_address);
    end
    
endmodule