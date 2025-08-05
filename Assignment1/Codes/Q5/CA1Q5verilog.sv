`timescale 1ns/1ns
module themuxQ5 (input s0,s1,a,b,c,d, output y3,y4);
	wire ns0,ns1,g1,g2,g3,g4,m1,m2;
	supply1 vdd;
	supply0 Gnd;
	nor #(10,14) G6(ns0,s0,s0);
	nor #(10,14) G7(ns1,s1,s1);
	nor #(15,21) G1(g1,a,s0,s1);
	nor #(15,21) G2(g2,b,ns0,s1);
	nor #(15,21) G3(g3,c,s0,ns1);
	nor #(15,21) G4(g4,d,ns0,ns1);
	nor #(20,28) G5(y3,g1,g2,g3,g4);
	assign #12 m1 = (~s0 ? a:b);
	assign #12 m2 = (~s0 ? c:d);
	assign #12 y4 = (~s1 ? m1:m2);
endmodule