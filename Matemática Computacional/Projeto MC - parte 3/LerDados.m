% Seleccionar ficheiro de dados e interpretar a matriz fornecida:
% O programa apresenta ao utilizador os nomes de todos os 
% ficheiros .mat dispon�veis na directoria de trabalho, pede ao 
% utilizador para introduzir o nome (com extens�o .mat) de um deles. 
% Em seguida carrega o ficheiro pretendido para o processar, e apresenta
% uma mensagem adequada se tiver sucesso.

listaFicheiros = dir('*.mat');
numFicheiros = length(listaFicheiros);
fprintf('Existem %i ficheiros.\n', numFicheiros);
if numFicheiros == 0 
    fprintf('Aten��o: n�o h� ficheiros para serem lidos.');
    interromper = input('Deseja terminar a execu��o? S/N', 's');
              res = upper(interromper);
              if res == 'S'
                  quit; % return termina a execu��o do programa (mas n�o a do Matlab)
                  % para sair do Matlab invocar a fun��o 'exit' ou 'quit'

              end

end
for i=1:length(listaFicheiros)
    fname = listaFicheiros(i).name;
    fprintf('%s\n', fname);
end
 

ficheiro = input('Nome do ficheiro a ler:', 's');

try
   mat = load(ficheiro, 'matriz_cobertura'); % devolve matriz numa struct
   M = mat.matriz_cobertura;
   fprintf('Ficheiro lido com sucesso.\n');
   [numLinhas,numColunas] = size(M);
   %fprintf('N�mero de linhas lidas: %i\n', numLinhas);
   %fprintf('N�mero de colunas lidas: %i\n', numColunas);
   %disp(M);
   Var1=numLinhas;
   Var2=numColunas;

   %fprintf('N�mero de emissores: %i\n', numLinhas);
   %fprintf('N�mero de recetores: %i\n', numColunas);
   
catch error
   fprintf('Erro ao ler ficheiro: %s\n',ficheiro);
end
