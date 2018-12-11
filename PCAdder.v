module PCAdder(addr,const,out);
  input addr;
  input const;
  output out;
  
  assign out=addr+const;
endmodule