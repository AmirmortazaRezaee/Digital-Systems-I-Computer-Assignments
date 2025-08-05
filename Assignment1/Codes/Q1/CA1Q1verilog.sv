`timescale 1ns/1ns
module thenor (input a,b, output w);
	wire y;
	supply1 Vdd;
	supply0 Gnd;
	nmos #(3,4,5) T1(w,Gnd,a) ,
		      T2(w,Gnd,b);
	pmos #(5,6,7) T3(w,y,a) ,
		      T4(y,Vdd,b);
endmodule