module ControlSignals_tb();

    reg[6:0]   opcode;

    wire    ALUSrc,
            MemToReg,
            RegWrite,
            MemRead,
            MemWrite,
            Branch;
    
    wire[1:0]   ALUOp;
    wire[2:0]   ImmSrc;

   ControlSignals cs(  .o_ALUSrc(ALUSrc), 
                        .o_MemtoReg(MemToReg),
                        .o_RegWrite(RegWrite),
                        .o_MemRead(MemRead),
                        .o_MemWrite(MemWrite),
                        .o_Branch(Branch),
                        .o_ALUOp(ALUOp),
                        .o_ImmSrc(ImmSrc),
                        .i_opcode(opcode));

    initial begin
        # 10
        // Test case 1 - R Format
        opcode = 7'b0110011;

        # 10
        // Test case 2 - I Format Arithmetic
        opcode = 7'b0010011;

        # 10
        // Test case 3 - I Format Load
        opcode = 7'b0000011;

        # 10
        // Test case 4 - S Format
        opcode = 7'b0100011;

        # 10
        // Test case 5 - B Format
        opcode = 7'b1100011;

        # 10
        // Test case 6 - JAL Instruction
        opcode = 7'b1101111;

        # 10
        // Test case 7 - JALR Instruction
        opcode = 7'b1100111;

        # 10
        // Test case 8 - U Format
        opcode = 7'b0010111;

        # 10
        $finish;
    end

     initial
    begin
        $dumpfile("controlsignals.vcd");
        $dumpvars(0, ControlSignals_tb);
    end

endmodule
