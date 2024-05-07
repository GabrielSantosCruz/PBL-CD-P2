module ClockTeste(
    input wire clock,
    input [3:0] Chave,     
    output reg [6:0] Display,
    output reg [3:0] Digito
);
    
    reg [15:0] contador;
    reg [1:0] digito_atual; // Registrador para controlar o dígito atual

    always @ (posedge clock) begin
        if (contador < 16'd4667) begin
            Digito <= 4'b0111; // Digito 1
            Display <= 7'b0100100; // Número 2
        end else begin 
            Digito <= 4'b1011; // Digito 2
            case (Chave)
                4'b0100: Display <= 7'b0110000; // Número 3
                4'b1100: Display <= 7'b0011001; // Número 4
                default: Display <= 7'b0000000; // Caso padrão, display desligado
            endcase 
        end

        if (contador == 16'd9333) begin
            contador <= 0;
            digito_atual <= ~digito_atual; // Alternar entre os dígitos
        end else begin
            contador <= contador + 1;
        end
    end

endmodule



/*always @ (Chave) begin
	
		case (Chave)
							        //abcdefg
			3'b001: Display <= 7'b1111001; // digito 1
			3'b011: Display <= 7'b0100100; // digito 2
			3'b111: Display <= 7'b0110000; // digito 3

			default: Display <= 7'b1000000;
		endcase
	end*/
/*
	 g
	***
b *   * f
  * a *
   ***
c *   * e
  * d *
   ***
*/