classdef Node < handle
    %Node Summary of this class goes here
    %   Implementa uma classe para criacao de Grafos
    
    properties
        val
        label
    end
    properties (SetAccess = private)
       filhos
       id
    end
    
    methods
        function obj = Node(val,label)
            obj.id=dicomuid;
            obj.val=val;
            if nargin<2
                obj.label = val;
            end
            
            obj.filhos={};
        end

        function r=addFilho(obj,NodeFilho)
            % Adiciona filho ao Node
            % verificar se filho ja existe
            k=obj.exists(NodeFilho);
            if(k==NaN)
                r=NaN;
                return;
            end
            %adicionar filho
            obj.filhos{end+1}=NodeFilho;
            r=obj;
        end
        
        function NodeRemovido=removeFilho(obj,NodeFilho)
            % remove um filho do Node
            NodeRemovido=false;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,NodeFilho.id) )
                    NodeRemovido=NodeFilho;
                    obj.filhos(i)=[];
                    return;
                end
            end
        end
        
        
        function NodeEncontrado=exists(obj,NodeFilho)            
            %procura por Node filho, caso encontre este eh retorna, caso
            %contrario retorna NaN
            NodeEncontrado=NaN;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,NodeFilho.id) )
                    NodeEncontrado=NodeFilho;
                    return;
                end
            end
        end
        
        
        function indexNodeFilho=find(obj,NodeFilho)
            % procura por filho, caso encontre eh retorna seu index, caso
            % contrario retorna -1
            indexNodeFilho=-1;
            len=length(obj.filhos);
            for i=1:len
                if(strcmp(obj.filhos{i}.id,NodeFilho.id) )
                    indexNodeFilho=i;
                    return;
                end
            end
        end
    end
end

