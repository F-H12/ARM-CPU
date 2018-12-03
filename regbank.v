module regbank(DataA, DataB, DataC, a, b, c, w, Clk);
  output [63:0] DataA, DataB;
  input [63:0] DataC;
  input [4:0] a, b, c;
  input w;
  input Clk;

  reg [63:0] registers [31:0];

  assign DataA = registers[a];
  assign DataB = registers[b];

  always @ (posedge Clk) 
  begin
    if(w)
      if (c != 5'd31)
        registers[c] <= DataC;
      else
        registers[c] <= 'd0;
  end
endmodule
