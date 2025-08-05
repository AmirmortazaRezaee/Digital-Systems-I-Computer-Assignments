module DIV_TOP (input clk, rst, start, input[7:0] M, Q, output[7:0] Quotient, Reminder, output Ready);
	wire LoadM, LoadA, InitA, LoadQ, ShiftAQ, MostOut, LeastSel, ASel;
	
	DIVDP dp(clk, rst, LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel, M, Q, MostOut, Reminder, Quotient);
	DIVCU cu(clk, rst, start, MostOut, LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel, Ready);
	
endmodule
