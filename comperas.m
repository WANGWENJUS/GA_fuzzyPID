function  [ted,twsd] =  comperas(Chrom,FitnV,Chroms,Fitnva)
          [px,py] = size(Chrom);
          ted = zeros(px,py);
          twsd = zeros(px,1);
          for i=1:px
              if  FitnV(i) < Fitnva(i)
                  ted(i,:) = Chrom(i,:);
                  twsd(i) = FitnV(i);
              else
                  ted(i,:) = Chroms(i,:);
                  twsd(i) =  Fitnva(i);
              end    
          end
end