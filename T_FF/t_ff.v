module T_ff(rst,clk,t,q,qbar);
	input rst,clk,t;
	output reg q;
	output qbar;
	assign qbar = ~q;
	always@(posedge clk or posedge rst) begin
	if(rst)
		q <= 0;
	else begin
		case(t)
		1'b0 : q <= q;
		1'b1 : q <= ~q;
	endcase
		
	end
	end
endmodule
