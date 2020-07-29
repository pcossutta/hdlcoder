// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\basic\HDL_Subsystem.v
// Created: 2020-07-29 10:36:21
// 
// Generated by MATLAB 9.4 and HDL Coder 3.12
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 0.1
// Target subsystem base rate: 0.1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        0.1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// cnt                           ce_out        0.1
// and_rsvd                      ce_out        0.1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: HDL_Subsystem
// Source Path: basic/HDL Subsystem
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module HDL_Subsystem
          (clk,
           reset,
           clk_enable,
           in1,
           in2,
           ce_out,
           cnt,
           and_rsvd);


  input   clk;
  input   reset;
  input   clk_enable;
  input   in1;
  input   in2;
  output  ce_out;
  output  [3:0] cnt;  // ufix4
  output  and_rsvd;


  wire enb;
  reg [3:0] Counter_Free_Running_out1;  // ufix4
  wire Logical_Operator_out1;


  assign enb = clk_enable;

  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk)
    begin : Counter_Free_Running_process
      if (reset == 1'b0) begin
        Counter_Free_Running_out1 <= 4'b0000;
      end
      else begin
        if (enb) begin
          Counter_Free_Running_out1 <= Counter_Free_Running_out1 + 4'b0001;
        end
      end
    end



  assign cnt = Counter_Free_Running_out1;

  assign Logical_Operator_out1 = in1 | in2;



  assign and_rsvd = Logical_Operator_out1;

  assign ce_out = clk_enable;

endmodule  // HDL_Subsystem

