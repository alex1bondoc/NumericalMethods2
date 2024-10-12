function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'
    n = length(x);
    A = zeros(n, n);
    for i= 1:n
        aux = 1;
        for j = 1:n
            A(i, j) = aux;
            aux = aux * x(i);
        end
    end

    
    coef = linsolve(A, y)

    % TODO: Calculate the Vandermonde coefficients
endfunction
