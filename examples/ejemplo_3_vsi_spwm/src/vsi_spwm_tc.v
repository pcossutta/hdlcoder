// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\vsi_spwm\vsi_spwm_tc.v
// Created: 2020-07-29 00:43:41
// 
// Generated by MATLAB 9.4 and HDL Coder 3.12
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: vsi_spwm_tc
// Source Path: vsi_spwm_tc
// Hierarchy Level: 1
// 
// Master clock enable input: clk_enable
// 
// enb_1_4_0   : identical to clk_enable
// enb_1_12_0  : 3x slower than clk with last phase
// enb_1_12_1  : 3x slower than clk with phase 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module vsi_spwm_tc
          (clk,
           reset,
           clk_enable,
           enb_1_4_0,
           enb_1_12_0,
           enb_1_12_1);


  input   clk;
  input   reset;
  input   clk_enable;
  output  enb_1_4_0;
  output  enb_1_12_0;
  output  enb_1_12_1;


  reg [1:0] count3;  // ufix2
  wire phase_all;
  reg  phase_0;
  wire phase_0_tmp;
  reg  phase_1;
  wire phase_1_tmp;


  always @ (posedge clk)
    begin: Counter3
      if (reset == 1'b0) begin
        count3 <= 2'b01;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (count3 >= 2'b10) begin
            count3 <= 2'b00;
          end
          else begin
            count3 <= count3 + 2'b01;
          end
        end
      end
    end // Counter3

  assign phase_all = clk_enable ? 1'b1 : 1'b0;

  always @ ( posedge clk)
    begin: temp_process0
      if (reset == 1'b0) begin
        phase_0 <= 1'b0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          phase_0 <= phase_0_tmp;
        end
      end
    end // temp_process0

  assign  phase_0_tmp = (count3 == 2'b10 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  always @ ( posedge clk)
    begin: temp_process1
      if (reset == 1'b0) begin
        phase_1 <= 1'b1;
      end
      else begin
        if (clk_enable == 1'b1) begin
          phase_1 <= phase_1_tmp;
        end
      end
    end // temp_process1

  assign  phase_1_tmp = (count3 == 2'b00 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  assign enb_1_4_0 =  phase_all & clk_enable;

  assign enb_1_12_0 =  phase_0 & clk_enable;

  assign enb_1_12_1 =  phase_1 & clk_enable;


endmodule  // vsi_spwm_tc
