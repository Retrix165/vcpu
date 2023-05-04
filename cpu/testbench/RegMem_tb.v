module RegMem_tb();

    reg[4:0]    reg1_addr,
                reg2_addr,
                regW_addr;
    
    reg[31:0]   regW_val;
    reg         regWrite,
                clk = 0;

    wire[31:0]  read1,
                read2;

   
    RegMem rm(  .o_read1(read1),
                .o_read2(read2), 
                .i_reg1_addr(reg1_addr), 
                .i_reg2_addr(reg2_addr), 
                .i_regW_addr(regW_addr),
                .i_regW_val(regW_val),
                .i_RegWrite(regWrite),
                .i_clock(clk));

    always # 5 clk = !clk;
    initial begin
        
        # 1 
        
        //Reads registers but doens't write until clock rises
        reg1_addr = 3;
        reg2_addr = 2;
        regW_addr = 3;
        regW_val =  4;
        regWrite = 1;

        # 5

        //Shows write completion, won't write new withough RegWrite set
        reg1_addr = 3;
        reg2_addr = 2;
        regW_addr = 2;
        regW_val =  6;
        regWrite = 0;

        #5 
        //Shows write completion
        regWrite = 1;

        #5

        $finish;
    end

    initial
    begin
        $dumpfile("regmem.vcd");
        $dumpvars(0, RegMem_tb);
    end

endmodule
