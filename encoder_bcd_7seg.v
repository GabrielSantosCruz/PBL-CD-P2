module encoder_bcd_7seg(bcd, A, B, C, D, E, F, G);
	input [3:0] bcd;
	output A, B, C, D, E, F, G;
	
	wire bcdA, bcdB, bcdC, bcdD;
	assign bcdA = bcd[3];
	assign bcdB = bcd[2];
	assign bcdC = bcd[1];
	assign bcdD = bcd[0];
	
	assign A = (!bcdA & !bcdB & !bcdC || !bcdA & !bcdC & !bcdD);
	assign B = (!bcdA & !bcdB & !bcdC & !bcdD || !bcdA & bcdB & (bcdC ^ bcdD));
	assign C = (!bcdA & !bcdB & !bcdD);
	assign D = (!bcdA & !bcdB & !bcdC || !bcdA & !bcdC & !bcdD || !bcdA & bcdB & bcdC & bcdD || bcdA & !bcdB & !bcdC & bcdD);
	assign E = (!bcdA & (!bcdC || bcdD) || bcdA & !bcdB & !bcdC & bcdD);
	assign F = (!bcdA & (!bcdB || bcdC & bcdD));
	assign G = (!bcdA & (!bcdB & !bcdC || bcdB & bcdC & bcdD));
endmodule