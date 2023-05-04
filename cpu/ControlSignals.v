module ControlSignals(  o_ALUSrc, 
                        o_MemtoReg,
                        o_RegWrite,
                        o_MemRead,
                        o_MemWrite,
                        o_Branch,
                        o_ALUOp,
                        o_ImmSrc,
                        i_opcode);

    output  reg o_ALUSrc, 
                o_MemtoReg,
                o_RegWrite,
                o_MemRead,
                o_MemWrite,
                o_Branch;
    output  reg[2:0]o_ImmSrc;
    output  reg[1:0] o_ALUOp;
    
    input   wire[6:0]    i_opcode;

    always @(*)
    begin
        case(i_opcode)
            7'b0110011: 
                begin
                    o_ALUSrc = 0;
                    o_MemtoReg = 0;
                    o_RegWrite = 1;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 0;
                    o_ALUOp = 2'b10;
                    o_ImmSrc = 0;
                end//R Format
            7'b0010011: 
                begin
                    o_ALUSrc = 1;
                    o_MemtoReg = 0;
                    o_RegWrite = 1;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 0;
                    o_ALUOp = 2'b10; //????
                    o_ImmSrc = 1;
                end//I arithmetic Format
            7'b0000011: 
                begin
                    o_ALUSrc = 1;
                    o_MemtoReg = 1;
                    o_RegWrite = 1;
                    o_MemRead = 1;
                    o_MemWrite = 0;
                    o_Branch = 0;
                    o_ALUOp = 2'b00;
                    o_ImmSrc = 1;
                end//I load Format
            7'b0100011: 
                begin
                    o_ALUSrc = 1;
                    o_MemtoReg = 0; //x
                    o_RegWrite = 0;
                    o_MemRead = 0;
                    o_MemWrite = 1;
                    o_Branch = 0;
                    o_ALUOp = 2'b00;
                    o_ImmSrc = 2;
                end//S Format
            7'b1100011: 
                begin
                    o_ALUSrc = 0;
                    o_MemtoReg = 0; //x
                    o_RegWrite = 0;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 1;
                    o_ALUOp = 2'b01;
                    o_ImmSrc = 3;
                end//B Format
            7'b1101111: 
                begin
                    o_ALUSrc = 0;   
                    o_MemtoReg = 0; //x
                    o_RegWrite = 1;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 0;
                    o_ALUOp = 2'b01; 
                    o_ImmSrc = 4;
                end//JAL
            7'b1100111: 
                begin
                    o_ALUSrc = 0;
                    o_MemtoReg = 0; 
                    o_RegWrite = 1;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 1;
                    o_ALUOp = 2'b0;
                    o_ImmSrc = 1;
                end//JALR
            7'b0010111: 
                begin
                    o_ALUSrc = 0;
                    o_MemtoReg = 0; 
                    o_RegWrite = 1;
                    o_MemRead = 0;
                    o_MemWrite = 0;
                    o_Branch = 1;
                    o_ALUOp = 2'b0; 
                    o_ImmSrc = 5;
                end//U Format
                //Not supporting I* format, I don't have a system to call on
        endcase 
    end

    
endmodule



