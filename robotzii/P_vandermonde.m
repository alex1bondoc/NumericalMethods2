function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	n = length(x_interp);
	m = length(coef);
	y_interp = zeros(n, 1);
	for i = 1:n
		aux = 1;
		for j = 1:m
			y_interp(i) = y_interp(i) + coef(j) * aux;
			aux = aux * x_interp(i);
		end
	end
	% TODO: Calcualte y_interp using the Vandermonde coefficients
end