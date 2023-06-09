%Análisis de datos del proyecto Piscos
%Se clasifica por variedad de pisco Italia y Quebranta
%Se utilizan todos los datos.
%Se utilizan 3 sensores.
%Tercera estructura: todos los datos de 3 sensores y 6 clases a la salida
%Se convierten los voltajes a resistencia.
%Se realiza el aumento de datos
%Se considera los datos de prueba seleccionados de manera fija

close all
clear all

%Cargado de datos
datos_ene  %Cargado en M1, M2, M3, M4, M5 y M6
num_clases = 6;
a=480; %Cantidad de valores por muestra
tam=80; %cantidad de valores por muestra sin la purga


%Se separan los datos por muestra, numero de sensor y valores sin purga.
%V1 de la clase (Tabernero Quebranta)
    %Contiene todos los valores de los sensores sin la purga, separados por
    %número de muestra y número de sensor.
    %La 1ra dimensión corresponde al número de muestra. 
    %La 2da dimensión corresponde al número de sensor.
    %La 3ra dimensión contiene los datos de subida (sin purga).
%V2: Dem Andes Quebranta) 
%V3 (Queirolo Quebranta)
%V4 (Queirolo Italia)
%V5 (Tabernero Italia)
%V6 (Dem Andes Italia)
N=0;
[t1,t2]=size(M1);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M1(I:(I+tam-1),K);
        V1(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X1(N,K)=I;                      %Instante del valor inicial de M1
        F1(N,K)=I+tam-1;                      %Instante del valor final de M1
    end;
end;
N=0;
[t1,t2]=size(M2);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M2(I:(I+tam-1),K);
        V2(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X2(N,K)=I;                      %Instante del valor inicial de M2
        F2(N,K)=I+tam-1;                      %Instante del valor final de M2
    end;
end;
N=0;
[t1,t2]=size(M3);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M3(I:(I+tam-1),K);
        V3(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X3(N,K)=I;                      %Instante del valor inicial de M3
        F3(N,K)=I+tam-1;                      %Instante del valor final de M3
    end;
end;
N=0;
[t1,t2]=size(M4);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M4(I:(I+tam-1),K);
        V4(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X4(N,K)=I;                      %Instante del valor inicial de M4
        F4(N,K)=I+tam-1;                      %Instante del valor final de M4
    end;
end;
N=0;
[t1,t2]=size(M5);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M5(I:(I+tam-1),K);
        V5(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X5(N,K)=I;                      %Instante del valor inicial de M5
        F5(N,K)=I+tam-1;                      %Instante del valor final de M5
    end;
end;
N=0;
[t1,t2]=size(M6);
for I=1:a:t1,
    N=N+1;
    for K=1:t2
        Vtemp=M6(I:(I+tam-1),K);
        V6(N,K,:)=Vtemp;             %Todos los valores de un sensor sin la purga
        X6(N,K)=I;                      %Instante del valor inicial de M6
        F6(N,K)=I+tam-1;                      %Instante del valor final de M6
    end;
end;

%Se muestran los datos de los 12 sensores de las clases del M1 al M6 .
[t1,t2]=size(M1);
for K=1:t2,
    figure(K)
    plot(M1(:,K),'r');
    hold on
    plot(M2(:,K),'g');
    plot(M3(:,K),'b');
    plot(M4(:,K),'r:');
    plot(M5(:,K),'g:');
    plot(M6(:,K),'b:');
%     plot(M(:,1)/100,'r');
%     plot(M3(:,1)/100,'g');
%     plot(M2(:,1)/100,'b');
    plot(X1(:,K),V1(:,K,1),'r*');
    plot(X2(:,K),V2(:,K,1),'g*');
    plot(X3(:,K),V3(:,K,1),'b*');
    plot(X4(:,K),V4(:,K,1),'r*');
    plot(X5(:,K),V5(:,K,1),'g*');
    plot(X6(:,K),V6(:,K,1),'b*');
    plot(F1(:,K),V1(:,K,tam),'ro');
    plot(F2(:,K),V2(:,K,tam),'go');
    plot(F3(:,K),V3(:,K,tam),'bo');
    plot(F4(:,K),V4(:,K,tam),'ro');
    plot(F5(:,K),V5(:,K,tam),'go');
    plot(F6(:,K),V6(:,K,tam),'bo');
    title(['sensor'  int2str(K)])
    legend('M1','M2','M3','M4','M5','M6')
    ylabel('Voltaje')
    grid on
end;

%%
%Se consideran los sensores 12, 4, 11 en VRi
VR1 = [V1(:,12,:)  V1(:,4,:)    V1(:,11,:) ];
VR2 = [V2(:,12,:)   V2(:,4,:)   V2(:,11,:) ];
VR3 = [V3(:,12,:)   V3(:,4,:)   V3(:,11,:) ];
VR4 = [V4(:,12,:)   V4(:,4,:)   V4(:,11,:) ];
VR5 = [V5(:,12,:)   V5(:,4,:)    V5(:,11,:)];
VR6 = [V6(:,12,:)   V6(:,4,:)    V6(:,11,:) ];

[T1,T2,T3]=size(VR1);

%Los datos se colocan en una sola dimensión de longitud (num. sensores)x(num. val. subida)
for i=1:T1,
    vtemp1=aplanar(VR1(i,:,:));
    vtemp2=aplanar(VR2(i,:,:));
    vtemp3=aplanar(VR3(i,:,:));
    vtemp4=aplanar(VR4(i,:,:));
    vtemp5=aplanar(VR5(i,:,:));
    vtemp6=aplanar(VR6(i,:,:));
    V1d(i,:)=vtemp1;
    V2d(i,:)=vtemp2;
    V3d(i,:)=vtemp3;
    V4d(i,:)=vtemp4;
    V5d(i,:)=vtemp5;
    V6d(i,:)=vtemp6;
end;
%Vid datos de entrenamiento de la clase i

close all;

[Td1,Td2]=size(V1d); 

for K=1:12,   %hasta 12
    figure(K)
    plot(V1d(K,:),'r');
    hold on;
    plot(V2d(K,:),'g');
    plot(V3d(K,:),'b');
    plot(V4d(K,:),'r:');
    plot(V5d(K,:),'g:');
    plot(V6d(K,:),'b:');
    title(['Datos para el entrenamiento de las muestra ' int2str(K) ' de cada clase']);
    legend('M1','M2','M3','M4','M5','M6')
    xlabel('Número de entrada');
    ylabel('Voltaje')
    grid on
end;
%%

V1de= V1d;
V2de= V2d; 
V3de = V3d;
V4de= V4d;
V5de= V5d; 
V6de = V6d;

NumM=12;
DPS = [11  10  6  2  1];  %Datos de prueba seleccionados
for k=1:5, %5 datos de prueba
    Rn = DPS(k);
    %Datos de prueba
    V1dp(k,:)= V1de(Rn,:);
    V2dp(k,:)= V2de(Rn,:); 
    V3dp(k,:) = V3de(Rn,:);
    V4dp(k,:)= V4de(Rn,:);
    V5dp(k,:)= V5de(Rn,:); 
    V6dp(k,:) = V6de(Rn,:);
    %Datos de entrenamiento
    V1de= V1de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:);
    V2de= V2de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:); 
    V3de = V3de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:);
    V4de= V4de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:);
    V5de= V5de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:); 
    V6de = V6de([1:(Rn-1)  (Rn+1):(NumM-k+1)],:);

