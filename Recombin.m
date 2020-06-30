
function SelCh=Recombin(SelCh,Pc,gen,MAXGEN)
Pcc = Pc - (gen^4*0.3)/(MAXGEN^4); 
NSel=size(SelCh,1);
ss= randperm(NSel/10*9)'+ NSel/10;
for i=1:2:NSel/10*9
    aa = ss(i);bb = ss(i+1);
    alfa = rand;
    if  Pcc>=alfa      %交叉概率Pc
            a =round(alfa*SelCh(bb,:)+(1-alfa)*SelCh(aa,:));  
            b =round(alfa*SelCh(aa,:)+(1-alfa)*SelCh(bb,:));
            SelCh(aa,:) = a;
            SelCh(bb,:) = b;
    end
end
end





function SelCh=Recombin1(SelCh,Pc,gen,FitnV)
Pcc = Pc - (gen^4*0.3)/(60^4); 
NSel=size(SelCh,1)/2;
% fmin = max(FitnV);fmax = min(FitnV);
% ff = (fmax-fmin)/4;
for i=1:NSel
    alfa = rand;
    if  Pcc>=alfa      %交叉概率Pc
          SelCh(i,:)=round(alfa*SelCh(i+NSel,:)+(1-alfa)*SelCh(i,:));  
          SelCh(i+NSel,:)=round(alfa*SelCh(i,:)+(1-alfa)*SelCh(i+NSel,:));
%           fg  = FitnV(i) - FitnV(i+NSel);
%           if fg <= ff
%            [SelCh(i,:),SelCh(i+NSel,:)]=intercross(SelCh(i,:),SelCh(i+NSel,:));
%          else
%            [SelCh(i,:),SelCh(i+NSel,:)]=intercross1(SelCh(i,:),SelCh(i+NSel,:));
%           end   
    end
end
end
        

function [a,b]=intercross(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]);
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;b0=b;
    s=min([r1,r2]);
    e=max([r1,r2]);
    for i=s:e
        a(i)=b0(i);
        b(i)=a0(i);
    end
end
end
function [a,b]=intercross1(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]);
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;b0=b;
    a(r1)=b0(r1);
    b(r2)=a0(r2);
end
end


function [a,b]=intercross2(a,b)
L=length(a);
r1=randsrc(1,1,[1:L]);
r2=randsrc(1,1,[1:L]);
if r1~=r2
    a0=a;b0=b;
    s=min([r1,r2]);
    e=max([r1,r2]);
    srr = [s,e];
    for t=1:2
        i = srr(t);
        a1=a;b1=b;
        a(i)=b0(i);
        b(i)=a0(i);
        x=find(a==a(i));
        y=find(b==b(i));
        i1=x(x~=i);
        i2=y(y~=i);
        if ~isempty(i1)
            a(i1)=a1(i);
        end
        if ~isempty(i2)
            b(i2)=b1(i);
        end
    end
end
end


