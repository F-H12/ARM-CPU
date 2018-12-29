module shift(toshift,shifted);
  input [63:0] toshift;
  output [63:0]shifted;
  
  assign shifted=toshift << 2;
  
endmodule