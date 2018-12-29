module regbank
#(parameter delay=100)
(DataA, DataB, DataC, AddrA, AddrB, AddrC, w, Clk);
  output [63:0] DataA, DataB;
  input [63:0] DataC;
  input [4:0] AddrA, AddrB, AddrC;
  input w;
  input Clk;

  reg [63:0] registers [0:31];

  assign DataA = registers[AddrA];
  assign DataB = registers[AddrB];

  integer j;
  initial begin
    for(j=0;j<31;j=j+1)
      registers[j] = j;

    registers[31]=0;    
  end


  always @ (posedge Clk) 
  begin
    if(w)
      if (AddrC < 5'b11111)
        //address 0 to 30.31 is not for write-zero
        registers[AddrC] <= DataC;
  end
endmodule
