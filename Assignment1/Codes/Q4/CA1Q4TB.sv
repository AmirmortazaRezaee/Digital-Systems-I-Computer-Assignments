`timescale 1ns/1ns
module themuxQ4TB ();
	logic ss0 , ss1 , aa , bb , cc , dd;
	wire yy;
	themuxQ4 CUT4(ss0,ss1,aa,bb,cc,dd,yy);
	initial begin
        ss0 = 0; ss1 =0; aa = 0; bb = 0; cc=0; dd=0;
        #200 ss0 = 0; ss1 =0; aa = 1; bb = 0; cc=0; dd=0;//a check
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