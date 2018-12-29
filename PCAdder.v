module PCAdder
#(parameter delay=100)
(addr,const,out);
  input addr;
  input const;
  output out;
  
  assign out=addr+const;
endmodule