classdef Grafo < handle
    %GRAFO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        val
        g
        h
        f
    end
    properties (SetAccess = private)
       filhos
       id
    end
    
    methods
        function obj = Grafo(val)
            obj.id=dicomuid;
            obj.val=val;
            obj.g=0;
            obj.f=0;
            obj.h=0;
            obj.filhos={};
        end

        function r=addFilho(obj,grafoFilho)
            % Adiciona filho ao grafo
            % verificar se filho ja existe
            k=obj.exists(grafoFilho);
            if(~isnan(k))
                r=NaN;
                return;
            end
            %adicionar filho
            obj.filhos{end+1}=grafoFilho;
            r=obj;
        end
        
        function grafoRemovido=removeFilho(obj,grafoFilho)
            % remove um filho do grafo
            grafoRemovido=false;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,grafoFilho.id) )
                    grafoRemovido=grafoFilho;
                    obj.filhos(i)=[];
                    return;
                end
            end
        end
        
        
        function grafoEncontrado=exists(obj,grafoFilho)            
            %procura por grafo filho, caso encontre este eh retorna, caso
            %contrario retorna NaN
            grafoEncontrado=NaN;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,grafoFilho.id) )
                    grafoEncontrado=grafoFilho;
                    return;
                end
            end
        end
        
        
        function indexGrafoFilho=find(obj,grafoFilho)
            % procura por filho, caso encontre eh retorna seu index, caso
            % contrario retorna -1
            indexGrafoFilho=-1;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,grafoFilho.id) )
                    indexGrafoFilho=i;
                    return;
                end
            end
        end
    end
end

