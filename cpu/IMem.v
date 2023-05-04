module IMem(o_instruction, i_pc);
    input wire[31:0] i_pc;
    output reg[31:0] o_instruction;

    parameter numInstructions = 11;
    parameter filepath = "../tests/rtest/txt/rtest.txt";
    reg[31:0] instruction_arr [0:numInstructions-1];

    
    //Filepath to assembled data
    initial $readmemh(filepath, data);

    assign o_instruction = instruction_arr[i_pc];

endmodule
/*
module file_readmemh;

 Declare a array 4 word deep 20 locations wide for 20/4 = 5 hexadecimal words

//reg [wordSize] data [0:numInstructions]
reg [31:0] data [0:10];

// initialize the hexadecimal reads from the vectors.txt file

//Insert filepath
initial $readmemh("../tests/rtest/txt/rtest.txt", data);

 declare an integer for the conditional

statement to read values from test file

integer i;

read and display the values from the text file on screen

initial begin

     $display("rdata:");

     for (i=0; i < 11; i=i+1)

     $display("%d:%d",i,data[i]);

end

endmodule
*/