
function FitnV = Biaoding(FitnV,rr,gen)
FitnV = 1./( 1+ FitnV);
 ss = min(FitnV);
 rr = rr * 0.95^gen;
FitnV = (FitnV - ss + rr)*100;
end
% function FitnV = Biaoding1(FitnV,~,~)
% FitnV = 1./( 1+ 0.1 * FitnV)*1000;
% end

