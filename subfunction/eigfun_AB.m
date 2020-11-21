function [finteVf,finiteLam]=eigfun_AB(r,D,N,w,m,Ratio,Mx,M_theta,rou0,P0,c02,Boundary,z_t,z_h)
%输入参数：
%r ： 管道半径
%D ： differentiation matrix
%N ： point of Chebyshev grid
%w ： 频率
%m ： 周向模态
%Ratio ：管径比
%Mx ：流场速度
%M_theta ：周向速度
%rou0 ：管道均匀流密度
%P0 ：管道均匀流压力
%c02 ：管道均匀流速度
%Boundary ：边界条件
%z_t ：软壁面参数选择
%z_h ：软壁面参数选择
%输出：
%finteVf ： 特征函数
%finiteLam ：特征值




%线性欧拉方程求解
%边界条件
%该工作还未发表
%不影响代码的使用和参数调节
%为保护知识产权，进行了p处理
%待发表后予以公开
%请谅解~
%若需要，请联系
%Jiaqi_Wang@sjtu.edu.cn
