module run();
  wire clk;
  wire pc,reset,Address;
  wire PCAddr,const,out;
  wire input1,input2,OP,ALUOutput,zero;
  wire AluOp,insOp,AluOpCode;
  wire DataA, DataB, DataC, AddrA, AddrB, AddrC, w;
  wire address,InData,outRead,write,read;
  wire InsAddress,instr;
  wire ExIn, ExOut;
  wire dataA,dataB,s,outres;
  
  clock c(clk);
  PC pcfunc(pc,clk,reset,Address);
  PCAdder PCAdd(PCaddr,const,out);
  ALU alu(input1,input2,OP,ALUOutput,zero);
  AluControl ALUC(AluOp,insOp,AluOpCode);
  regbank regb(DataA, DataB, DataC, AddrA, AddrB, AddrC, w, Clk);
  DataMemory DataM(address,InData,outRead,write,read,clk);
  InstructionMemory InsM(InsAddress,instr);
  SignEx sign( ExIn, ExOut );
  Mux mux(dataA,dataB,s,outres);
endmodule