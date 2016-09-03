matrixMap= [2,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;...
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
            ];


[grafosConvertidos,noInicial,noDestino]=findPathParse(matrixMap);

%ShowGrafo(grafosConvertidos);
%disp(noInicial);
%disp(noDestino);
result=AStarSearch(noInicial,noDestino);

lenResult=length(result);
b=[];
for i=1:lenResult
   disp(result{i}.val);
   direcao=result{i}.val;
   matrixMap(direcao(1),direcao(2))=20;
   
   if(noInicial.val==direcao)
        matrixMap(direcao(1),direcao(2))=100;
   end
   
   if(noDestino.val==direcao)
        matrixMap(direcao(1),direcao(2))=40;
   end
   
   b{end+1}=result{i}.val;
end

matrixMap(matrixMap==0)=50;
matrixMap(matrixMap==1)=0;
image(matrixMap);