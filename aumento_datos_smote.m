function Vde_a = aumento_datos_smote(Vde,k,np,na)
%np número de puntos para generar datos
%na número de datos generados por cada punto
%k número de vecinos cercanos para generar los datos sintéticos

Vde_a=[];
tam=size(Vde);
d=[];

for aj = 1:np,
    Rn1 = fix(rand(1)*tam(1))+1;
    for m = 1:tam(1),
        diferencia = (Vde(Rn1,:)-Vde(m,:));
        d(m)=sqrt(diferencia*diferencia');
    end;
    [temp,dI]=sort(d);

    for ai = 1:na,
        alfa=rand(1);
        M = fix(rand(1)*k)+2;
        Vde_temp(ai,:) = Vde(Rn1,:) + alfa*(Vde(dI(M),:)-Vde(Rn1,:))
    end;
    Vde_a = [Vde_a ; Vde_temp];
end;
Vde_a= [Vde ; Vde_a];

