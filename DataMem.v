module DataMemory(address,InData,outRead,write,read,clk);
parameter Size = 256;

input [63:0] address,InData;
input read,write;
output [63:0] outRead;
input clk;

reg [63:0] Memory[0:Size-1];

assign outRead =(read)? Memory[address] : 64'd0;
always@(posedge clk)
  begin 
      if(write)
        Memory[address]=InData;
  end
endmodule 

