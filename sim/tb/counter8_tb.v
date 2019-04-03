`timescale 1ns/100ps
module counter8_tb;
 reg
 Q1,Q2,D3, 
 CLK_reg, 
 RESETn_reg, 
 CLR_reg, 
 MODE_SEL_reg, 
 LOAD_reg, 
 HOLD_reg, 
 INC_START_reg, 
 INC_END_reg, 
 DEC_START_reg, 
 DEC_END_reg;
 reg[7:0] DIN_reg;
 wire[7:0] DOUT_reg;
   counter8 U_counter(
     .CLK(CLK_reg),
     .INC_START(INC_START_reg),
     .INC_END(INC_END_reg),
     .DEC_START(DEC_START_reg),
     .DEC_END(DEC_END_reg),
     .RESETn(RESETn_reg),
     .CLR(CLR_reg),
     .LOAD(LOAD_reg),
     .HOLD(HOLD_reg),
     .DIN(DIN_reg),
     .MODE_SEL(MODE_SEL_reg),
     .DOUT(DOUT_reg)
      );
initial 
begin
     $display("initial begin"); 
         
     $dumpfile ("count_pic.dump");
     $dumpvars;
 
     $display($realtime,,"test begin");
      LOAD_reg = 1'b0;
      HOLD_reg = 1'b0;
      CLR_reg = 1'b0;
      CLK_reg = 1'b0;
      RESETn_reg = 1'b1;
      MODE_SEL_reg = 1'b1;
      DIN_reg = 8'b00001010;
      INC_END_reg = 1'b0;
      DEC_END_reg = 1'b0;
      INC_START_reg = 1'b0;
      DEC_START_reg = 1'b0;
      
      //cheak clr
      #20;
      $display($realtime,,"CALCULATOR CLAER");
      CLR_reg = 1'b1;
      #20;
      CLR_reg = 1'b0;
      #20;
      //
      //cheak load
      #20;
      $display($realtime,,"CALCULATOR INPUT!");
      LOAD_reg = 1'b1;
      #20;
      LOAD_reg = 1'b0;
      #20;
      //
      //cheak  inc_start
      #20 ;
      $display($realtime,,"START INC!");
      INC_START_reg = 1'b1;
      #20 ;
      INC_START_reg = 1'b0;
      #100;
      //
      //cheak hold
      $display($realtime,,"HOLD! HOLD!");
      HOLD_reg = 1'b1;
      #40 ;   //the time of holding
      HOLD_reg = 1'b0;
      //
      $display($realtime,,"RESTART! RESTART!");
      #100;
      //
      //cheak  inc_end
      INC_END_reg = 1'b1;
      #20 ;
      INC_END_reg = 1'b0;
      $display($realtime,,"END INC!");
      #100;
      $display($realtime,,"CHEAK INC_END!");
      //
      //cheak resetn
      RESETn_reg <= 1'b0;
      $display($realtime,,"RESETn!");
      #20;
      $display($stime,,"When RESETn is %h(%0d),output is %h(%0d)",RESETn_reg,RESETn_reg,DOUT_reg,DOUT_reg);
      //     
$finish(2);
       end

always begin
        #10 CLK_reg=~CLK_reg;
       end


always  @(DOUT_reg)
        $display($stime,,"When input is %h(%0d),output is %h(%0d)",DIN_reg,DIN_reg,DOUT_reg,DOUT_reg);

always  @(HOLD_reg)
        $display($stime,,"When input is %h(%0d),output is %h(%0d)",DIN_reg,DIN_reg,DOUT_reg,DOUT_reg);

endmodule



























