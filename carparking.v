`timescale 1ns / 1ps

module ParkingSystem(clk,reset,sense_entry,sense_exit_A,sense_exit_B,sense_exit_C,sense_exit_D,
GledA,GledB,GledC,GledD,RledA,RledB,RledC,RledD);
  input sense_entry,sense_exit_A,sense_exit_B,sense_exit_C,sense_exit_D,reset,clk;
  output reg GledA,GledB,GledC,GledD,RledA,RledB,RledC,RledD;
  reg [3:0] Rled,Gled;
  reg slota,slotb,slotc,slotd;
  initial
  begin
    slota=1'b0;
    slotb=1'b0;
    slotc=1'b0;
    slotd=1'b0;
  end
  always@(posedge clk or posedge reset or posedge sense_entry or posedge sense_exit_A or posedge sense_exit_B or posedge sense_exit_C or posedge sense_exit_D)
  begin
   if(reset==1'b1)
    begin
      slota=1'b0;
      slotb=1'b0;
      slotc=1'b0;
      slotd=1'b0;
      Gled[3:0]=4'b1111;
      Rled[3:0]=4'b0000;
    end
   else if(sense_entry==1'b1)
      begin
        if(slota==1'b0)
          begin
            slota=1'b1;
            Gled[0]=1'b0;
            Rled[0]=1'b1;
          end
        else if(slotb==1'b0)
          begin
            slotb=1'b1; 
            Gled[1]=1'b0;
            Rled[1]=1'b1;
          end
        else if(slotc==1'b0)
          begin 
            slotc=1'b1;
            Gled[2]=1'b0;
            Rled[2]=1'b1;
          end
        else if(slotd==1'b0)
          begin 
            slotd=1'b1;
            Gled[3]=1'b0;
            Rled[3]=1'b1;
          end        
      end
   else if(sense_exit_A==1'b1)
      begin
      if(slota==1'b1)
        begin
            slota=1'b0;
            Gled[0]=1'b1;
            Rled[0]=1'b0;
        end
      end
   else if(sense_exit_B==1'b1)
      begin
      if(slotb==1'b1)
        begin
           slotb=1'b0;
            Gled[1]=1'b1;
            Rled[1]=1'b0;
        end
      end
   else if(sense_exit_C==1'b1)
      begin
      if(slotc==1'b1)
        begin
           slotc=1'b0;
            Gled[2]=1'b1;
            Rled[2]=1'b0;
        end
      end
   else if(sense_exit_D==1'b1)
      begin
      if(slotd==1'b1)
        begin
           slotd=1'b0;
            Gled[3]=1'b1;
            Rled[3]=1'b0;
        end
      end
  end
   always@(*)
       begin
         GledA=Gled[0];
         GledB=Gled[1];
         GledC=Gled[2];
         GledD=Gled[3];
         RledA=Rled[0];
         RledB=Rled[1];
         RledC=Rled[2];
         RledD=Rled[3];
       end
   
   
  endmodule
