module D_ff(rst,clk,d,q,qbar);
	input rst,clk,d;
	output reg q;
	output qbar;

	assign qbar = ~q;

	always@(posedge clk) begin
	if(rst)
		q <= 0;
	else
		q <= d;
	end
endmodule
