module onebit_comparator(A, B, more, equal, less);
	input A, B;
	output more, equal, less;
	
	wire w0, w1, w2, w3;
	
	not NotA(w0, A);
	not NotB(w1, B);
	and And0(w2, w0, w1);
	and And1(w3, A, B);
	or Or0(equal, w2, w3);
	and And2(less, w0, B);
	and And3(more, A, w1);
	
endmodule