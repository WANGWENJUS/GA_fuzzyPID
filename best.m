function [bestindividual,bestfit] = best(pop,fitvalue )
[px,py] = size(pop);
bestindividual = pop(1,:);
bestfit = fitvalue(1);     
for i = 2:px
    if fitvalue(i)< bestfit
        bestindividual = pop(i,:);
        bestfit = fitvalue(i);
    end
end