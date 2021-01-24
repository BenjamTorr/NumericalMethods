function x = SolveSustLU(L, U, b)
% Resuelve el sistema Ax = b particular LUx = b donde L triangular inferior
% y U triangular superior se puede obtener en LUpropio Torres Aguilar
% Ishmael Benjamin
 [m, n] = size(L);
 x = zeros(n,1);
 y = zeros(n,1);
 y(1) = b(1);
 for i = 2:n
    suma = 0;
    for j = 1:(i-1)
       suma = suma + L(i,j) * y(j); 
    end
    y(i) = b(i) - suma;
 end
 x(n) = y(n) / U(n,n);
 for i = (n-1):-1:1
    suma = 0;
    for j = (i+1):n
       suma = suma + U(i,j)*x(j); 
    end
    x(i) = (y(i) - suma) / U(i,i);
 end
end

