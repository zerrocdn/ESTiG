%Passo 0

function [haSolucao] = passo0(numEmissores, numRecetores, cobertura)

for j=1 : numRecetores
    haSolucao = false;
    for i=1 : numEmissores
        if cobertura(i, j) == 1
            haSolucao = true;
            break
        end
    end
    if haSolucao == false
        fprint('O Problema não tem solução.');
        return
    end
end
end
