`timescale 1ns/1ns
module themuxQ3TB2();
	logic ss0 , ss1 , aa , bb , cc , dd;
	wire yy;
	themuxQ3 CUT3(ss0,ss1,aa,bb,cc,dd,yy);
	initial begin
	ss0 = 1; ss1 =1; aa = 1; bb = 1; cc=1; dd=1;
        #200 ss0 = 0; ss1 =1; aa = 1; bb = 1; cc=1; dd=1;
	#200 ss0 = 0; ss1 =1; aa = 1; bb = 0; cc=1; dd=1;
	#200 ss0 = 0; ss1 =0; aa = 1; bb = 0; cc=1; dd=1;
	#200 ss0 = 1; ss1 =0; aa = 1; bb = 0; cc=1; dd=1;//worst case to 0
        #200 ss0 = 0; ss1 =0; aa = 1; bb = 0; cc=1; dd=1;//worst case to 1
	#300 $stop;
	end
endmodule