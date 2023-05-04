module CPU(i_reset);

    input wire i_reset;

    parameter filepath = "";
    parameter numInstructions = 0;

    //PC & IMem Declaractions
    wire    clk;
    wire[31:0]  cur_instruction_addr,
                new_instruction_addr,
                cur_instruction;
    
    //Control Signals Declarations
    wire[6:0]   opcode;
    wire    cs_ALUSrc,
            cs_MemtoReg,
            cs_RegWrite,
            cs_MemRead,
            cs_MemWrite,
            cs_Branch,
            cs_ALUOp,
            cs_ImmSrc;
    
    //Register Memory Declarations
    wire[4:0]   rs1_addr,
                rs2_addr,
                rW_addr;
    wire[31:0]  rW_value;
    wire[31:0]  r1_value,
                r2_value;
    
    //Immediate Generation Declaractions
    wire[31:0]  immediate;

    //ALUControl Declarations
    wire[3:0]   ALUOperation;

    //ALU Declarations
    wire[31:0]  alu_result,
                alu_source2;
    wire    zero,
            neg;
    
    //Data Memory Declarations
    wire[31:0]  mem_out;

    //PC Calculation Declarations
    wire[31:0]  addr_offset,
                inc_addr,
                change_addr,
                addr_and_offset;
    
    PC pc(  .o_instruction_address(cur_instruction_addr), 
            .clock(clk), 
            i_reset, 
            .new_address(new_instruction_addr));
        
    IMem im(.o_instruction(cur_instruction), 
            .i_pc(cur_instruction_addr));
    
    assign opcode = cur_instruction[6:0];
    ControlSignals cs(  .o_ALUSrc(cs_ALUSrc), 
                        .o_MemtoReg(cs_MemtoReg),
                        .o_RegWrite(cs_RegWrite),
                        .o_MemRead(cs_MemRead),
                        .o_MemWrite(cs_MemWrite),
                        .o_Branch(cs_Branch),
                        .o_ALUOp(cs_ALUOp),
                        .o_ImmSrc(cs_ImmSrc),
                        .i_opcode(opcode));
    
    RegMem rm(  .o_read1(r1_value),
                .o_read2(r2_value), 
                .i_reg1_addr(rs1_addr), 
                i_reg2_addr(rs2_addr), 
                i_regW_addr(rW_addr),
                i_regW_val(rW_value),
                .i_RegWrite(cs_RegWrite),
                i_clock(clk));
    
    ImmediateGenerator ig(  .o_immediate(immediate), 
                            .i_instruction(cur_instruction), 
                            .i_ImmSrc(cs_ImmSrc));
    
    ALUControl aluctl(  .o_operation(ALUOperation), 
                        .i_ALUop(cs_ALUOp), 
                        .i_func7(cur_instruction[31:25]), 
                        .i_func3(cur_instruction[14:12]));
    
    assign alu_source2 = cs_ALUSrc ? immediate : r2_value;
    ALU alu(    .o_result(alu_result), 
                .o_zero(zero), 
                .o_neg(neg), 
                .i_operand1(r1_value), 
                .i_operand2(alu_source2), 
                .i_ALUControl(ALUOperation));

    DataMem dm(  .o_read(mem_out),
                .i_mem_addr(alu_result), 
                .i_memW_val(r2_value),
                .i_MemRead(cs_MemRead),
                .i_MemWrite(cs_MemWrite),
                .i_clock(clk));
    
    assign rW_value = cs_MemtoReg ? mem_out: alu_result;
    assign inc_addr = cur_instruction_addr + 4;
    assign addr_and_offset = cur_instruction_addr + (immediate << 1);
    assign new_instruction_addr = (zero & cs_Branch) ? addr_and_offset : inc_addr; 
    
    

endmodule