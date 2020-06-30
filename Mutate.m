
function chrom = Mutate(chrom,pmutation,gen,MAXGEN )
% 本函数完成变异操作
% pcorss                input  : 变异概率
% lenchrom              input  : 染色体长度
% chrom                 input  : 染色体群
% sizepop               input  : 种群规模
% pop                   input  : 当前种群的进化代数和最大的进化代数信息
% ret                   output : 变异后的染色体
sizepop =  size(chrom,1);
lenchrom = size(chrom,2);
for i=1:sizepop  
    % 随机选择一个染色体进行变异
    pick=rand;
    while pick==0
        pick=rand;
    end
    if pick>pmutation
        continue;
    end
        % 变异位置
        pick=rand;
        while pick==0
            pick=rand;
        end
        pos=ceil(pick*lenchrom);  %随机选择了染色体变异的位置，即选择了第pos个变量进行变异
        v=chrom(i,pos);
        fg = pick*(1-gen/MAXGEN)^2;
        if  pick >= 0.5
            delta= fg *(v-7);
            chrom(i,pos)=ceil(v+delta);
        else
            delta= fg *(1-v);
            chrom(i,pos)=ceil(v+delta);
        end   %变异结束
      
end
