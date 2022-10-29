tth = load('tth.mat');
tth = tth.tt;
psith = load('psith.mat');
psith = psith.psit;
tol = 0.0001;
for i=1:10000
    for j=1:399001
        if(abs(tt(i)-tth(j))/tth(j)<tol)
            psit1(1:399,i) = psith(1:399,j);
            break;
        elseif j==399001
            tol=0.001;
             for k=1:399001
                 if(abs(tt(i)-tth(k))/tth(k)<tol)
                   psit1(1:399,i) = psith(1:399,k);
                    break;
                 end
             end
             tol = 0.01;
        end
    end
end
for i=1:10000
    err1(i) = abs((sum(psit(1:399,i)-psit1(1:399,i)))/sum(psit(1:399,i)));
end
         