function loadfit()
a=newfis('fuzpid');%创建新的 FIS
%*******设定 e 的范围、隶属度********
a=addvar(a,'input','e',[-3 3]);    %向模糊推理系统（FIS）添加语言变量 e
%********向模糊推理系统（FIS）的语言变量 e 添加隶属度函数****
a=addmf(a,'input',1,'NB','zmf',[-3 -1]); %z 形隶属度函数
a=addmf(a,'input',1,'NM','trimf',[-3 -2 0]);%三角形隶属度函数
a=addmf(a,'input',1,'Ns','trimf',[-3 -1 1]);%三角形隶属度函数
a=addmf(a,'input',1,'Z','trimf',[-2 0 2]);%三角形隶属度函数
a=addmf(a,'input',1,'PS','trimf',[-1 1 3]);%三角形隶属度函数
a=addmf(a,'input',1,'PM','trimf',[0 2 3]);%三角形隶属度函数
a=addmf(a,'input',1,'PB','smf',[1 3]);%s 状隶属度函数
%*******设定 ec 的范围、隶属度********
a=addvar(a,'input','ec',[-3 3]);%向模糊推理系统（FIS）添加语言变量 ec
%********向模糊推理系统（FIS）的语言变量 ec 添加隶属度函数
a=addmf(a,'input',2,'NB','zmf',[-3 -1]);%z 形隶属度函数
a=addmf(a,'input',2,'NM','trimf',[-3 -2 0]);%三角形隶属度函数
a=addmf(a,'input',2,'Ns','trimf',[-3 -1 1]);%三角形隶属度函数
a=addmf(a,'input',2,'Z','trimf',[-2 0 2]);%三角形隶属度函数
a=addmf(a,'input',2,'PS','trimf',[-1 1 3]);%三角形隶属度函数
a=addmf(a,'input',2,'PM','trimf',[0 2 3]);%三角形隶属度函数
a=addmf(a,'input',2,'PB','smf',[1 3]);%s 状隶属度函数
%*******设定 Kp 的范围、隶属度********
a=addvar(a,'output','Kp',[-0.4 0.4]);%向模糊推理系统（FIS）添加语言变量 Kp
%********向模糊推理系统（FIS）的语言变量 Kp 添加隶属度函数***
a=addmf(a,'output',1,'NB','zmf',[-0.4 -0.1]);%z 形隶属度函数
a=addmf(a,'output',1,'NM','trimf',[-0.4 -0.2 0]);%三角形隶属度函数
a=addmf(a,'output',1,'Ns','trimf',[-0.4 -0.1 0.1]);%三角形隶属度函数
a=addmf(a,'output',1,'Z','trimf',[-0.2 0 0.2]);%三角形隶属度函数
a=addmf(a,'output',1,'PS','trimf',[-0.1 0.1 0.4]);%三角形隶属度函数
a=addmf(a,'output',1,'PM','trimf',[0 0.2 0.4]);%三角形隶属度函数
a=addmf(a,'output',1,'PB','smf',[0.1 0.4]);%s 状隶属度函数
%*******设定 Ki 的范围、隶属度********
a=addvar(a,'output','Ki',[-0.06 0.06]);%向模糊推理系统（FIS）添加语言变量 Ki
%********向模糊推理系统（FIS）的语言变量 Kp 添加隶属度函数****
a=addmf(a,'output',2,'NB','zmf',[-0.05 -0.02]);%z 形隶属度函数
a=addmf(a,'output',2,'NM','trimf',[-0.05 -0.04 0]);%三角形隶属度函数
a=addmf(a,'output',2,'Ns','trimf',[-0.05 -0.02 0.02]);%三角形隶属度函数
a=addmf(a,'output',2,'Z','trimf',[-0.05 0 0.04]);%三角形隶属度函数
a=addmf(a,'output',2,'PS','trimf',[-0.05 0.02 0.05]);%三角形隶属度函数
a=addmf(a,'output',2,'PM','trimf',[0 0.04 0.05]);%三角形隶属度函数
a=addmf(a,'output',2,'PB','smf',[0.02 0.05]);%s 状隶属度函数
%*******设定 Kd 的范围、隶属度********
a=addvar(a,'output','Kd',[-3 3]);%向模糊推理系统（FIS）添加语言变量 Kd
%********向模糊推理系统（FIS）的语言变量 Kd 添加隶属度函数***
a=addmf(a,'output',3,'NB','zmf',[-3 -1]);%z 形隶属度函数
a=addmf(a,'output',3,'NM','trimf',[-3 -2 0]);%三角形隶属度函数
a=addmf(a,'output',3,'Ns','trimf',[-3 -1 1]);%三角形隶属度函数
a=addmf(a,'output',3,'Z','trimf',[-2 0 2]);%三角形隶属度函数
a=addmf(a,'output',3,'PS','trimf',[-1 1 3]);%三角形隶属度函数
a=addmf(a,'output',3,'PM','trimf',[0 2 3]);%三角形隶属度函数
a=addmf(a,'output',3,'PB','smf',[1 3]);%s 状隶属度函数
a=setfis(a,'DefuzzMethod','centroid');%设置模糊系统的属性,清晰化方法采用重心法
writefis(a,'fuzpid');%保存 FIS 到磁盘上