`timescale 1ns/100ps
module counter8
(INC_END,
INC_START,
DEC_END,
DEC_START,
RESETn,
MODE_SEL,
CLR,
CLK,
HOLD,
LOAD,
DIN,
DOUT);
input INC_END,DEC_END;
input INC_START,DEC_START;
input RESETn,MODE_SEL;
input CLR;
input CLK;
input HOLD,LOAD;
input[7:0] DIN;
output[7:0] DOUT;

reg Q1,Q2;
wire D1,D2;
wire Work_en,MODE_SEL;
reg[7:0] DOUT;
wire[7:0] D3;
//flip-flop 
always @ (posedge CLK or negedge RESETn)
   begin
   if(!RESETn)  Q1<=1'b0;
   else  Q1<=D1;
   end
assign  D1 = CLR?1'b0:
             INC_START?1'b1:
             INC_END?1'b0:
             Q1;
       
   
//flip-flop 
  always @ (posedge CLK or negedge RESETn)
   begin
   if(!RESETn)  Q2<=0;
   else  Q2<=D2;
   end
 assign  D2 = CLR?1'b0:
             DEC_START?1'b1:
             DEC_END?1'b0:
             Q2;
   

 assign  Work_en = (MODE_SEL&Q1)|((~MODE_SEL)&Q2);
       


 always @(posedge CLK or negedge RESETn)
      begin
        if(!RESETn) DOUT <= 8'b0000000;
        else DOUT <= D3;
       end
   

 assign D3 = CLR ? 8'b0 :((~Work_en) ? (LOAD?DIN:DOUT) :
                (HOLD?DOUT:(MODE_SEL ? (DOUT + 8'b00000001) :(DOUT - 8'b00000001))));
		 
    
endmodule


