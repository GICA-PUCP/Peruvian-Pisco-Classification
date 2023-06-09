function Vde_a = aumento_datos_GS(Vde,sigma,alfa,np,na)
%np número de puntos para generar datos
%na número de datos generados por cada punto
%sigma: deviación estándar
%alfa: factor de estiramiento

Vde_a=[];
tam=size(Vde);
d=[];

for aj = 1:(np/2),
    Rn1 = fix(rand(1)*tam(1))+1;
    for ai = 1:na,
        epsilon=randn(1,tam(2))*sigma;
        Vde_temp(ai,:) = Vde(Rn1,:) + epsilon;

        m = fix(tam(2)/(1+alfa));
        intervalo = (m-1)/(tam(2)-1);
        V1 = Vde(Rn1,1:m);
        Vde_tempS(ai,:) = interp1(1:m,V1,1:intervalo:m);
    end;
    Vde_a = [Vde_a ; Vde_temp ; Vde_tempS];
end;
Vde_a= [Vde ; Vde_a];

