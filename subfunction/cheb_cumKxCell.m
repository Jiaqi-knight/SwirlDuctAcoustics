function [GNk,TGm1,TGm2,TGm3]=cheb_cumKxCell(G_nm,Tgm1,Tgm2,Tgm3,Ratio,lx,lm)
%��ʼ��
%PNk=[];
GNk=[];TGm1=[];TGm2=[];TGm3=[];
for kkk=1:lx
    %PNk{1,kkk}=chebfun(0,[Ratio, 1]);
    GNk{1,kkk}=chebfun(0,[Ratio, 1]);
    TGm1{1,kkk}=chebfun(0,[Ratio, 1]);
    TGm2{1,kkk}=chebfun(0,[Ratio, 1]);
    TGm3{1,kkk}=chebfun(0,[Ratio, 1]);
    
    for kk=1:lm
         %PNk{1,kkk}=PNk{1,kkk}+p_nm{kk,kkk};%��k����
         GNk{1,kkk}=GNk{1,kkk}+G_nm{kk,kkk};%��k����
         TGm1{1,kkk}=TGm1{1,kkk}+Tgm1{kk,kkk};%��k����
         TGm2{1,kkk}=TGm2{1,kkk}+Tgm2{kk,kkk};%��k����
         TGm3{1,kkk}=TGm3{1,kkk}+Tgm3{kk,kkk};%��k����
    end
end
