module ImmediateGenerator_tb();

    reg[31:0]   instruction;
    reg[2:0]    ImmSrc;

    wire[31:0]  immediate;

   
    ImmediateGenerator ig ( .o_immediate(immediate), 
                            .i_instruction(instruction), 
                            .i_ImmSrc(ImmSrc));
    initial begin
        # 10
        //instruction = 8'h003100b3;
        instruction = 3211443;
        ImmSrc = 1;

        # 10
        $finish;
    end

     initial
    begin
        $dumpfile("immediategenerator.vcd");
        $dumpvars(0, ImmediateGenerator_tb);
    end

endmodule
