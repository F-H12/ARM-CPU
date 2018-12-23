module Mux(dataA,dataB,s,outres);
  input [63:0] dataA,dataB; 
  input s; 
  output [63:0] outres;
  
  
	assign outres = (s)?dataA:dataB;
endmodule
