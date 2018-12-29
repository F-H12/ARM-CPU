module PC
#(parameter n=64,parameter delay=100)
(pc,clk,reset,Address);
  input [n-1:0] pc;
  input clk;
  input reset;
  output reg[63:0] Address;

always@(posedge clk)
  begin
  if(reset)
    Address = 64'bz;
  else
    Address = pc;
  end
endmodule
