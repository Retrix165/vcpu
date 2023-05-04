module ImmediateGenerator(  o_immediate, 
                            i_instruction, 
                            i_ImmSrc);
    
    output reg[31:0]    o_immediate;

    input wire[31:0]    i_instruction;
    input wire[2:0]     i_ImmSrc;

    always @(*) begin
        case(i_ImmSrc)
            0 : o_immediate = 0; //R Format
            1 : o_immediate = { {21{i_instruction[31]}},
                                i_instruction[30:20]}; //I Arithmetic/Load/JALR
            2 : o_immediate = { {21{i_instruction[31]}},
                                i_instruction[30:25], 
                                i_instruction[11:8], 
                                i_instruction[7]}; //S Format
            3 : o_immediate = { {20{i_instruction[31]}},
                                i_instruction[7],
                                i_instruction[30:25],
                                i_instruction[11:8],1'b0}; //B Format
            4 : o_immediate = { i_instruction[31:12],
                                12'b000000000000}; //J Format
            5 : o_immediate = { i_instruction[31],
                                i_instruction[19:12],
                                i_instruction[20],
                                i_instruction[30:25],
                                i_instruction[24:21],
                                1'b0}; //U Format
        endcase 
    end

endmodule