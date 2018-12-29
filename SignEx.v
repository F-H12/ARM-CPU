module SignEx( ExIn, ExOut );
input[31:0] ExIn;
output reg[63:0] ExOut;


always@(ExIn) 
begin
	ExOut=64'bz;
	//conditional branch
	if(ExIn[30]==1'b0)
		ExOut={{45{ExIn[23]}},ExIn[23:5]};
		//LDUR & STUR
	else if(ExIn[30]==1'b1)
		ExOut={{55{ExIn[23]}},ExIn[20:12]};
end
endmodule
