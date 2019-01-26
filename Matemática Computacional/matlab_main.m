%dados

numRecetores = 18;
numEmissores = 6;
cobertura = [1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 1 1 1 0 1 0 0 0 0 0
    0 1 0 1 1 1 1 1 1 1 1 1 0 0 1 1 0 0
    0 0 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 1 1 1
    0 0 0 0 0 0 0 0 0 0 1 1 0 1 1 1 1 1];
%Passo 0 : Verificar se o problema tem solução
% y = f(x) -> (variável se saída) = nomeDaFunção(variáveis de entrada) - sintaxe de uma função em matlab.

[haSolucao] = passo0(numEmissores, numRecetores, cobertura);

%Passo 1 : Encontrar solução.

[solucao] = passo1(numEmissores, numRecetores, cobertura);
