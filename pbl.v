module pbl(L, M, H, Us, Ua, T, Ve, Vs, Bs, Al, Error, D1, D2, D3, Sa, Sb, Sc, Sd, Se, Sf, Sg);
	
	// Definição das Entradas:
	input L, M, H, Us, Ua, T;

	// Definição das Saídas:
	output Ve, Vs, Bs, Al, Error, D1, D2, D3, Sa, Sb, Sc, Sd, Se, Sf, Sg;
	
	/* ---------------------------------------------- */
	
	// Fios para Negar L, M e H:
	wire L_neg, M_neg, H_neg;
	
	not Negar_L (L_neg, L); // ~ L
	
	not Negar_M (M_neg, M); // ~ M
	
	not Negar_H (H_neg, H); // ~ H
	
	/* ---------------------------------------------- */
	
	// Fios para Definir Erro:
	wire NotL_M, NotM_H;

	// Logica para Erro:
	and Operacao_1 (NotL_M, L_neg, M); // (~ L) * (M)
	
	and Operacao_2 (NotM_H, M_neg, H); // (~ M) * (H)
	
	or Error_Def (Error, NotL_M, NotM_H); // Erro = (~ L) * (M) + (~ M) * (H)
	
	/* ---------------------------------------------- */
	
	// Fios para para Valvula  de Entrada:
	wire Ve_neg;
	
	// // Valvula será desativada sob as circunstâncias de Erro ou Caso Esteja em Nivel Alto:
	or Desativar_Valvula (Ve_neg, H, Error);
	
	// Lógica Inversa para acionamento da Valvula de Entrada:
	not Acionar_Valvula (Ve, Ve_neg); 
	
	/* ---------------------------------------------- */
	
	// Fios para o Nível de Água:
	wire Vazio, Baixo, Medio, Alto;
	
	// Logica para Nivel Vazio:
	and Nivel_Vazio (Vazio, L_neg, M_neg, H_neg); // Vazio = (~ L) * (~ M) * (~ H)
	
	// Logica para Nivel Baixo:
	and Nivel_Baixo (Baixo, L, M_neg, H_neg); // Baixo = L * (~ M) * (~ H)
	
	// Logica para Nivel Medio:
	and Nivel_Medio (Medio, L, M, H_neg); // Medio = L * M * (~H)
	
	// Logica para Nivel Alto:
	and Nivel_Alto (Alto, L, M, H); // Alto = L * M * H
	
	/* ---------------------------------------------- */
	
	// Negar os Níveis de Água e Erro para utilizar nas operações:
	wire Vazio_neg, Baixo_neg, Medio_neg, Alto_neg, Erro_neg;
	
	not Negar_Vazio (Vazio_neg, Vazio); // ~ Vazio
	
	not Negar_Baixo (Baixo_neg, Baixo); // ~ Baixo
	
	not Negar_Medio (Medio_neg, Medio); 
	
	not Negar_Alto (Alto_neg, Alto);
	
	not Negar_Error (Error_neg, Error); // ~ Erro
	
	/* ---------------------------------------------- */
	
	// Fios para Gotejamento:
	
	wire Us_neg, Vs1, Vs2;
	
	// Lógica para Gotejamento:
	not Negar_Us (Us_neg, Us); // ~ Us 
	
	and Operacao_3 (Vs1, Ua, Us_neg, Error_neg, Medio_neg, Baixo, Vazio_neg); // Ua * (~ Us) * (~ Erro) * (~ Medio) * Baixo * (~ Vazio)
	
	and Operacao_4 (Vs2, Ua, Us_neg, T, Error_neg, Vazio_neg); // Ua * (~ Us) * T * (~ Erro) * (~ Vazio)
	
	or Gotejamento (Vs, Vs1, Vs2); 
	
	/* ---------------------------------------------- */
	
	// Fios para Aspersao:
	wire Ua_neg, Temp_neg, Bs1, Bs2;
	
	// Lógica para Aspersao:
	not Negar_Ua (Ua_neg, Ua); // ~ Ua
	
	not Negar_Temperatura (Temp_neg, T); // ~ T
	
	and Operacao_5 (Bs1, Error_neg, Medio, Us_neg);
	
	and Operacao_6 (Bs2, Us_neg, Temp_neg, Alto, Error_neg);
	
	or Aspersao (Bs, Bs1, Bs2);
	
	/* ---------------------------------------------- */
	// Logica para Alarme:
	or Acionar_Alarme (Al, M_neg, L_neg, Error);
	
	/* ---------------------------------------------- */
	
	// Apagar os Leds que não serão usados na Matriz de 7 Segmentos:
	not (D1, 0);
	not (D2, 0);
	not (D3, 0);
	not (Sb, 0);
	not (Sc, 0);
	not (Se, 0);
	not (Sf, 0);
	
	// Fios para os 3 Leds que se irão exibir os níveis de Água:
	wire La, Ld, Lg;
	
	// Exibir Nivel de Água Mínimo:
	and (Ld, L, Error_neg);
	not (Sd, Ld);

	// Exibir Nivel de Água Médio:
	and (Lg, L, M, Error_neg);
	not (Sg, Lg);
	
	// Exibir Nivel de Água Alto:
	and (La, L, M, H, Error_neg);
	not (Sa, La);
	
endmodule
