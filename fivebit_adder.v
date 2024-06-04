module fivebit_adder(A, B, Cin, Cout, Adder);
	input [4:0] A, B;
	output [4:0] Adder;
	input Cin;
	output Cout;
	
	wire w0, w1, w2, w3;
	onebit_adder add0(.A(A[0]), .B(B[0]), .Cout(w0), .Adder(Adder[0]));
	onebit_adder add1(.A(A[1]), .B(B[1]), .Cin(w0), .Cout(w1), .Adder(Adder[1]));
	onebit_adder add2(.A(A[2]), .B(B[2]), .Cin(w1), .Cout(w2), .Adder(Adder[2]));
	onebit_adder add3(.A(A[3]), .B(B[3]), .Cin(w2), .Cout(w3), .Adder(Adder[3]));
	onebit_adder add4(.A(A[4]), .B(B[4]), .Cin(w3), .Adder(Adder[4]));
endmodule