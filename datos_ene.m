
%Cada 480 valores es una muestra, 
%Columnas (sensores): 
% El 16 y el 20 de julio se analizaron muestras de Pisco en diferentes variedades y marcas comerciales.											
% 											
% Los sensores empleados fueron los siguientes: (Se resaltan entre comillas los que obtuvieron un mejor desempeño.)											
% 											
%       "MOS1"	    "MOS2"	     MOS3	   "MOS4"	              MOS5            "MOS6"	              "MOS7"	           MOS8	     MOS9	       MOS10	         "MOS11"	           "MOS12"
% Ti/Sn-1/1-MK	Ti/Sn-2/1-MK	VACIO	MoO3/SnO2-1/1-MF	MoO3/SnO2-1/1-MK	TiO2/SnO2-1/1-MF	TiO2/SnO2-1/1-MK	MoO3/SnO2-2/1-MF	VACIO	MoO3/SnO2-2/1-MF	TiO2/SnO2-2/1-MF	TiO2/SnO2-2/1-MK
% 											
% Durante el ensayo se realizaron 72 ciclos de sensado de 480 segundos (80 s de llenado + 400 s de purga)											
% 											
% 01-12: Tabernero Quebranta [10:15-12:15,16Jul] 											
% 13-24: Dem Andes Quebranta 30% [13:10-15:10,16Jul]											
% 25-36: Queirolo Quebranta [15:50-17:50,16Jul]											
% 37-48: Queirolo Italia [11:20-13:20,20Jul]											
% 49-60: Tabernero Italia [14:20-16:20,20Jul]											
% 61-72: Dem Andes Italia [16:50-18:50,20Jul]											

%se separan por clases 
%clase1: M1 (Tabernero Quebranta) - QT
%clase2: M2 (Dem Andes Quebranta) - QD
%clase3: M3 (Queirolo Quebranta) - QQ
%clase4: M4 (Queirolo Italia)   - IQ
%Clase5: M5 (Tabernero Italia)  - IT
%Clase6: M6 (Dem Andes Italia)  - ID
a=480; %cantidad de valores de una muestra
%indices para separarlos I=[clase   Num.repeticiones]
I=[ 1  12
    2  12
    3  12
    4  12
    5  12
    6  12];

%Se carga los datos en la variable M
dataEnero;

[t1,t2]=size(M);
%M=[M(6:t1,:);zeros(5,5)];

[t1,t2]=size(M);
[t3,t4]=size(I);
M1=[];
M2=[];
M3=[];
M4=[];
M5=[];
M6=[];
i=0;
for N=1:t3,
    if I(N,1)==1, %clase 1
        M1=[M1; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 1
    end;
    if I(N,1)==2, %clase 2
        M2=[M2; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 2
    end;
    if I(N,1)==3, %clase 3
        M3=[M3; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 3
    end;
    if I(N,1)==4, %clase 4
        M4=[M4; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 4
    end;
    if I(N,1)==5, %clase 5
        M5=[M5; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 5
    end;
    if I(N,1)==6, %clase 6
        M6=[M6; M((i*a+1):(i*a+I(N,2)*a),:)]; %filas de la clase 6
    end;
    i=i+I(N,2);
end;

                
                
                
                