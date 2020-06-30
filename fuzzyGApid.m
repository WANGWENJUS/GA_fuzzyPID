function fuzzyGApid()
clc;
clear
[num,den] = loss();
save num num
save den den
loadfit();
%% 遗传参数
NIND=100;       %种群大小
MAXGEN=50;      %最大遗传代数
Pc=0.9;         %交叉概率
Pm=0.1;        %变异概率
rr = 0.1;
Chrom=InitPop(NIND,7);
gen = 1;    temx = zeros(MAXGEN,1);
temp = zeros(MAXGEN,1);
while gen<=MAXGEN  
    disp(gen) 
    FitnV = solvecode(num,den,Chrom);
    %%  逆转
    Chroms = Reverse(Chrom);
    Fitnva =  solvecode(num,den,Chroms);
   [Chrom,FitnV] =  comperas(Chrom,FitnV,Chroms,Fitnva);
    %% 求种群个体中最优适值
    [bestindividual,bestfit] = best(Chrom, FitnV ); 
    temp(gen,:)= bestfit;
    ssx(gen,:) = bestindividual;
    save ppp1 temp
    save ppp3 ssx
    temx(gen) = max( FitnV );
    save ppp2 temx
    disp(temx(gen,:))
    disp(bestfit)
     %% 标定
     FitnV = Biaoding(FitnV,rr,gen);
     %% 选择
%    SelCh = select('rws',Chrom,FitnV);
     SelCh = Select(Chrom,FitnV);
     %% 交叉操作c
%    SelCh=recombin('recdis',SelCh,Pc);
     SelCh=Recombin(SelCh,Pc,gen,MAXGEN);
     %%  变异
%    SelCh = mut(SelCh,Pm,BaseV);
     SelCh=Mutate(SelCh,Pm,gen,MAXGEN);
  
    %% 更新迭代次数
    gen=gen+1 ;
    Chrom = SelCh;
end


          








