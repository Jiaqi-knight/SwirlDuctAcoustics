function pltPlot_greenswirl(w,r,m,GGw,TTm1,TTm2,TTm3,rou0_3D,P0_3D,s0_3D,Mx_3D,M_theta_3D,Tr,Omag,save_directory,Boundary,Type,x_pole)
T1=8*pi/w;
t=linspace(0,T1,50);

for solutime=1:length(t)
%% 生成网格矩阵
    [theta,rho,z]=meshgrid(linspace(0,2*pi,180),r',x_pole); %生成极坐标网格
    [y,x,z]=pol2cart(theta,rho,z); %将极坐标网格转化为直角坐标网格
    
% 导入数据，对网格赋值

 %%
     tsignal.cubes(solutime).zonename='mysurface zone';
     tsignal.cubes(solutime).x=x;    %size 3x3 
     tsignal.cubes(solutime).y=y;    %size 3x3
     tsignal.cubes(solutime).z=z;    %size 3x3
     tsignal.cubes(solutime).v(1,:,:,:)=real(GGw*exp(-sqrt(-1)*w*t(solutime)));%可以为三维输入，p只有一维
     tsignal.cubes(solutime).v(2,:,:,:)=real(TTm1*exp(-sqrt(-1)*w*t(solutime)));%0度
     tsignal.cubes(solutime).v(3,:,:,:)=real(TTm2*exp(-sqrt(-1)*w*t(solutime)));%45度
     tsignal.cubes(solutime).v(4,:,:,:)=real(TTm3*exp(-sqrt(-1)*w*t(solutime)));%90度
     tsignal.cubes(solutime).v(5,:,:,:)=rou0_3D;%平均流密度
     tsignal.cubes(solutime).v(6,:,:,:)=P0_3D;%平均流压力
     tsignal.cubes(solutime).v(7,:,:,:)=s0_3D;%平均流熵值
     tsignal.cubes(solutime).v(8,:,:,:)=Mx_3D;%平均流轴向速度
     tsignal.cubes(solutime).v(9,:,:,:)=M_theta_3D;%平均周向速度
     %tsignal.cubes(solutime).v(10,:,:,:)=Mr_3D;%平均流径向速度
     tsignal.cubes(solutime).solutiontime=solutime;
end
 %% 整合数据，生成文件
%title=''; 
NAME = [date,'GreenSwirl',char(Type(Boundary)),'-Tr=',num2str(Tr),'-Omag=',num2str(Omag),'-',num2str(x_pole(1)),'-',num2str(x_pole(end))];  %存储文件夹   
NAME1 = ['GreenSwirl-Gw-0','-',date];  %存储文件夹   
NAME2 = ['GreenSwirl-Tm-0','-',date];  %存储文件夹   
NAME3 = ['GreenSwirl-Tm-45','-',date];  %存储文件夹   
NAME4 = ['GreenSwirl-Tm-90','-',date];  %存储文件夹   
NAME5 = ['GreenSwirl-rou0','-',date];  %存储文件夹   
NAME6 = ['GreenSwirl-P0_3D','-',date];  %存储文件夹   
NAME7 = ['GreenSwirl-s0_3D','-',date];  %存储文件夹   
NAME8 = ['GreenSwirl-Mx_3D','-',date];  %存储文件夹   
NAME9 = ['GreenSwirl-M_theta_3D','-',date];  %存储文件夹   
%NAME10 = ['GreenSwirl-Mr_3D','-',date];  %存储文件夹   


output_file_name=[save_directory,'\',NAME,'.plt']; 
tsignal.Nvar=12;     
tsignal.varnames={'x','y','z',NAME1,NAME2,NAME3,NAME4,NAME5,NAME6,NAME7,NAME8,NAME9};
mat2tecplot(tsignal,output_file_name);

end
 
 
