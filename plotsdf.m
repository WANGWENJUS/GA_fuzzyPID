function plotsdf() 
load data3
load num
load den
loadfit();
m = size(ssx,1);
ant = zeros(m,1);
anx = zeros(m,1);
for i=1:m
  anx(i) = i;
  datas = ssx(i,:);
  aa = adrule(reshape(datas,49,3));
  ant(i) = Fitness(num,den,aa);
end
plot(anx,ant);
xlabel('种群迭代次数');ylabel('ITAE性能指标');
set(gcf,'color',get(gca,'color'))




end