module DIV_DP_TB ();
	logic clk = 1'b0;
	logic rst = 0;
	logic LoadM = 0 , LoadA = 0, InitA = 0, LoadQ = 0, ShiftAQ = 0, LeastSel = 0;
	logic [7:0] M;
	logic [7:0] Q;
	wire [7:0] Quotient, Reminder;
	wire MostOut;
	
	DIVDP UUT1(clk, rst, LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel,
			   M, Q, MostOut, Reminder, Quotient);
	
	always #5 clk <= ~clk;
	  
	initial begin
		#3 rst = 1;
		#3 rst = 0;
		#10 LoadM = 1'b1;
			M = 8'd7;
		#1 LoadM = 1'b0;
		#1 InitA = 1'b1;
		#1 LoadQ = 1'b1;
			Q = 8'd212;	
		#1 LoadQ = 1'b0;
		#10 LeastSel = 1'b1;
		#7 LoadQ = 1'b1;
		#7 LoadQ = 1'b0;
		#10 LoadA = 1'b1;
		#10 ShiftAQ = 1'b1;
		#10 LeastSel = 1'b0;
		#300 $stop;
	end
  
 endmodule
