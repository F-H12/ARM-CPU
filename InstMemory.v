module InstructionMemory(address,instr);

input [63:0] address;
output reg [31:0] instr;
parameter Size = 256;
reg [31:0] InstructionMemory[0:Size-1];

//use clock for writing memory


instr = InstructionMemory[address];

endmodule 