`include "t_ff.v"
module tb;
	reg rst,clk,t;
	wire q,qbar;
	integer i;
	T_ff dut(rst,clk,t,q,qbar);

	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

	initial begin
	rst = 1;
	t = 0;
	#10 rst = 0;
	
	for(i=0 ; i<20 ; i=i+1) begin
		@(posedge clk);
		t = $random % 2;
		if($random % 10 == 0)
		rst = 1;
		else
		rst = 0;
		#1;
		$display("rst=%b | clk=%b | t=%b | q=%b | qbar=%b",rst,clk,t,q,qbar);
		end
		$finish;
		end
endmodule

		

