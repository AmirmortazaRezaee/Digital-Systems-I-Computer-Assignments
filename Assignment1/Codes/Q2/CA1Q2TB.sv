`timescale 1ns/1ns
module themuxTB ();
	logic ss , aa , bb;
	wire ww;
	themux CUT2(ss,aa,bb,ww);
	initial begin
        ss = 0; aa = 0; bb = 0;
        #70 ss = 0; aa = 1; bb = 0;
        #70 ss = 1; aa = 1; bb = 0; //worst case to 0
        #70 ss = 1; aa = 1; bb = 1;
        #70 ss = 1; aa = 0; bb = 1;
        #70 ss = 0; aa = 0; bb = 1;
        #70 ss = 1; aa = 0; bb = 1; //worst case to 1
        #70 ss = 1; aa = 1; bb = 1;
	#300 $stop;
	end
endmodule