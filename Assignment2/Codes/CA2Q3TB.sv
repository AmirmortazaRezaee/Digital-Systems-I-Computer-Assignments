`timescale 1ns/1ns
module muxadderTB ();
	logic aa1,aa0,bb1,bb0,cc0;
	wire cc2,ss1,ss0;
	muxadder CUTq3(aa1,aa0,bb1,bb0,cc0,cc2,ss1,ss0);
	initial begin
	aa1=1; aa0=0; bb1=0; bb0=0; cc0=1;
	#100 bb0=1;
	#100 $stop;
	end
endmodule
