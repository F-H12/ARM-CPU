module InstructionMemory#(parameter Size = 256)(address,instr);

input [63:0] address;
output reg [31:0] instr;

reg [31:0] InstructionMemory[0:Size-1];

//use clock for writing memory

always@(*)
instr = InstructionMemory[address];

endmodule 