end;

%%
%SIN AUMENTO DE DATOS EN LOS DATOS DE ENTRENAMIENTO
%CON AUMENTO DE DATOS EN 100
%CON AUMENTO DE DATOS EN 500
%CON AUMENTO DE DATOS EN 2000

accuracy=[];

for AD=[0 100 500 2000]
    np=AD;
    na=1;

%     c1=-1;
%     c2=2;
%     V1de_a = aumento_datos(V1de,c1,c2,np,na);
%     V2de_a = aumento_datos(V2de,c1,c2,np,na);
%     V3de_a = aumento_datos(V3de,c1,c2,np,na);
%     V4de_a = aumento_datos(V4de,c1,c2,np,na);
%     V5de_a = aumento_datos(V5de,c1,c2,np,na);
%     V6de_a = aumento_datos(V6de,c1,c2,np,na);
    c1=-2;
    c2=3;
    V1de_a = aumento_datos2(V1de,3,c1,c2,np,na);
    V2de_a = aumento_datos2(V2de,3,c1,c2,np,na);
    V3de_a = aumento_datos2(V3de,3,c1,c2,np,na);
    V4de_a = aumento_datos2(V4de,3,c1,c2,np,na);
    V5de_a = aumento_datos2(V5de,3,c1,c2,np,na);
    V6de_a = aumento_datos2(V6de,3,c1,c2,np,na);

    %Datos de entrenamiento considerando todos los datos de subida de los
    %sensores y las 6 clases
    E = [V1de_a ; V2de_a ; V3de_a ; V4de_a ; V5de_a ; V6de_a ]; 
    tam =size(V1de_a);
    S = [ones(tam(1),1)  
         2*ones(tam(1),1)  
         3*ones(tam(1),1)  
         4*ones(tam(1),1)  
         5*ones(tam(1),1)  
         6*ones(tam(1),1)    ];

    for nnn = 1:1
        %ENTRENAMIENTO
    %     net = patternnet([50 50  50]);
    %     net.trainParam.min_grad=1e-04;
    %     net = train(net,E',S');

        Mdl = fitcecoc(E,S)

        %PREDICCIÓN CONSIDERANDO LAS 6 CLASES
        EP = [V1dp ; V2dp; V3dp ; V4dp ; V5dp; V6dp];
        num=size(EP);
        disp(['Numero de Prueba      ','      M1    ','   M2          '...
                ,'   M3     ','   M4     ','   M5     ','   M6     '])
        porcion = (num(1)/num_clases);
        aciertos=0;
        for j=0:(num_clases-1)
            for i=1:porcion,
                %SP = net(EP(j*porcion+i,:)');  
                SP = predict(Mdl,EP(j*porcion+i,:));
                disp(['       ', num2str(i) ,'              ', num2str(SP) , '               '])
                %[maximo,ind]=max(SP);
                if SP==(j+1)
                    aciertos=aciertos+1;
                end;
            end;
        end;
        accuracy=[accuracy  aciertos/num(1)];

    end;
end;

%%

figure(15)
bar(accuracy)
hold on
bar(1,accuracy(1),'r')
bar(2,accuracy(2),'b')
bar(3,accuracy(3),'g')
bar(4,accuracy(4),'c')

ylabel('Accuracy')
xlabel('Train number')
title('MSVM, con 0, 100, 500 y 2000 datos aumentados');

