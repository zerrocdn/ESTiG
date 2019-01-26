prompt = input('Existe algum emissor offline?\n', 's');
answer = upper(prompt);
offline = 0;
if answer == 'S'
    offline = input('Indique um valor de 1 a 6: ');
    [haSolucao] = Passo0(numColunas, numLinhas, M, offline);
      
         if(haSolucao == true)
                confirmar = input('Deseja seguir para o proximo passo?\n', 's');
                res = upper(confirmar);
                    if (res == 'S')
                        %return; % termina a execu??o do programa (mas n?o a do Matlab)
                  % para sair do Matlab invocar a fun??o 'exit' ou 'quit'
                         [solucao] = Passo1(numLinhas,  numColunas, M, offline);
                         disp(solucao)
                    end
          
                 
          end
end      


% [haSolucao] = Passo0(numColunas, numLinhas, M, offline);
%       
%          if(haSolucao == true)
%                 confirmar = input('Deseja seguir para o proximo passo?\n', 's');
%                 res = upper(confirmar);
%                     if (res == 'S')
%                         %return; % termina a execu??o do programa (mas n?o a do Matlab)
%                   % para sair do Matlab invocar a fun??o 'exit' ou 'quit'
%                   
%                          [solucao] = Passo1(numLinhas,  numColunas, M);
%                          disp(solucao)
%                     end
%           
%                  
%           end