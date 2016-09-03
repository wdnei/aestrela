function path = AStarSearch( nodeInicial, nodeDestino )
%ASTARSEARCH Algoritmo de busca A* no qual usa a class Grafo para realizar
% a funcao recebe o node inicial e o node final
heuristic_cost_estimate=@(x,y) sum(abs(x-y));%manhattan distance
dist_between=@(x,y) sum(abs(x-y));
% conjunto de node ja avaliados
fechadoSet=containers.Map;

% conjunto de node que poderao ser avaliados
abertoSet=containers.Map;
abertoSet(nodeInicial.id)=nodeInicial;

% Para cada node, salva o node pai ou anterior mais eficiente.
nodePaiSet = containers.Map;

	% O custo do node inicial ao node proposto.
    gScore=containers.Map;%intmax('int32');% map with default value of Infinity
    % O custo de ir do node inicial a ele proprio eh zero.
    gScore(nodeInicial.id)=0; 
    % O custo heuristico do node inicial ate o node destino
    % o custo heuristico de cada node ate o node destino.
    fScore=containers.Map;% map with default value of Infinity
    % O valor heuristico do node inicial.
    fScore(nodeInicial.id)= heuristic_cost_estimate(nodeInicial.val, nodeDestino.val);

    while length(abertoSet.keys)>0% is not empty
        % procura um node  no conjunto de nodes abertos com o menor fscore ou custo
        tamanhoAbertoSet=length(abertoSet.values);
        
        abertoSetValues=abertoSet.values;
        nodeAtual=abertoSetValues{1};
        menorFScore=fScore(nodeAtual.id);
        for indexAbertoSet=2:tamanhoAbertoSet            
            if(fScore(abertoSetValues{indexAbertoSet}.id)<menorFScore)
                nodeAtual=abertoSetValues{indexAbertoSet};
                menorFScore=fScore(nodeAtual.id);
            end        
        end
        
        if strcmp(nodeAtual.id,nodeDestino.id)
            path=reconstruir_caminho(nodePaiSet, nodeAtual);
            return;
        end
        
        abertoSet.remove(nodeAtual.id);
        fechadoSet(nodeAtual.id)=nodeAtual;
        tamanhoVizinhos=length(nodeAtual.filhos);
        for indexVizinhos=1:tamanhoVizinhos
            vizinhoAtual=nodeAtual.filhos{indexVizinhos};
            % Ignorar caso o vizinho atual ja tenha sido avaliado ou fechado.
			if fechadoSet.isKey(vizinhoAtual.id)
                continue;		
            end
            
			% A distancia do node inicial ate o node vizinhoAtual
            tentative_gScore = gScore(nodeAtual.id) + dist_between(nodeAtual.val, vizinhoAtual.val);
            
			%adicionar node vizinhoAtual a lista de node abertos ou descobertos
			if ~abertoSet.isKey(vizinhoAtual.id)
                abertoSet(vizinhoAtual.id)=vizinhoAtual;
            elseif tentative_gScore >= gScore(vizinhoAtual.id)%ignora o caminho ruim
                continue;
            end

            % salva o node do melhor caminho ate agora
            nodePaiSet(vizinhoAtual.id)=nodeAtual;
            gScore(vizinhoAtual.id)=tentative_gScore;
            fScore(vizinhoAtual.id)= gScore(vizinhoAtual.id) + heuristic_cost_estimate(vizinhoAtual.val, nodeDestino.val);
        end
    end
    path=false;
    return;
    



end

% reconstroi o melhor caminho encontrado pelo algoritmo
function total_path = reconstruir_caminho(nodePaiSet, nodeAtual)
    total_path={};
    total_path{1}=nodeAtual;
    while nodePaiSet.isKey(nodeAtual.id)
        nodeAtual= nodePaiSet(nodeAtual.id);
        total_path{end+1}=nodeAtual;
    end
end
