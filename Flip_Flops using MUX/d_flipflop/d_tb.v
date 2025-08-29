`include "d_ff.v"
module tb;
	reg clk,d;
	wire q;

	d_ff dut(
		.clk(clk),
		.d(d),
		.q(q)
		
	);

	initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

	initial begin
	   d = 0;
       #10 d = 1;
       #10 d = 0;
       #10 d = 1;
       #10 d = 0;
       #10 d = 1;
       #10 d = 0;
  end
  initial begin
	#100;
	$finish;
	end

endmodule


