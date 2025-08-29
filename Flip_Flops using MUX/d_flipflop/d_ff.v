module mux_21(a,b,s,y);
	input a,b,s;
	output y;

	assign y = s ? b : a;
endmodule

module d_latch(en,d,q);
	input en,d;
	output reg q;
	wire n1;
    mux_21 u1 (
        .s(en),
        .a(q),
        .b(d),
        .y(n1)
    );

    always @(*) begin
		q = n1;
	end
   
endmodule

module d_ff(clk,d,q);
	input clk,d;
	output q;
	wire qm;

	d_latch u2 (
			.en(~clk),
			.d(d),
			.q(qm)
	);

	d_latch u3 (
			.en(clk),
			.d(qm),
			.q(q)
	);
	

endmodule
	
		
