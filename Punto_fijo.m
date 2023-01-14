syms x
eps =0.000001;
format long

%problema original  f(x)=0  dentro de un intervalo
f = x^2 + x - 1
a = 0;
b = 1; 
%problema de punto fijo  g(x)=x
%primera opcion
g1 = 1-x^2;  %no verifica la parte b del TH Punto Fijo (k = 2)
%segunda opcion
g2=sqrt(1-x); %  si verifica todo el ThPF (k=1/2)
%tercera opcion
g3 = 1/(1+x)  %fue necesario ajustar el intervalo para garantizar ThPF 
%a = 1/10  b =1  =>  k = 100/121


g_alg = g1
%inicio la sucesion de puntos pn
p1= (a+b)/2;  %debe estar en el intervalo
p2= vpa(subs(g_alg,x,p1));
i=0;
n=100;
E=[];

%error realitvo
%while(abs((p1-p2)/p1) > eps && i<n)
%error normal
while(abs(p1-p2) > eps && i<n)
    i=i+1;
    p1=p2;
    p2= vpa(subs(g_alg,p1));
    E=[E;i,p2];
end
disp("iteraciones");
E


 X=linspace(a,b);  %<==== para el grafico
 F=subs(f,x,X);
 G=subs(g_alg,x,X);
 
 O=zeros(1,i);
 S = E(:,2);
 
 plot(X,F, X,G, S,O, '*', X,X )


