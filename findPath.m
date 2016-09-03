%exemplo de mapa 1's significa barreiras ou caminhos invalidos
map=[0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,0,0,0,0,0,0,0];

[alturaMapa,larguraMapa]=size(map);


mapGrafos = containers.Map;
%varre todo o mapa e o transforma em grafo
for linhaAtual=1:alturaMapa
    for colunaAtual=1:larguraMapa
        % ignorar quando for um caminho invalido
        if(map(linhaAtual,colunaAtual)==1)
            continue;
        end
        
        valorGrafoAtual=[linhaAtual colunaAtual];
        
        grafoAtual=NaN;
        %verifica se grafo ja foi criado, caso contrario o cria e adiciona
        %ao dicionario de grafos
        if(mapGrafos.isKey(num2str(valorGrafoAtual)))
            grafoAtual=mapGrafos(num2str(valorGrafoAtual));
        else
            grafoAtual=Grafo(valorGrafoAtual);
            mapGrafos(num2str(valorGrafoAtual))=grafoAtual;
        end
        
        %busca direcoes que podem ser seguidas do grafo
        direcoes={};
        
        %norte
        if(linhaAtual-1>0)
            if(map(linhaAtual-1,colunaAtual)~=1)
                norte=[linhaAtual-1 colunaAtual];
                direcoes{end+1}=norte;
            end
        end
        %sul
        if(linhaAtual+1<=alturaMapa)
            if(map(linhaAtual+1,colunaAtual)~=1)
                sul=[linhaAtual+1 colunaAtual];
                direcoes{end+1}=sul;
            end
        end
        %oeste
        if(colunaAtual-1>0)
            if(map(linhaAtual,colunaAtual-1)~=1)
                oeste=[linhaAtual colunaAtual-1];
                direcoes{end+1}=oeste;
            end
        end
        
        %leste
        if(colunaAtual+1<=larguraMapa)
            if(map(linhaAtual,colunaAtual+1)~=1)
                leste=[linhaAtual colunaAtual+1];
                direcoes{end+1}=leste;
            end
        end
        %transforma direcoes em grafos
        for d=1:length(direcoes)
            
            direcao=direcoes{d};
            disp(direcao);
            if(direcao==NaN)
                continue;
            end
            grafoFilho=NaN;
            if(mapGrafos.isKey(num2str(direcao)))
                grafoFilho=mapGrafos(num2str(direcao));
            else
                grafoFilho=Grafo(direcao);
                mapGrafos(num2str(direcao))=grafoFilho;
            end
            
            grafoAtual.addFilho(grafoFilho);
            
            %disp(strcat(num2str(grafoAtual.val),'->',num2str(grafoFilho.val)));
        end
    end
end

%disp(mapGrafos.values);

%mapGrafos.values

ShowGrafo(mapGrafos.values);




