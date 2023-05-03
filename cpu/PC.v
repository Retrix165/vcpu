
module PC(  o_instruction_address, 
            clock, 
            i_reset, 
            new_address);

    output  reg[31:0]   o_instruction_address;
    
    input   wire        clock, 
                        i_reset, 
                        i_set;
    input   wire[31:0]  new_address;

    initial
    begin
        o_instruction_address = 0;
    end

    always @(posedge clock)
    begin
        if (i_reset)
            o_instruction_address <= 0;
        else
            o_instruction_address <= new_address;
    end
endmodule
