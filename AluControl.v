module AluControl
#(parameter delay=100)
(AluOp,insOp,AluOpCode);
input [1:0]AluOp;
input [10: 0] insOp;
output reg [3:0] AluOpCode;


always@(AluOp)
begin

if(AluOp==2'b00)
AluOpCode = 4'b0010;

else if(AluOp[0] == 1)
AluOpCode = 4'b0111;

else if(AluOp[1]==1 && insOp==11'b10001011000)
AluOpCode = 4'b0010;

else if(AluOp[1]==1 && insOp==11'b11001011000)
AluOpCode = 4'b0110;

else if(AluOp[1]==1 && insOp==11'b10001010000)
AluOpCode = 4'b0000;

else if(AluOp[1] && insOp==11'b10101011000)
AluOpCode = 4'b0001;

end
endmodule
