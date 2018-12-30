module DataMemory
 #( parameter delay = 50,parameter size=64)
(address,InData,outRead,write,read,clk);

input [63:0] address,InData;
input read,write;
output [63:0] outRead;
input clk;

reg [63:0] Memory[0:size-1];

integer j;
initial begin
		for(j=0;j<64;j=j+1)
			Memory[j] = 64'b11;
end

assign outRead =(read)? Memory[address] : 64'd0;
always@(posedge clk)
  begin 
      if(write)
        Memory[address]=InData;
  end
endmodule 
