module mux21(a,b,s,y);
	input a,b,s;
	output y;

	assign y = s ? b : a;

endmodule 

module d_latch(en,d,q);
	input en,d;
	output reg q;
	wire n1;
	mux21 dut (
		.a(q),
		.b(d),
		.s(en),
		.y(n1)
	);

	always@(*) begin
		q = n1;
	end
endmodule 


module d_ff(clk,d,q);
	input clk,d;
	output q;
	wire qm;

	d_latch mas (
		.en(~clk),
		.d(d),
		.q(qm)
	);


	d_latch slave (
		.en(clk),
		.d(qm),
		.q(q)
	);


endmodule


module jk_ff(clk,j,k,q);
	input clk,j,k;
	output q;

	wire d_in;

	assign d_in = (j & ~q) | (~k & q); 

	d_ff dut (
		.clk(clk),
		.d(d_in),
		.q(q)
	);

	
endmodule




