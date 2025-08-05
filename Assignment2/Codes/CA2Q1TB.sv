`timescale 1ns/1ns
module noradderTB ();
	logic aa1,aa0,bb1,bb0,cc0;
	wire cc2,ss1,ss0;
	noradder CUT(aa1,aa0,bb1,bb0,cc0,cc2,ss1,ss0);
	initial begin
	aa1=0; aa0=0; bb1=1; bb0=0; cc0=1;
	#100 aa0=1;
	#100 $stop;
	end
endmodule
