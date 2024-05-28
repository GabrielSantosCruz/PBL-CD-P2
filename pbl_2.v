module pbl_2 (
    input L, M, H, Us, Ua, T,
    output reg Ve, Vs, Bs, Al, Error, 
    output reg [6:0] D1, D2, D3, 
    output reg Sa, Sb, Sc, Sd, Se, Sf, Sg
);

// Instanciação do contador_decrementador
contador_decrementador contador (.clk(clk), .rst(rst), .pulso(pulso), .minutos(minutos), .segundos(segundos));

// Instanciação do display_7_segment
display_7_segment display (.minutos(minutos), .segundos(segundos), .seg_a(D1), .seg_b(D2), .seg_c(D3));

// Lógica para ativação das válvulas e detecção de erro
always @* begin
    Ve = !(H || Error);
    Vs = (Us && !Error && !Medio && Baixo && !Vazio) || (Ua && !Us && T && !Error && !Vazio);
    Bs = (Error && Medio && !Us) || (!Us && T && !Error && Vazio);
    Al = !(M || L || Error);
end

// Lógica para detecção de erro
assign Error = ((!L && M) || (!M && H)) ? 1 : 0;

// Lógica para detecção dos níveis de água
assign Vazio = !L && !M && !H;
assign Baixo = L && !M && !H;
assign Medio = L && M && !H;
assign Alto = L && M && H;

endmodule
