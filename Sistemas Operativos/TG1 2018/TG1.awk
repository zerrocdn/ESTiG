BEGIN{
Numero_Cliques = 0;
Numero_Teclas_Ecra_Pressionadas = 0;
Numero_Palavras_Completadas = 0;
Numero_Frases_Completadas = 0;
Numero_Caracteres_Simbolos_Apagados = 0;
Log_Start = 0;
Log_End = 0;
Teclas_Ecra_Poupadas_Comparacao_Escrita_Teclado_Qwerty = 0;
}

$4 == "START_LOGGING"{
	Log_Start = $1;
}

$1 == "Numero_Cliques"{
	Numero_Cliques = $2;
}

$1 == "Numero_Teclas_Ecra_Pressionadas"{
	Numero_Teclas_Ecra_Pressionadas = $2;
}

$1 == "Teclas_Ecra_Poupadas_Comparacao_Escrita_Teclado_Qwerty"{
	Teclas_Ecra_Poupadas_Comparacao_Escrita_Teclado_Qwerty = $2;
}

$1 == "Numero_Palavras_Completadas"{
	Numero_Palavras_Completadas = $2;
}

$1 == "Numero_Frases_Completadas"{
	Numero_Frases_Completadas = $2;
}

$1 == "Numero_Caracteres_Simbolos_Apagados"{
	Numero_Caracteres_Simbolos_Apagados = $2;
}


FNR == b -1 {Log_End = $1;}

END{

File_Name = FILENAME;
split(File_Name, arr, "/")

printf "%s;%s;%d;%d;%d;%d;%d;%d;%s;%s;%s\n", Log_Start, Log_End, Numero_Cliques, Numero_Teclas_Ecra_Pressionadas, Teclas_Ecra_Poupadas_Comparacao_Escrita_Teclado_Qwerty, Numero_Palavras_Completadas, Numero_Frases_Completadas, Numero_Caracteres_Simbolos_Apagados, arr[4], arr[5], arr[6]; 
}
