module run();
  reg pcReset;
  wire clk,zero,wReg,memRead,memWrite,RegWrite,Branch,MemtoReg,Reg2Loc,AluSrc,regMuxSelect;

  wire [1:0]AluOp;
  //wire [10: 0] insOp;
  wire [3:0] AluOpCode;
  wire [4:0] AddrA, AddrB, AddrC;
  wire [31:0] instruction;

  wire[63:0] ExOut,shifted,pc,Address, DataA, DataB, DataC,input1,input2,ALUOutput,pcAddOut,outRead,jumpAddOut, aluMUXAdd,memMUXAdd,regMUXOut;

  initial begin
    pcReset = 1;
    #200 pcReset = 0;

  end

  clock c(clk);
  Controller control(instruction[31:21],ALUOp,AluSrc,Branch,MemRead,MemWrite,RegWrite,MemtoReg,Reg2Loc);
  PC pcfunc(pc,clk,reset,Address);
  PCAdder PCAdd(Address,64'b100,pcAddOut);
InstructionMemory imemory(Address,instruction);
Mux regMUX(instruction[4:0],instruction[20:16],Reg2Loc,regMUXOut);

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

ALU alu(DataA, aluMUX_Out, AluOpCode, zero, ALUOutput);
Controller aluC(AluOp,instruction[31:21],AluOpCode);
shift shift2left(ExOut, shifted);
//adder
PCAdder jumpAdd(shifted,Address, jumpAddOut);
Mux jumpMUX(jumpAddOut,pcAddOut,Branch&zero, pc);

DataMemory DataM(ALUOutput,DataB,MemRead,MemWrite,outRead,clk);

Mux memMUX(outRead,ALUOutput,MemtoReg ,  memMUXOut);
endmodule