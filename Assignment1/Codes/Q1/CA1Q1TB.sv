`timescale 1ns/1ns
module thenorTB ();
	logic aa , bb;
	wire ww;
	thenor CUT(aa,bb,ww);
	initial begin
	aa=0; bb=0;
	#70 aa=1; bb=0;
	#70 aa=1; bb=1;
	#70 aa=0; bb=1;
	#70 aa=0; bb=0; //worst case to 1
	#70 aa=0; bb=1; //worst case to 0
	#100 $stop;
	end
endmodule