`include "d_ff.v"
module tb;
	reg rst,clk,d;
	wire q,qbar;
	integer i;
 D_ff dut (rst,clk,d,q,qbar);
 	initial begin
	clk=0;
	forever #5 clk = ~clk;
	end

	initial begin
	rst = 1 ; d = 0;
	#10 rst = 0;

	for(i=0;i<20;i=i+1) begin
	
		d = $random %2;
		rst = ($random % 10 == 0); 
		@(posedge clk);
		#1;
		$display("time=%t | rst=%b | d=%b | q=%b | qbar=%b",$time,rst,d,q,qbar);
		end
	$finish;
	end
endmodule

//# End time: 15:36:18 on Aug 28,2025, Elapsed time: 0:00:01
//# Errors: 0, Warnings: 0
//# End time: 15:36:29 on Aug 28,2025, Elapsed time: 0:02:57
//# Errors: 0, Warnings: 0
//# vsim tb 
//# Start time: 15:36:29 on Aug 28,2025
//# Loading work.tb
//# Loading work.D_ff
//# time=                  16 | rst=0 | d=0 | q=0 | qbar=1
//# time=                  26 | rst=0 | d=1 | q=1 | qbar=0
//# time=                  36 | rst=0 | d=1 | q=1 | qbar=0
//# time=                  46 | rst=0 | d=1 | q=1 | qbar=0
//# time=                  56 | rst=0 | d=1 | q=1 | qbar=0
//# time=                  66 | rst=0 | d=0 | q=0 | qbar=1
//# time=                  76 | rst=0 | d=1 | q=1 | qbar=0
//# time=                  86 | rst=1 | d=1 | q=0 | qbar=1
//# time=                  96 | rst=0 | d=1 | q=1 | qbar=0
//# time=                 106 | rst=0 | d=1 | q=1 | qbar=0
//# time=                 116 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 126 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 136 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 146 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 156 | rst=0 | d=1 | q=1 | qbar=0
//# time=                 166 | rst=1 | d=1 | q=0 | qbar=1
//# time=                 176 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 186 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 196 | rst=0 | d=0 | q=0 | qbar=1
//# time=                 206 | rst=0 | d=1 | q=1 | qbar=0
//# ** Note: $finish    : d_tb.v(24)
//#    Time: 206 ps  Iteration: 0  Instance: /tb
