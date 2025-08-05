`timescale 1ns/1ns
module DIV_pp_TB ();
	reg clk = 1'b0;
	reg rst = 0;
	reg start = 0;
	reg [7:0] M;
	reg [7:0] Q;
	wire [7:0] Quotient, Reminder;
	wire Ready;
	
	CA5TOPPP CUT2(clk, rst, start, M, Q, Quotient, Reminder, Ready);
	
	always #5 clk <= ~clk;
	
	initial begin
		#3 rst = 1;
		#3 rst = 0;
		#13 Q = 8'd231;
		#13 M = 8'd13;
		#3 start = 1;
		#13 start = 0;
		#300 $stop;
	end

endmodule
