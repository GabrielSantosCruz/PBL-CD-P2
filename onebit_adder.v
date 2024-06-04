module onebit_adder(A, B, Cin, Cout, Adder);
	input A, B, Cin;
	output Cout, Adder;
	
	wire w0, w1, w2;
	
	and And0(w0, A, B);
	xor Xor0(w1, A, B);
	and And1(w2, w1, Cin);
	xor Xor1(Adder, w1, Cin);
	or Or0(Cout, w0, w2);
endmodule