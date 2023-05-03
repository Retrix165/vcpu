module ALU(o_result, o_zero, o_neg, i_operand1, i_operand2, i_ALUControl);

    output  reg[31:0]  o_result;
    output  reg        o_zero, 
                        o_neg;

    input   wire[31:0]  i_operand1, 
                        i_operand2;
    input   wire [3:0]  i_ALUControl;

    always @(*)
    begin 
        case(i_ALUControl) //Seems like way few cases for an ALU
            4'b0000 : o_result = i_operand1 & i_operand2; //4
            4'b0001 : o_result = i_operand1 | i_operand2; //1
            4'b0010 : o_result = i_operand1 + i_operand2; //2
            4'b0011 : o_result = i_operand1 ^ i_operand2; //added //3
            4'b0110 : o_result = i_operand1 - i_operand2; //6
            4'b1000 : o_result = i_operand1 << i_operand2; //added //8
            4'b1001 : o_result = i_operand1 >> i_operand2; //added //9
            4'b1010 : o_result = i_operand1 >>> i_operand2; //added //10

        endcase;
        o_zero = o_result === 0;
        o_neg = o_result < 0;
    end
endmodule


