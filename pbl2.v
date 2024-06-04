module pbl2 (H, M, L, Bs, Vs, clock, one_second_clock, led_matriz_clock, bcd, column, lines, A, B, C, D, E, F, G, bcd_10s, bcd_1m, bcd_10m, seven_seg_digit, Error);
	input H, M, L, Bs, Vs, clock, Error;
	output one_second_clock, led_matriz_clock;
	output A, B, C, D, E, F, G;
	output [3:0] seven_seg_digit;
	output [4:0] column;
	output [6:0] lines;
	output [3:0] bcd, bcd_10s, bcd_1m, bcd_10m;
	
	// Divisor de Clock, de 50MHz para 1Hz e 1560Hz -> Serão usados nos displays de 7-Segmentos e LEDs, respectivamente.
	from_50mhz_to_1hz d0(.clock(clock), .led_matriz_clock(led_matriz_clock), .one_second_clock(one_second_clock));
	
	// Varrendo a matriz de LEDs - 1560Hz
	led_column_alternator alt0(.clock(led_matriz_clock), .column(column));
	
	assign lines[3] = 1; // Vai apagar a linha 3, pois ela não foi usada.
	
	// Níveis na matriz de LEDs:
	assign lines[0] = !(L);
	assign lines[1] = !(M);
	assign lines[2] = !(H);
	
	// INÍCIO - BLOCO DOS SISTEMAS DE ASPERSÃO E GOTEJAMENTO NA MATRIZ DE 7-SEG: -------------------------------------------------
	
	// Acende partes da letra "A" na linha "6" -> Se a aspersão (Bs) e uma das colunas, de 3 a 0, estiverem ligadas.
	// Acende partes da letra "g" na linha "6" -> Se o gotejamento (Vs) e qualquer uma das colunas estiverem ligados.
	assign lines[6] = !((Bs && (column[3] || column[2] || column[1] || column[0])) || Vs);
	
	// Acende partes da letra "A" na linha "5" -> Se a aspersão (Bs) e uma das colunas, 4 ou 2, estiverem ligadas.
	// Acende partes da letra "g" na linha "5" -> Se o gotejamento (Vs) e uma das colunas, 4 ou 2 ou 0, estiverem ligadas.
	assign lines[5] = !((Bs && (column[4] || column[2])) || (Vs && (column[4] || column[2] || column[0])));
	
	// Acende partes da letra "A" na linha "4" -> Se a aspersão (Bs) e uma das colunas, de 3 a 0, estiverem ligadas.
	// Acende partes da letra "g" na linha "4" -> Se o gotejamento (Vs) e uma das colunas, 4 ou 3 ou 2 ou 0, estiverem ligadas.
	assign lines[4] = !((Bs && (column[3] || column[2] || column[1] || column[0])) || (Vs && (column[4] || column[3] || column[2] || column[0])));
	
	// FIM  - BLOCO DOS SISTEMAS DE ASPERSÃO E GOTEJAMENTO NA MATRIZ DE 7-SEG ----------------------------------------------------
	
	// Contadores BCD
	// bcd = contador de 1 segundo
	// bcd_10s = contador de 10 segundo
	// bcd_1m = contador de 1 minuto
	// bcd_10m = contador de 10 minutos
	bcd_counter bcd0(.clock(one_second_clock), .bcd(bcd), .Bs(Bs), .Vs(Vs), .Error(Error));
	bcd_counter_10s bcd1(.bcd_1s(bcd), .bcd(bcd_10s));
	bcd_counter_1m bcd2(.bcd_10s(bcd_10s), .bcd(bcd_1m));
	bcd_counter_10m bcd3(.bcd_1m(bcd_1m), .bcd(bcd_10m));
	
	// Varrendo os Dígitos do Mostrador de 7-Segmentos - 1560Hz
	seven_seg_digit_alt alt1(.clock(one_second_clock), .digit(seven_seg_digit));
	
	// Codificando o BCD em 7-Segmentos
	wire A_1s, B_1s, C_1s, D_1s, E_1s, F_1s, G_1s;
	wire A_10s, B_10s, C_10s, D_10s, E_10s, F_10s, G_10s;
	wire A_1m, B_1m, C_1m, D_1m, E_1m, F_1m, G_1m;
	wire A_10m, B_10m, C_10m, D_10m, E_10m, F_10m, G_10m;
	//encoder_bcd_7seg enc0(.bcd(bcd), .A(A_1s), .B(B_1s), .C(C_1s), .D(D_1s), .E(E_1s), .F(F_1s), .G(G_1s)); // Em conjunto com o dígito 0;
	//encoder_bcd_7seg enc1(.bcd(bcd_10s), .A(A_10s), .B(B_10s), .C(C_10s), .D(D_10s), .E(E_10s), .F(F_10s), .G(G_10s)); // Em conjunto com o dígito 1;
	//encoder_bcd_7seg enc2(.bcd(bcd_1m), .A(A_1m), .B(B_1m), .C(C_1m), .D(D_1m), .E(E_1m), .F(F_1m), .G(G_1m)); // Em conjunto com o dígito 2;
	//encoder_bcd_7seg enc3(.bcd(bcd_10m), .A(A_10m), .B(B_10m), .C(C_10m), .D(D_10m), .E(E_10m), .F(F_10m), .G(G_10m)); // Em conjunto com o dígito 3;
	/*
	// Exibindo os números de acordo com o dígito ativo
	always @(seven_seg_digit) begin
		// Apagando todos os números, no estado inicial
		A = 1;
		B = 1;
		C = 1;
		D = 1;
		E = 1;
		F = 1;
		G = 1;
		
		// Alternando os números exibidos, de acordo com o dígito ativo no momento
		A = (seven_seg_digit[0] & A_1s) | (seven_seg_digit[1] & A_10s) | (seven_seg_digit[2] & A_1m) | (seven_seg_digit[3] & A_10m);
		B = (seven_seg_digit[0] & B_1s) | (seven_seg_digit[1] & B_10s) | (seven_seg_digit[2] & B_1m) | (seven_seg_digit[3] & B_10m);
		C = (seven_seg_digit[0] & C_1s) | (seven_seg_digit[1] & C_10s) | (seven_seg_digit[2] & C_1m) | (seven_seg_digit[3] & C_10m);
		D = (seven_seg_digit[0] & D_1s) | (seven_seg_digit[1] & D_10s) | (seven_seg_digit[2] & D_1m) | (seven_seg_digit[3] & D_10m);
		E = (seven_seg_digit[0] & E_1s) | (seven_seg_digit[1] & E_10s) | (seven_seg_digit[2] & E_1m) | (seven_seg_digit[3] & E_10m);
		F = (seven_seg_digit[0] & F_1s) | (seven_seg_digit[1] & F_10s) | (seven_seg_digit[2] & F_1m) | (seven_seg_digit[3] & F_10m);
		G = (seven_seg_digit[0] & G_1s) | (seven_seg_digit[1] & G_10s) | (seven_seg_digit[2] & G_1m) | (seven_seg_digit[3] & G_10m);
	end*/
	encoder_bcd_7seg enc0(.bcd(bcd), .A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G)); // Em conjunto com o dígito 0;
endmodule