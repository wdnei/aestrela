%exemplo de mapa 1's significa barreiras ou caminhos invalidos
map=[0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,1,1,1,0,0,0,0;...
    0,0,0,0,0,0,0,0];

[alturaMapa,larguraMapa]=size(map);


mapNodes = containers.Map;
%varre todo o mapa e o transforma em Node
for linhaAtual=1:alturaMapa
    for colunaAtual=1:larguraMapa
        % ignorar quando for um caminho invalido
        if(map(linhaAtual,colunaAtual)==1)
            continue;
        end
        
        valorNodeAtual=[linhaAtual colunaAtual];
        
        NodeAtual=NaN;
        %verifica se Node ja foi criado, caso contrario o cria e adiciona
        %ao dicionario de Nodes
        if(mapNodes.isKey(num2str(valorNodeAtual)))
            NodeAtual=mapNodes(num2str(valorNodeAtual));
        else
            NodeAtual=Node(valorNodeAtual);
            mapNodes(num2str(valorNodeAtual))=NodeAtual;
        end
        
        %busca direcoes que podem ser seguidas do Node
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
        
        
        %diagonal norte leste
        if(linhaAtual-1>0 && colunaAtual+1<=larguraMapa)
            if(map(linhaAtual-1,colunaAtual+1)~=1)
                direcao=[linhaAtual-1 colunaAtual+1];
                direcoes{end+1}=direcao;
            end
        end

        
        %diagonal norte oeste
        if(linhaAtual-1>0 && colunaAtual-1>0 )
            if(map(linhaAtual-1,colunaAtual-1)~=1)
                direcao=[linhaAtual-1 colunaAtual-1];
                direcoes{end+1}=direcao;
            end
        end
        
        % diagonal sul leste
        if(linhaAtual+1<=alturaMapa && colunaAtual-1>0)
            if(map(linhaAtual+1,colunaAtual-1)~=1)
                direcao=[linhaAtual+1 colunaAtual-1];
                direcoes{end+1}=direcao;
            end
        end
        
        %diagonal sul oeste
        if(linhaAtual+1<=alturaMapa && colunaAtual-1>0)
            if(map(linhaAtual+1,colunaAtual-1)~=1)
                direcao=[linhaAtual+1 colunaAtual-1];
                direcoes{end+1}=direcao;
            end
        end
        
        %transforma direcoes em Nodes
        for d=1:length(direcoes)
            
            direcao=direcoes{d};
            disp(direcao);
            if(direcao==NaN)
                continue;
            end
            NodeFilho=NaN;
            if(mapNodes.isKey(num2str(direcao)))
                NodeFilho=mapNodes(num2str(direcao));
            else
                NodeFilho=Node(direcao);
                mapNodes(num2str(direcao))=NodeFilho;
            end
            
            NodeAtual.addFilho(NodeFilho);
            
            %disp(strcat(num2str(NodeAtual.val),'->',num2str(NodeFilho.val)));
        end
    end
end

%disp(mapNodes.values);

%mapNodes.values

ShowNode(mapNodes.values);




