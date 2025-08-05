`timescale 1ns/1ns
module Q5TB ();
	logic aa1,aa0,bb1,bb0,cc0;
	wire cc2q1,ss1q1,ss0q1,cc2q3,ss1q3,ss0q3;
	noradder CUT1(aa1,aa0,bb1,bb0,cc0,cc2q1,ss1q1,ss0q1);
	initial begin
	aa1=0; aa0=0; bb1=0; bb0=0; cc0=0;
	#100 aa0=1;
	#100 bb0=1;
	#100 aa1=1;
	#100 cc0=1;
	#100 bb1=1;
	#100 bb0=0;
	#100 $stop;
	end
	muxadder CUT2(aa1,aa0,bb1,bb0,cc0,cc2q3,ss1q3,ss0q3);
	initial begin
	aa1=0; aa0=0; bb1=0; bb0=0; cc0=0;
	#100 aa0=1;
	#100 bb0=1;
	#100 aa1=1;
	#100 cc0=1;
	#100 bb1=1;
	#100 bb0=0;
	#100 $stop;
	end
endmodule
