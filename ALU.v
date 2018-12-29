module ALU
#(parameter n=64, parameter delay=100)
(input1,input2,OP,ALUOutput,zero);
  input [n-1:0]input1; 
  input [n-1:0]input2; 
  input [3:0]OP;
  output reg [63:0]ALUOutput;
  output zero;

  always@(input1,input2,OP)
  begin
    ALUOutput = 64'bz;
    case(OP)

    4'b0000: ALUOutput = input1&input2;
    4'b0001: ALUOutput = input1|input2;
    4'b0010: ALUOutput = input1+input2;
    4'b0110: ALUOutput = input1-input2;
    4'b0111: ALUOutput = input2;
    4'b1100: ALUOutput = ~(input1|input2) ; 
    endcase

  end

  assign zero = (ALUOutput==0)? 1: 0;
endmodule
