module ClockTeste(
    input wire clock,
    input wire pause_button,
    output reg led,
    output reg [6:0] segmentos,
    output reg [3:0] displays
);

    reg [50:0] contador;
    reg [9:0] numero;
    reg pause_active;

    always @(posedge clock) begin
			displays <= 4'b1110;
        // Se o botão de pausa estiver ativo, não incrementar o contador
        if (pause_button) begin
            pause_active <= 1;
        end else begin
            pause_active <= 0;
            if (contador == 50000000) begin // Conta até 50 milhões de ciclos de clock (1 segundo)        
                contador <= 0; // Reinicia o contador
                case (numero)        //gfedcba
                    0: segmentos <= 7'b0000001; // 0
                    1: segmentos <= 7'b1001111; // 1
                    2: segmentos <= 7'b0010010; // 2
                    3: segmentos <= 7'b0000110; // 3
                    4: segmentos <= 7'b1001100; // 4
                    5: segmentos <= 7'b0100100; // 5
                    6: segmentos <= 7'b0100000; // 6
                    7: segmentos <= 7'b0001111; // 7 ok
                    8: segmentos <= 7'b0000000; // 8
                    9: segmentos <= 7'b0000100; // 9
                    default: segmentos <= 7'b01100000;  // Desligado
                endcase
                numero <= numero + 1;
                
            end else begin
                if (!pause_active) begin
                    contador <= contador + 1; // Incrementa o contador
                    if (numero > 9) begin
                        numero <= 0;
                    end
                end
            end
        end
    end
endmodule 
