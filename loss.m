function [num,den] = loss()
%******PID 控制器设置******
ts=0.1;%采样时间为 0.1s
sys=tf([1.655,38.16],[1,7.987,-1.054]);%被控对象传递函数模型
dsys=c2d(sys,ts,'tustin');%用双线性逼近法对‘sys’离散化
[num,den]=tfdata(dsys,'v');%获取离散模型 dsys 的分子、分母系