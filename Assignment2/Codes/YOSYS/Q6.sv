`timescale 1ns/1ns
module Q6assign (input a1,a0,b1,b0,c0, output c2,s1,s0);
	assign {c2,s1,s0}={a1,a0}+{b1,b0}+{c0};
endmodule

