%Passo 0
%ATENCAO - numa function o nome de um ficheiro � sempre igual ao nome da funcao

function [haSolucao] = Passo0(numRecetores, numEmissores, matriz_cobertura, offline)


%storage = zeros([1 numEmissores]);


if offline ~= 0
    for j=1 : numRecetores
        matriz_cobertura(offline + 1, j) = 0;
        
    end
end

for j=1 : numRecetores
    haSolucao = true;
    soma = 0;
    for i=1 : numEmissores
        soma = soma + matriz_cobertura(i, j);
        
    end
     
    if soma < 2
      haSolucao = false;
    end
    if haSolucao == false
        fprintf('O Problema não tem solução.\n');
        return
    end
end
fprintf('O Problema tem solução.\n');
end