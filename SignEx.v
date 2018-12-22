module SignEx( ExIn, ExOut );
input[31:0] ExIn;
output reg[63:0] ExOut;


always@(ExIn) 
begin
    ExOut[31:0] = ExIn[31:0];
    ExOut[63:32] = {32{ExIn[31]}};
end
endmodule
