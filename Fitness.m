function FitnV = Fitness(num,den,a)
ts = 0.1;
u_1=0.0; u_2=0.0; %控制量的初始状态
y_1=0;   y_2=0; %输出的初始状态
x=[0,0,0]';%PID3 个参数增量组成的数组
error_1=0;%初始误差
e_1=0.0;ec_1=0.0;%误差和误差变化量得初值
kp0=0.5;kd0=1.0;ki0=0.01;%PID3 个参数的初值
for k=1:1:300 %仿真时间
time(k)=k*ts;
if  k<=50
    rin(k)=0;%输入的阶跃信号
else
    rin(k)=1 ;
end                       % 指令为阶跃信号
%用模糊控制器得到的参数设置 PID 参数
k_pid=evalfis([e_1,ec_1],a);%执行模糊推理，得到输出 PID 参数
kp(k)=kp0+k_pid(1);
ki(k)=ki0+k_pid(2);
kd(k)=kd0+k_pid(3);
u(k)=kp(k)*x(1)+kd(k)*x(2)+ki(k)*x(3);%PID 控制器
yout(k)=-den(2)*y_1-den(3)*y_2+num(1)*u(k)+num(2)*u_1+num(3)*u_2;
error(k)=rin(k)-yout(k);%误差 e
ss(k) = abs(rin(k)-yout(k));
%*********返回 PID 参数**********
u_2=u_1;
u_1=u(k);
y_2=y_1;
y_1=yout(k);
x(1)=error(k);%计算 P
x(2)=error(k)-error_1;%计算 D
x(3)=x(3)+error(k);%计算 I
e_1= x(1);
ec_1=x(2);

error_2=error_1;
error_1=error(k);
end
FitnV = sum(ss);