`timescale 1ns/1ns
module q2adder (input a1,a0,b1,b0,c0, output c2,s1,s0);
	assign #89 {c2,s1,s0}={a1,a0}+{b1,b0}+{c0};
endmodule
