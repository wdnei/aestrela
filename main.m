altura=input('digite a altura do mapa: ');
largura=input('digite a largura do mapa: ');


mapa=zeros(altura,largura);

barreira=input('digite uma posição inválida ou barreira do mapa(ex. 1,2- linha,coluna) ou "f" para sair: ','s');

while(barreira~='f')
    posicao=str2num(barreira);
    if(isempty(posicao))
        disp('posição inválida...');
    else
        posicaoX=posicao(1);
        posicaoY=posicao(2);
        
        mapa(posicaoY,posicaoX)=1;
        
    end    
    barreira=input('digite uma posição inválida ou barreira do mapa(ex. 1,2- linha,coluna) ou "f" para sair: ','s');
    

end

%escolher posição inicial
posicaoValida=false;
posicaoInicial=input('digite a posição INICIAL do individuo no mapa(ex. 1,2 - linha,coluna):','s');
while(~posicaoValida)
    posicao=str2num(posicaoInicial);
    if(isempty(posicao))
        disp('posição inválida...');
        posicaoInicial=input('digite a posição INICIAL do individuo no mapa(ex. 1,2 - linha,coluna):','s');
    else
        posicaoValida=true;
        posicaoX=posicao(1);
        posicaoY=posicao(2);        
        mapa(posicaoY,posicaoX)=2;%marcar a posicao inicial        
    end    
end

%escolher posição final
posicaoValida=false;
posicaoFinal=input('digite a posição FINAL do individuo no mapa(ex. 1,2 - linha,coluna):','s');
while(~posicaoValida)
    posicao=str2num(posicaoFinal);
    if(isempty(posicao))
        disp('posição inválida...');
        posicaoFinal=input('digite a posição FINAL do individuo no mapa(ex. 1,2 - linha,coluna):','s');
    else
        posicaoValida=true;
        posicaoX=posicao(1);
        posicaoY=posicao(2);        
        mapa(posicaoY,posicaoX)=3;%marcar a posicao inicial        
    end    
end
disp('busca de melhor caminho iniciada...');
matrixMap=mapa;

%transforma a matrix em Nodes ou Grafo
[grafosConvertidos,noInicial,noDestino]=encontraCaminhoParse(matrixMap);
disp('mapa convertido em grafos');
%mostra o grafo gerado
%ShowGrafo(grafosConvertidos);
%return;
%busca melhor caminho usando A*
%retorna os caminhos ou node a serem seguidos
disp('A* iniciado...');
result=Busca.AStarSearch1(noInicial,noDestino);
disp('A* finalizado...');
%mostra o resultado em forma de imagem
encontraCaminhoMostraResultado(matrixMap,result);