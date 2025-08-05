`timescale 1ns/1ns
module themuxQ4 (input s0,s1,a,b,c,d, output y);
	wire m1,m2;
	supply1 vdd;
	supply0 Gnd;
	assign #12 m1 = (~s0 ? a:b);
	assign #12 m2 = (~s0 ? c:d);
	assign #12 y = (~s1 ? m1:m2);
endmodule