module ALU_tb();

    reg[31:0]   op1, 
                op2;
    reg [3:0]   ctl;

    wire        zero, 
                neg;

    wire[31:0]  result;

    ALU alu(
        .o_result(result),
        .o_zero(zero),
        .o_neg(neg),
        .i_operand1(op1),
        .i_operand2(op2),
        .i_ALUControl(ctl)
    );

    initial begin
        // Test case 1 - AND operation
        op1 = 32'hAAAAAAAA;
        op2 = 32'h55555555;
        ctl = 4'b0000;
        
        

        // Test case 2 - OR operation
        # 10 op1 = 32'hAAAAAAAA;
        op2 = 32'h55555555;
        ctl = 4'b0001;
        
        

        // Test case 3 - ADD operation
        # 10 op1 = 10;
        op2 = 20;
        ctl = 4'b0010;
        

        // Test case 4 - XOR operation
        # 10 op1 = 32'hAAAAAAAA;
        op2 = 32'h55555555;
        ctl = 4'b0011;
        

        // Test case 5 - SUB operation
        # 10 op1 = 20;
        op2 = 10;
        ctl = 4'b0110;
        

        // Test case 6 - SHL operation
        # 10 op1 = 16'h0001;
        op2 = 4;
        ctl = 4'b1000;
        

        // Test case 7 - SHR operation
        # 10 op1 = 16'h8000;
        op2 = 4;
        ctl = 4'b1001;
        

        // Test case 8 - SRA operation
        # 10 op1 = -16;
        op2 = 1;
        ctl = 4'b1010;
        
        # 10

        $finish;
    end

     initial
    begin
        $dumpfile("alu.vcd");
        $dumpvars(0, ALU_tb);
    end

endmodule

