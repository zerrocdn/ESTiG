      


[haSolucao] = Passo0(numColunas, numLinhas, M);
      fprintf('Existe solução!!!\n');
         if(haSolucao == true)
                confirmar = input('Deseja seguir para o proximo passo?\n', 's');
                res = upper(confirmar);
                    if (res == 'S')
                        %return; % termina a execu??o do programa (mas n?o a do Matlab)
                  % para sair do Matlab invocar a fun??o 'exit' ou 'quit'
                  
                         [solucao] = Passo1(numLinhas,  numColunas, M);
                         disp(solucao)
                    end
          
                 
          end