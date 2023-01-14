syms x

eps =0.000001;
format long

%problema original  f(x)=0  dentro de un intervalo
f = x^3 -4*x +1;
a = 1;
b = 3; 

g = x-(f/diff(f));
%inicio la sucesion de puntos pn
p1= (a+b)/2;  %debe estar en el intervalo
p2= vpa(subs(g,x,p1));
i=0;
n=10;
E=[];

while(abs(p2-p1)< eps && i<n)
    i=i+1;
    p1=p2;
    p2= vpa(subs(g,p1));
    E=[E;i,p2];
end
disp("iteraciones");
E


