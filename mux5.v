module Mux5(dataA,dataB,s,outres);
  parameter Size =5;
  input [Size-1:0] dataA,dataB; 
  input s; 
  output [Size-1:0] outres;
  
  
	assign outres = (s)?dataA:dataB;
endmodule
