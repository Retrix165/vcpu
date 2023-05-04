module ALUControl(  o_operation, 
                    i_ALUop, 
                    i_func7, 
                    i_func3 );

        output  reg[3:0]   o_operation;

        input   wire[1:0]   i_ALUop;
        input   wire[6:0]   i_func7;
        input   wire[2:0]   i_func3;
                wire[11:0]  ALUKey;

        assign ALUKey = {i_ALUop, i_func7, i_func3};
        always @(ALUKey)
        begin
                casex(ALUKey)
                        12'b1x0000000111: o_operation = 4'b0000; //0 &
                        12'b1x0000000110: o_operation = 4'b0001; //1 | 
                        12'b00xxxxxxxxxx: o_operation = 4'b0010; //2 +
                        12'b1x0000000000: o_operation = 4'b0010; //2 +
                        12'b1x0000000001: o_operation = 4'b0011; //3 ^
                        12'bx1xxxxxxxxxx: o_operation = 4'b0110; //6 - 
                        12'b1x0100000000: o_operation = 4'b0110; //6 - 
                        12'b1x0000000001: o_operation = 4'b1000; //8 <<
                        12'b1x0000000101: o_operation = 4'b1001; //9 >>
                        12'b1x0100000101: o_operation = 4'b1010; //10 >>>
                        default: o_operation = 4'b0;
                endcase
        end
endmodule