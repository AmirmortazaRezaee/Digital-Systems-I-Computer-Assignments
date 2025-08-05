`timescale 1ns/1ns
module themuxQ3TB1 ();
	logic ss0 , ss1 , aa , bb , cc , dd;
	wire yy;
	themuxQ3 CUT3(ss0,ss1,aa,bb,cc,dd,yy);
	initial begin
        ss0 = 0; ss1 =0; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =0; aa = 1; bb = 0; cc=0; dd=0;// a check
        #200 ss0 = 0; ss1 =0; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =0; aa = 0; bb = 1; cc=0; dd=0;
        #200 ss0 = 1; ss1 =0; aa = 0; bb = 1; cc=0; dd=0;//b check
        #200 ss0 = 1; ss1 =0; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =0; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =1; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =1; aa = 0; bb = 0; cc=1; dd=0;//c check
        #200 ss0 = 0; ss1 =1; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 1; ss1 =1; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 1; ss1 =1; aa = 0; bb = 0; cc=0; dd=1;
        #200 ss0 = 0; ss1 =1; aa = 0; bb = 0; cc=0; dd=1;//d check
	#300 $stop;
	end
endmodule