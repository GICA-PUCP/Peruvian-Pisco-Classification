function R=aplanar(M)

[T1,T2,T3]=size(M);

R=[];
for i=1:T1,
    for j=1:T2,
        for k=1:T3,
            R=[R  M(i,j,k)];
        end;
    end;
end;
