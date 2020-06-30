function  ant = solvecode(num,den,Chrom)
          [m,n] = size(Chrom);
          ant = zeros(m,1);
          for i=1:m
              datas = Chrom(i,:);
              ans = reshape(datas,49,3);
              aa = adrule(ans);
              ant(i) = Fitness(num,den,aa);
          end