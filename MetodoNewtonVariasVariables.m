syms x y
format long

f1 = 2*x^2 + 2*x*y + y^2 - 1;
f2 = x^2 - 3*x*y +3*y^2 - 1;
N = 10;
eps = 0.000001;

F = [f1; f2]; %vector columna
J = jacobian([f1, f2], [x;y]);
%valor inicial
P0 = [0 ; 1];
P1 = P0 - inv(subs(J, [x;y], P0))*subs(F, [x;y], P0);
i=1;
E=[0,transpose(vpa(P0));
   1,transpose(vpa(P1))];
while(norm(P1-P0)> eps && i<N)
    i=i+1;
    P0=P1;
    P1 = P0 - inv(subs(J, [x;y], P0))*subs(F, [x;y], P0);
    E=[E;i,transpose(vpa(P1))];
end
E

ezplot(f1,[-2,2,-2,2]), grid on, hold on
ezplot(f2,[-2,2,-2,2])
plot(E(:,2),E(:,3),'*')

