function [] = encontraCaminhoMostraResultado(matrixMapa,resultadoNodes )
%encontraCaminhoMostraResultado 
% mostra graficamente o resultado do encontra caminhos
% Amarelo - Inicio
% Verde - Fim
% Azul claro - caminho seguido
% Azul escuro - barreiras

if(~iscell(resultadoNodes))
    disp('Nenhum resultado encontrado');
    return;
end

lenResult=length(resultadoNodes);


for i=1:lenResult
   
   direcao=resultadoNodes{i}.val;
   matrixMapa(direcao(1),direcao(2))=20;
   
   if(i==1)%inicial
        matrixMapa(direcao(1),direcao(2))=40;
   end
   
   if(i==lenResult)%final
        matrixMapa(direcao(1),direcao(2))=100;
   end
   
   %b{end+1}=resultadoNodes{i}.val;
end



matrixMapa(matrixMapa==0)=50;
matrixMapa(matrixMapa==1)=0;
image(matrixMapa);


end

