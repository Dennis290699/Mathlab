function I = Simpson_Compuesto
    % Función anónima que define la función a integrar
    fun = @(x, y) cos(2*x+1);

    a = 0;                % Límite inferior del intervalo
    b = 0.25;             % Límite superior del intervalo
    n = 100;              % Número de subintervalos

    h = (b-a)/n;          % Tamaño de cada subintervalo

    % Creación de dos vectores x e y con n+1 elementos que contienen los puntos igualmente espaciados entre
    % a y b. Estos vectores serán utilizados posteriormente para iterar sobre los subintervalos y calcular la integral.
    x = linspace(a, b, n+1);
    y = linspace(a, b, n+1);

    I = 0;                % Inicialización de la variable de integración

    % Ciclo doble para iterar sobre los subintervalos
    for i=1:n
        for j=1:n
            % Definición de los puntos xi, yi, xj, yj
            xi = x(i);
            yi = y(j);
            xj = x(i+1);
            yj = y(j+1);

            % Cálculo de la integral en cada subintervalo con la regla de Simpson compuesta
            I = I + (h/9)*(fun(xi, yi) + 4*fun((xi+xj)/2, yi) + 2*fun((xi+xj)/2, (yi+yj)/2) + 4*fun(xi, (yi+yj)/2) + fun(xj, yj));
        end
    end

    % Despliegue del resultado
    disp(I);

    % Gráfico de la función y los puntos de integración

    % Creación de un vector de 1000 puntos para graficar la función a integrar.
    x_plot = linspace(a, b, 1000);
    
    % Evaluación de la función a integrar en cada punto del vector x_plot y asignación del resultado al vector y_plot.
    y_plot = fun(x_plot, a);
    
    % Graficación de la función a integrar en color azul ('b') y los puntos de integración en rojo ('ro').
    plot(x_plot, y_plot, 'b', x, y, 'ro');
    
    % Etiquetado de los ejes x e y.
    xlabel('x');
    ylabel('y');
    
    % Asignación de un título a la gráfica.
    title('Método de Simpson compuesto para integración doble');
end