module Adder 
#(parameter n = 64,
parameter delay = 0)
(a, b , s);

	
	input [n-1:0] b;
	input [n-1:0] a ;
	wire cout;
	output [n-1:0] s;

	assign {cout, s} = a + b;
endmodule
