module run();
  reg pcReset;
  wire clk,zero,wReg,memRead,memWrite,RegWrite,Branch,MemtoReg,Reg2Loc,AluSrc;

  wire [1:0]ALUOp;
  //wire [10: 0] insOp;
  wire [3:0] AluOpCode;
  wire [4:0] regMUXOut;
  wire [31:0] instruction;

  wire[63:0] ExOut,shifted,pc,Address, DataA, DataB,input1,input2,ALUOutput,pcAddOut,outRead,jumpAddOut, aluMUXOut,memMUXOut;


  clock c(clk);
  
  initial begin
    pcReset = 1;
    #200 pcReset = 0;

  end
  
  Controller control(instruction[31:21],ALUOp,AluSrc,Branch,MemRead,MemWrite,RegWrite,MemtoReg,Reg2Loc);
  PC pcfunc(pc,clk,reset,Address);
  Adder PCAdd(Address,64'b100,pcAddOut);
InstructionMemory imemory(Address,instruction);
Mux5 regMUX(instruction[4:0],instruction[20:16],Reg2Loc,regMUXOut);

regbank register( 
         DataA, 
         DataB, 
         memMUXOut, 
         instruction[9:5],
         regMUXOut, 
         instruction[4:0], 
         wRegbank,clk);

  SignEx sign( instruction, ExOut );
  Mux aluMUX(ExOut,DataB ,AluSrc, aluMUXOut);

ALU alu(DataA, aluMUXOut, AluOpCode, ALUOutput, zero );
AluControl aluC(ALUOp,instruction,AluOpCode);
shift shift2left(ExOut, shifted);
Adder jumpAdd(shifted,Address, jumpAddOut);
Mux jumpMUX(jumpAddOut,pcAddOut,Branch&zero, pc);

DataMemory DataM(ALUOutput,DataB,outRead,MemWrite,MemRead,clk);

Mux memMUX(outRead,ALUOutput,MemtoReg ,memMUXOut);
endmodule