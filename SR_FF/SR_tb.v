`include "sr_ff.v"
module tb;
	reg rst,clk,s,r;
	wire q,qbar;
	integer i;
	SR_ff dut(rst,clk,s,r,q,qbar);

	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

	initial begin
	rst = 1;
	s = 0;
	r = 0;
	#10 rst = 0;

	for(i=0;i<20;i=i+1) begin
	@(posedge clk) ;
	{s,r} = $random % 4;
	if ($random % 10 == 0)
		rst = 1;
	else
		rst = 0;
	@(posedge clk);
	$display("rst=%b | clk=%b | s=%b | r=%b | q=%b | qbar=%b",rst,clk,s,r,q,qbar);
	end
	$finish;
	end
endmodule



