module InstructionMemory
#(parameter delay=50)
(address,instr);

input [63:0] address;
output [31:0] instr;
parameter Size = 256;
reg [31:0] InstructionMemory[0:Size-1];

integer j;
initial begin
	for (j=0; j<32; j=j+1)
		memory[j] =0;
	InstructionMemory[0] = 32'h8B1F03E5;
	InstructionMemory[1] = 32'hF84000A4;
	InstructionMemory[2] = 32'h8B040086;
	InstructionMemory[3] = 32'hF80010A6;
end

assign instr = InstructionMemory[address];

endmodule 
