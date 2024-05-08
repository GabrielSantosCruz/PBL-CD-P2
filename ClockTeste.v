module ClockTeste(
    input wire clock,
    input wire pause_button,
    output reg led,
    output reg [6:0] segmentos,
    output reg [3:0] displays
);

    reg [25:0] contador;
    reg [15:0] contador2;
    reg [9:0] numero = 0; // tava [9:0]
	 reg [1:0] numero2 = 3;
    reg pause_active;
    reg [1:0] digito_atual;
	 	
    always @(posedge clock) begin
        if (pause_button) begin
            pause_active <= 1;
        end else begin
            pause_active <= 0;
            if (!pause_active) begin
                contador <= contador + 1; // Incrementa o contador
                if (contador == 50000000) begin // Conta até 50 milhões de ciclos de clock (1 segundo)
                    contador <= 0; // Reinicia o contador
                    numero <= numero - 1; // decrementa o número
						  
                    if (numero == 0) begin
                        numero <= 9; // Reinicia o número se for 9
								numero2 <= numero2 - 1;
									if (numero2 == 0) begin
										numero2 <= 3;
										numero <= 0;
									end
                    end
                end
            end
        end
        
        // Lógica para alternar entre os dígitos dos displays
        if (contador2 == 16'd9333) begin
            contador2 <= 0;
            digito_atual <= ~digito_atual; // Alternar entre os dígitos
        end else begin
            contador2 <= contador2 + 1;
        end
        
		  // Lógica para selecionar o dígito a ser exibido no display 1
		  //================================================================
        if (digito_atual == 2'b00) begin
            displays <= 4'b1110; // Seleciona o primeiro dígito
				case (numero)
					0: segmentos <= 7'b0000001;
					1: segmentos <= 7'b1001111;
					2: segmentos <= 7'b0010010;
					3: segmentos <= 7'b0000110;
					4: segmentos <= 7'b1001100;
					5: segmentos <= 7'b0100100;
					6: segmentos <= 7'b0100000;
					7: segmentos <= 7'b0001111;
					8: segmentos <= 7'b0000000;
					9: segmentos <= 7'b0000100;
					default: segmentos <= 7'b01100000;
			  endcase
			  
		  // Lógica para selecionar o dígito a ser exibido no display 1
		  //================================================================
        end else begin
            displays <= 4'b1101; // Seleciona o segundo dígito
				case (numero2)
					0: segmentos <= 7'b0000001;
					1: segmentos <= 7'b1001111;
					2: segmentos <= 7'b0010010;
					3: segmentos <= 7'b0000110;
					4: segmentos <= 7'b1001100;
					5: segmentos <= 7'b0100100;
					6: segmentos <= 7'b0100000;
					7: segmentos <= 7'b0001111;
					8: segmentos <= 7'b0000000;
					9: segmentos <= 7'b0000100;
					default: segmentos <= 7'b01100000;
			  endcase
        end

        // Lógica para exibir o número nos segmentos
        
    end
endmodule
