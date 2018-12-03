module regbank_tb(Clk,c,w,dataC);
  input Clk;
	output reg [4:0] c;
	output reg w ;
	output reg [63:0] dataC;
	

	initial begin
		w = 1;
		c = 5'd0;
		dataC = 64'd0;
	end
	always @(posedge Clk)
	begin
	  if(dataC==64'b11110)
	    dataC=64'd0;
	    else
	      dataC=dataC+64'b1;
	      
	    c=dataC[4:0];
	    
	    end

endmodule
