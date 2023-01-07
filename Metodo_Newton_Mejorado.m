%Metodo de Newton Rapson Modificado
clc
syms x
fprintf('Metodo de Newton Rapson \n'); 
funcion = input('Ingrese la funcion f(x): ');   %recibe cualquir tipo de funcion
xi = input('Ingrese el valor de Xi: ');% Guarda el Valor de X 
n = input('Ingrese el valor de numero de Iteraciones: '); % Es el numero de Veces que se quiere iterar
%Error = input('Ingres el error de Aproximacion Normalmente empieza en 0: ');
fprintf('\n');
fprintf('-------------|---------------------|------------------------\n');
fprintf('Iteracion    |     Estimacion      |      Error aprox      |\n');
fprintf('-------------|---------------------|------------------------\n');
fxi = inline(funcion);%Guarda la funcion original para posterior ser evaluado con el valor de xi
EstAnterior = 0; %La Estimacion Anterioor en la Primera iteracion es = 0
        
        z = diff(funcion,1); %deriva la funcion, por primera vez 
        d1 = inline(z);% Guarda la primera deriva de la funcion
       
        a = diff(funcion,2);%deriva la funcion por segunda vez
        d2 = inline(a);% Guarda la segunda deriva de la funcion
        
        %x^3-5*x^2+7*x-3

for i = 1: n
    
    funvalu = fxi(xi);%se Valua la funcion Original con el valor de Xi
    d1valuada = d1(xi);%evalua y guarda la funcion Derivada por primera vez con el valor que tiene xi
    d2valuada = d2(xi);%evalua y guarda la funcion Derivada por segunda vez con el valor que tiene xi
    Estimacion = xi-((funvalu*d1valuada)/((d1valuada)^2-funvalu*d2valuada));% Calcula la Estimacion
    Error = ((Estimacion-EstAnterior)/Estimacion)*100; %Calcula el Eror de Aproximacion
    fprintf('    %2d       |    %12.9f     |    %12.8f       |\n', i, Estimacion, Error);
    fprintf('-------------|---------------------|------------------------\n');
    EstAnterior = Estimacion; %Asigna la nueva Estimacion a la Variable de EstAnterior
    xi = Estimacion;%Asigna el nuevo valor de xi
end