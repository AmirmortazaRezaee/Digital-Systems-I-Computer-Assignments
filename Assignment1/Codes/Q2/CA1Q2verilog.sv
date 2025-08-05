`timescale 1ns/1ns
module themux (input s,a,b, output w);
	wire n;
	supply1 vdd;
	supply0 Gnd;
	nmos #(3,4,5) T2(n,Gnd,s) ,
		      T3(w,a,n) ,
		      T4(w,b,s);
	pmos #(5,6,7) T1(n,vdd,s);
	
endmodule