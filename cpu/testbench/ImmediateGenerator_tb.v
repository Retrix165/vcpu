module ImmediateGenerator_tb();

    reg[31:0]   instruction;
    reg[2:0]    ImmSrc;

    wire[31:0]  immediate;

   
    ImmediateGenerator ig ( .o_immediate(immediate), 
                            .i_instruction(instruction), 
                            .i_ImmSrc(ImmSrc));
    initial begin
        # 10
        //instruction = 8'h003100b3 = add x1, x2, x3 ;
        instruction = 3211443;
        ImmSrc = 0;

        # 10
        //instruction = 8'h00300093 = addi x1 , x0, 3 ;
        instruction = 3145875;
        ImmSrc = 1;

        # 10
        //instruction = 8'h0020a023 = sw x2, (x1);
        instruction = 2138147;
        ImmSrc = 2;

        # 10
        //instruction = 8'hfe208ae3 = beq x1, x2, label3;
        instruction = 4263545571;
        ImmSrc = 3;

        # 10
        //instruction = 8'hff1ff06f = jal x0, label4;
        instruction = 4280283247;
        ImmSrc = 4;

        # 10
        //instruction = 8'h0022b237 = lui x4, 555;
        instruction = 2273847;
        ImmSrc = 5;

        # 10
        $finish;
    end

     initial
    begin
        $dumpfile("immediategenerator.vcd");
        $dumpvars(0, ImmediateGenerator_tb);
    end

endmodule
