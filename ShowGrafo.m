function [matrixRelacoes] = ShowGrafo(grafos )
%SHOWGRAFO Summary of this function goes here
%   Funcao criada para mostra graficamente aninhamento de grafos


    len=length(grafos);
    %mapear grafos para numeros inteiros
    mapObj = containers.Map;
    labels={};
    for i = 1:len
        mapObj(grafos{i}.id)=i;
        labels{end+1}=evalc('disp(grafos{i}.val)');
    end
    
    relacoes=[];
    relacoes(len,len)=0;
    
    %mapear todas as relacoes dos grafos
    for indexGrafo = 1:len
        grafo=grafos{indexGrafo};
        filhos=grafo.filhos;
        
        lenFilhos=length(filhos);
        for i = 1:lenFilhos
            filho=filhos{i};
            
            indexFilho=mapObj(filho.id);            
            relacoes(indexGrafo,indexFilho)=1;
            %relacoes(indexFilho,indexGrafo)=1;
        end
    end
    
    h = view(biograph(relacoes,labels));

    
    disp(relacoes);
    matrixRelacoes=relacoes;
    

end

