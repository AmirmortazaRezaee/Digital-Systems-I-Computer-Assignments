`timescale 1ns/1ns
module inv (input a, output w);
	not #(5,7) (w,a);
endmodule
module themux (input s,a,b, output w);
	assign #12 w = ~s ? a:b;
endmodule
module muxadder (input a1,a0,b1,b0,c0, output c2,s1,s0);
	wire m1,m2,m3,m5,m6,c1,m8,m9,m10,m12,m13;
	supply1 vdd;
	supply0 Gnd;
	//first_layer
	inv i1 (a0,m1);
	themux MUX2 (b0,a0,m1,m2);
	inv i3 (m2,m3);
	themux MUX4 (c0,m2,m3,s0);
	themux MUX5 (a0,a0,b0,m5);
	themux MUX6 (b0,a0,b0,m6);
	themux MUX7 (c0,m5,m6,c1);
	//second_layer
	inv i8 (a1,m8);
	themux MUX9 (b1,a1,m8,m9);
	inv i10 (m9,m10);
	themux MUX11 (c1,m9,m10,s1);
	themux MUX12 (a1,a1,b1,m12);
	themux MUX13 (b1,a1,b1,m13);
	themux MUX14 (c1,m12,m13,c2);
endmodule
