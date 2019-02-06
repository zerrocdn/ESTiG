%Passo 0
%ATENCAO - numa function o nome de um ficheiro é sempre igual ao nome da funcao

function [haSolucao] = Passo0(numRecetores, numEmissores, matriz_cobertura)
     %storage = zeros([1 numEmissores]);

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