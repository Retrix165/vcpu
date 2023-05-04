module IMem(    o_instruction, 
                i_pc);

    input wire[31:0] i_pc;
    output wire[31:0] o_instruction;

    parameter numInstructions = 11;
    parameter filepath = "../tests/rtest/txt/rtest.txt";
    reg[31:0] instruction_arr [0:numInstructions-1];

    
    //Filepath to assembled data
    initial $readmemh(filepath, instruction_arr);
    assign o_instruction = instruction_arr[i_pc];

endmodule