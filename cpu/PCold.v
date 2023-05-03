
module PC(instruction_address, clock, reset, set, address_offset);
    output  reg[31:0]   instruction_address;
    input   wire        clock, reset, set;
    input   wire[31:0]  address_offset;

    initial
    begin
        instruction_address = 0;
    end

    always @(posedge clock or reset or set)
    begin
        if (reset)
            instruction_address <= 0;
        else
            if (set)
                instruction_address += address_offset;
            else    
                instruction_address += 4;
    end
endmodule
