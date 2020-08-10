`timescale 1ns / 1ps


module tb_parking_system;

  // Inputs
  reg clk;
  reg reset;
  reg sense_entry;
  reg sense_exit_A;
  reg sense_exit_B;
  reg sense_exit_C;
  reg sense_exit_D;

  // Outputs
 wire GledA,GledB,GledC,GledD,RledA,RledB,RledC,RledD;

//////////////////

  ParkingSystem uut (
  .clk(clk), 
  .reset(reset),
  .sense_entry(sense_entry),
  .sense_exit_A(sense_exit_A),
  .sense_exit_B(sense_exit_B),
  .sense_exit_C(sense_exit_C),
  .sense_exit_D(sense_exit_D),
  .GledA(GledA),
  .GledB(GledB),
  .GledC(GledC),
  .GledD(GledD),
  .RledA(RledA),
  .RledB(RledB),
  .RledC(RledC),
  .RledD(RledD)
 );
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 initial begin
 // Initialize Inputs
 reset = 0;
 sense_entry = 0;
 sense_exit_A = 0;
 sense_exit_B = 0;
 sense_exit_C = 0;
 sense_exit_D = 0;
 
 #1000;
      reset = 1;
 #1000;
 sense_entry = 1;
 #1000;
 sense_entry = 0;
 #1000;
 sense_entry = 1;
 #1000;
 sense_entry = 0;
 #1000;
 sense_entry = 1;
 #1000;
 sense_entry = 0;
 #1000;
 sense_entry = 1;
 #1000;
 sense_entry = 0;
 #1000;
 sense_exit_A =1;
 #1000;
 sense_exit_B =1;
 #1000;
 sense_exit_C =1;
 #1000;
 sense_exit_D =1;

#1000 $finish;
 
 end
      
endmodule
