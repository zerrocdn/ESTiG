%solução contem o conj dos emissores que correm todos o recetores

function [solucao] = Passo1(numEmissores, numRecetores, cobertura, offline)
    u=numRecetores;

    solucao = zeros(1,numEmissores);
   	%nr de recetores que sao cobertos no minimo por 2 emissores
    wj = zeros(1,numRecetores);
    if offline ~= 0
        for j=1 : numRecetores
            cobertura(offline, j) = 0;
        
        end
    end
   
   
    while u > 0
	%identificar o emissor mais eficiente
    
    nr_emissores_cobreMin = numEmissores + 1;
    rec_escolhido = 0;
    
    for j=1 : numRecetores
        nr_emissores_cobre = 0;
        for i=1 : numEmissores
            if (solucao(i) == 0)
            nr_emissores_cobre = nr_emissores_cobre + cobertura(i,j);
            end
        end
        %se o nr de emissores for menor que o nr de emissores min,
        %substitui para o nr de emissores minimo
        if (nr_emissores_cobre < nr_emissores_cobreMin && nr_emissores_cobre>0)
            nr_emissores_cobreMin = nr_emissores_cobre;
            rec_escolhido = j;            
        end    
    end

    emissor_escolhido = 0;
    numero_recetor_cobre_max = 0;
    for i = 1 : numEmissores
       	nr_recetores_cobre = 0;
        if(cobertura(i, rec_escolhido) == 1 && solucao(i) == 0 )
        	%cobertura(i, rec_escolhido) == 1 ve se o emissor i cobre o rec_escolhido
        	%verifica se emissor i n�o faz parte da emissao
       		for j = 1 : numRecetores
        
        
	            nr_recetores_cobre = nr_recetores_cobre + cobertura(i, j);
	        	%incrementa o numero de coberturas do emissor
          
       		end
        	if (nr_recetores_cobre > numero_recetor_cobre_max)
            	numero_recetor_cobre_max = nr_recetores_cobre;
            	emissor_escolhido = i; 
        	end
       
        
    
       	end

    end



    %no vetor solucao, a posi��o do rec_escolhido fica igual a 1
    solucao(emissor_escolhido) = 1;
    for j = 1 :numRecetores
    
    	wj(j) = wj(j) + cobertura(emissor_escolhido,j);
    
    
    end
    if all(wj >= 2 )
    	u = 0;
    end
    
    end
end





