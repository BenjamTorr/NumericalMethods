function [L, U] = LUPropio(A)
%Esta funcion Encuentra la foctorizacion LU de una Matriz cuadrada no
%singular, Torres Aguilar Ishmael benjamin Metodos Numericos
    [m, n] = size(A);
    if not(m == n) 
        L = eye(n);
        U = eye(n);
        return
    end
    L = eye(n);
    for j = 1:(n-1)
        E = eye(n);
        for i = (j+1):n
            factor = A(i,j)/A(j,j);
            A(i, :) = A(i,:) - factor*A(j,:);
            E(i, :) = E(i,:) + factor*E(j,:);
        end
       L = L * E;
    end
    U = A;
end

