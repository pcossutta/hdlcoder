module top(
   input clk,
   output j01,
   output j02,
   output j03,
   output j04,
   output j05,
   output j06
);

wire rst_n;
wire en;
rst_gen rst_gen_inst(.clk(clk), .rst_n(rst_n));

wire [5:0] g;
assign {j06, j05, j04, j03, j02, j01} = g;

vsi_spwm vsi_spwm_inst(
   .clk(clk),
   .reset(rst_n),
   .clk_enable(1'b1),
   .ce_out(),
   .g(g)
);
endmodule
