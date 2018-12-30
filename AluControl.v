module AluControl
  #(
     parameter delay = 100
    )
    (
      input [1:0] AluOp,
      input [31:0] inst,
      output reg[3:0] AluOpCode
    );
    
    wire [5:0]opcheck;
    assign opcheck = {AluOp, inst[30], inst[29], inst[24]};
    
    always @(opcheck) begin
      AluOpCode = 4'b0;
 
      casex(opcheck)
        5'b00xxx: AluOpCode = 4'b0010;
        5'bx1xxx: AluOpCode = 4'b0111;
        5'b1x001: AluOpCode = 4'b0010;
        5'b1x101: AluOpCode = 4'b0110;
        5'b10000: AluOpCode = 4'b0000;
        5'b1x010: AluOpCode = 4'b0001;
      endcase
    end
  
endmodule
