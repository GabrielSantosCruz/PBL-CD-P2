module encoder_bcd_7seg_until_1(bcd, Vs, A, B, C, D, E, F, G);
	input [3:0] bcd;
	input Vs;
	output A, B, C, D, E, F, G;
	
	wire bcdA, bcdB, bcdC, bcdD;
	assign bcdA = bcd[3];
	assign bcdB = bcd[2];
	assign bcdC = bcd[1];
	assign bcdD = bcd[0];
	
	always @(Vs) begin
		assign A = (!bcdA & !bcdB & !bcdC & !bcdD);
		assign B = 0;
		assign C = 0;
		assign D = (!bcdA & !bcdB & !bcdC & !bcdD);
		assign E = (!bcdA & !bcdB & !bcdC & !bcdD);
		assign F = (!bcdA & !bcdB & !bcdC & !bcdD);
		assign G = (!bcdA & !bcdB & !bcdC);
	end
	
endmodule