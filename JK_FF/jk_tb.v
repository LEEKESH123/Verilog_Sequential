`include "jk_ff.v"
module tb;
	reg rst,clk,j,k;
	wire q,qbar;
	integer i;
 JK_ff dut (rst,clk,j,k,q,qbar);
 	initial begin
	clk=0;
	forever #5 clk = ~clk;
	end

	initial begin
	rst = 1 ; j = 0; k=0;
	#10 rst = 0;

	for(i=0;i<20;i=i+1) begin
		@(posedge clk);
		{j,k} = $random %4;
		if($random % 10 == 0) 
		rst = 1;
		else
		rst = 0;
		#1;
		$display("time=%t | rst=%b | j=%b |k=%b| q=%b | qbar=%b",$time,rst,j,k,q,qbar);
		end
	$finish;
	end
endmodule


