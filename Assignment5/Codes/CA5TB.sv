`timescale 1ns/1ns
module DIV_TB ();
	logic clk = 1'b0;
	logic rst = 0;
	logic start = 0;
	logic [7:0] M;
	logic [7:0] Q;
	wire [7:0] Quotient, Reminder;
	wire Ready;
	
	DIV_TOP CUT1(clk, rst, start, M, Q, Quotient, Reminder, Ready);
	
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