`include "jk_ff.v"
module tb;
	reg clk,j,k;
	wire q;
jk_ff dut(
	.clk(clk),
	.j(j),
	.k(k),
	.q(q)
	);

initial begin
	clk = 0;
	forever #5 clk = ~clk;
	end

initial begin
	j = 0;
	k = 0;
	#10;
	j = 0;
    k = 1;
	#20;
	j = 1;
	k = 0;
	#30;
	j = 1;
	k = 1;
	#40;
	j = 0;
	k = 0;

	end

initial begin
#100;
$finish;
end
endmodule




