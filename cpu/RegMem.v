module RegMem(  o_read1,
                o_read2, 
                i_reg1_addr, 
                i_reg2_addr, 
                i_regW_addr,
                i_regW_val,
                i_RegWrite,
                i_clock);
    
    output  reg[31:0]  o_read1,
                        o_read2;

    input   wire[4:0]   i_reg1_addr,
                        i_reg2_addr,
                        i_regW_addr;

    input   wire[31:0]  i_regW_val;

    input   wire        i_RegWrite,
                        i_clock;  

    reg[31:0]   reg_arr[0:31];
    
    assign o_read1 = reg_arr[i_reg1_addr];
    assign o_read2 = reg_arr[i_reg2_addr];
    
    always @(posedge clock) begin
        reg_arr[i_regW_addr] <= i_regW_val;
    end

    initial begin
        reg_arr[0] = 0;
        reg_arr[1] = 0;
        reg_arr[2] = 0;
        reg_arr[3] = 0;
        reg_arr[4] = 0;
        reg_arr[5] = 0;
        reg_arr[6] = 0;
        reg_arr[7] = 0;
        reg_arr[8] = 0;
        reg_arr[9] = 0;
        reg_arr[10] = 0;
        reg_arr[11] = 0;
        reg_arr[12] = 0;
        reg_arr[13] = 0;
        reg_arr[14] = 0;
        reg_arr[15] = 0;
        reg_arr[16] = 0;
        reg_arr[17] = 0;
        reg_arr[18] = 0;
        reg_arr[19] = 0;
        reg_arr[20] = 0;
        reg_arr[21] = 0;
        reg_arr[22] = 0;
        reg_arr[23] = 0;
        reg_arr[24] = 0;
        reg_arr[25] = 0;
        reg_arr[26] = 0;
        reg_arr[27] = 0;
        reg_arr[28] = 0;
        reg_arr[29] = 0;
        reg_arr[30] = 0;
        reg_arr[31] = 0;
    end

endmodule