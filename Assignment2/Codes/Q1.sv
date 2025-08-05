`timescale 1ns/1ns
module inv (input a, output w);
	not #(5,7) (w,a);
endmodule

module thenor (input a,b, output w);
	nor #(10,14) (w,a,b);
endmodule

module noradder (input a1,a0,b1,b0,c0, output c2,s1,s0);
	wire na0,nb0,nc0,n1,n2,n3,n4,n5,n6,c1,nc1,na1,nb1,n10,n11,n12,n13,n14,n15,n17;
	supply1 Vdd;
	supply0 Gnd;
	//first_layer
	inv NA0 (a0,na0);
	inv NB0 (b0,nb0);
	inv NC0 (c0,nc0);
	thenor N1 (a0,b0,n1);
	thenor N2 (na0,nb0,n2);
	thenor N3 (n1,n2,n3);
	thenor N4 (n3,c0,n4);
	inv i5 (n3,n5);
	thenor N6 (n5,nc0,n6);
	thenor N7 (n4,n6,s0);
	thenor N8 (n6,n2,nc1);
	inv i9 (nc1,c1);
	//second_layer
	inv NA1 (a1,na1);
	inv NB1 (b1,nb1);
	thenor N10 (a1,b1,n10);
	thenor N11 (na1,nb1,n11);
	thenor N12 (n10,n11,n12);
	thenor N13 (n12,c1,n13);
	inv i14 (n12,n14);
	thenor N15 (n14,nc1,n15);
	thenor N16 (n13,n15,s1);
	thenor N17 (n15,n11,n17);
	inv i18 (n17,c2);
endmodule