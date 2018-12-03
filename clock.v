module clock(clk);
  output reg clk;
  always
  begin
    #100;clk=0;
    #100;clk=1;
  end
endmodule

  