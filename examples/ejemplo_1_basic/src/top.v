module top(
	input clk,
	input j13, j14,
	output j15, j16, j17, j18,
	output j19, j20
);

wire [3:0] cnt;
wire rst_n;
wire en;
rst_gen rst_gen_inst(.clk(clk), .rst_n(rst_n));

assign j20 = 1'b0;
assign {j18, j17, j16, j15} = cnt;

reg [20:0] div_cnt;
always @(posedge clk) begin
	if (~rst_n) div_cnt <= 0;
	else 
		if (div_cnt==1199999)
			div_cnt <= 0;
		else 
			div_cnt <= div_cnt + 1'b1;
end

assign en = (div_cnt==0);

HDL_Subsystem HDL_Subsystem_inst(
	.clk(clk),
	.reset(rst_n),
	.clk_enable(en),
	.in1(j13),
	.in2(j14),
    .ce_out(),
    .cnt(cnt),
    .and_rsvd(j19));

endmodule