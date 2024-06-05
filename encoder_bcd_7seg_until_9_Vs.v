module encoder_bcd_7seg_until_9_Vs(bcd, Vs, A, B, C, D, E, F, G);
	input [3:0] bcd;
	input Vs;
	output A, B, C, D, E, F, G;
	
	wire bcdA, bcdB, bcdC, bcdD;
	assign bcdA = bcd[3];
	assign bcdB = bcd[2];
	assign bcdC = bcd[1];
	assign bcdD = bcd[0];
	
	always @(Vs) begin
		assign A = (!bcdC & (!bcdA & bcdB & bcdD || bcdA & !bcdB & !bcdD));
		assign B = (!bcdA & (!bcdB & bcdC & bcdD || bcdB & !bcdC & !bcdD));
		assign C = (!bcdA & bcdB & bcdC & bcdD);
		assign D = (!bcdB & !bcdC & !bcdD || !bcdA & (bcdC & bcdD || bcdB & bcdD));
		assign E = (!bcdA & (!bcdD || bcdB) || !bcdB & !bcdC & !bcdD);
		assign F = (!bcdA & (bcdC & bcdD || bcdB & bcdC) || bcdA & !bcdB & !bcdC & !bcdD);
		assign G = (!bcdA & !bcdB & bcdC & !bcdD);
	end
	
endmodule