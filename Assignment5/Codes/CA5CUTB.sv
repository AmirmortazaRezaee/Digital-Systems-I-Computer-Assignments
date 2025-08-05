module DIV_CU_TB ();
	logic clk = 1'b0;
	logic rst = 0;
	logic start = 0, MostOut = 0; 
	wire LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel, Ready;

	DIVCU UUT2(clk, rst, start, MostOut, LoadM, LoadA,
			   InitA, LoadQ, ShiftAQ, LeastSel, Ready);
	
	always #5 clk <= ~clk;
	  
	initial begin
		#1 rst = 1;
		#1 rst = 0;
		#2 start = 1'b1;
		#9 start = 1'b0;
		#10 MostOut = 1'b0;
		#30 MostOut = 1'b1;
		#300 $stop;
	end
  
 endmodule

