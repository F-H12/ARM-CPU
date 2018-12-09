module PC(pc,clk,reset,Address);
  input [63:0] pc;
  input clk;
  input reset;
  output [63:0] Address;

  reg [63:0] Data;

always@(posedge clk)
  begin
  if(reset)
    Data = 31'b0;
  else
    Data = pc;
  end
assign Address = Data;

endmodule
