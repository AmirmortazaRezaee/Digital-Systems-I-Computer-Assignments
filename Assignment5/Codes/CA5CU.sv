  module DIVCU (input clk, rst, start, MostOut, 
			  output logic LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel, Ready);
	wire CNT;
	logic Init_counter, Inc_counter;
	logic[2:0] pstate, nstate;
	logic[2:0] Count;
	parameter [2:0]
	Idle = 0, Init = 1 , Load = 2, Shift = 3, Check = 4;
	
	always @(pstate, start, CNT, MostOut) begin
		nstate = 0;
		{LoadM, LoadA, InitA, LoadQ, ShiftAQ, LeastSel, Ready} = 7'b0;
		{Init_counter, Inc_counter} = 2'b0;
			case(pstate)
				Idle: begin nstate = start ? Init : Idle; Ready = 1'b1; end
				Init: begin nstate = start ? Init : Load; {Init_counter, InitA} = 2'b11; end
				Load: begin nstate = Shift; {LoadM, LoadQ}=2'b11; end
				Shift: begin nstate = Check; ShiftAQ = 1'b1;  end
				Check: begin nstate = CNT ? Idle : Shift; Inc_counter=1'b1; 
							 LeastSel=~MostOut; LoadA = ~MostOut; end
				default: nstate = Idle;
			endcase
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			pstate <= Idle;
		else
			pstate <= nstate;
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			Count <= 3'b0;
		else
			if (Init_counter) Count <= 3'd0;
			else
			if (Inc_counter) Count <= Count + 1;
	end
	
	assign CNT = &Count;
	
endmodule