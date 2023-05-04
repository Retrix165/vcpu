module IMem_tb();

    reg[31:0]   pc;

    wire[31:0]  instruction;

    IMem  #(.filepath("../tests/assembled/rtest.o"), .numInstructions(11)) 
            imem(  .o_instruction(instruction),
                    .i_pc(pc));

    initial begin
        
        # 1
        pc = 0;

        # 1
        pc = 2;

        # 1
        pc = 3;

        # 1
        pc = 4;

        # 1
        pc = 5;

        # 1
        pc = 6;

        # 1
        pc = 7;

        # 1
        pc = 8;

        # 1
        pc = 9;

        # 1
        pc = 10;

        # 1
        
        $finish;
    end

    initial
    begin
        $dumpfile("imem.vcd");
        $dumpvars(0, IMem_tb);
    end

endmodule
