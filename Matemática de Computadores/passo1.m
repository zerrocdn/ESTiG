%Passo 1

function [solucao] = passo1(numEmissores, numRecetores, cobertura)

solucao = zeros([1 numEmissores]);
display (solucao);
porCobrir = numRecetores;

while porCobrir > 0
    
    eficienciaMaxima = 0;
    maisEficiente = 0;
    recetoresPorCobrir = 0;
    
    for i=1 : numEmissores
        eficiencia = 0;
        for j=1 : numRecetores
            eficiencia = eficiencia + cobertura(i, j);
                
        end
        if eficiencia > eficienciaMaxima
            eficienciaMaxima = eficiencia;
            maisEficiente = i;
            if cobertura(maisEficiente, j) == 1
                recetoresPorCobrir(j) = 0;
            end
        end
    end
    
    
    solucao(maisEficiente) = 1;
    porCobrir = sum(recetoresPorCobrir);
    
end
end
