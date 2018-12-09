module regbank(DataA, DataB, DataC, AddrA, AddrB, AddrC, w, Clk);
  output [63:0] DataA, DataB;
  input [63:0] DataC;
  input [4:0] AddrA, AddrB, AddrC;
  input w;
  input Clk;

  reg [63:0] registers [31:0];

  assign DataA = registers[AddrA];
  assign DataB = registers[AddrB];

  always @ (posedge Clk) 
  begin
    if(w)
      if (AddrC <= 5'd30)
        //address 0 to 30
        registers[AddrC] <= DataC;
  end
endmodule
