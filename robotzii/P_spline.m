function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	n = length(x_interp);
	m = length(x);
	y_interp = zeros(n, 1);
	for i = 1:n
		if x(1) == x_interp(i)
            y_interp(i) = coef(1) + coef(2) * (x_interp(i) - x(1))+coef(3) * (x_interp(i) - x(1))* (x_interp(i) - x(1)) + coef(4) * (x_interp(i) - x(1))* (x_interp(i) - x(1))* (x_interp(i) - x(1));
        elseif x(m) == x_interp(i)
            aux = x_interp(i) - x(m-1);
            y_interp(i) = coef((m-2) * 4+ 1) + coef((m-2) * 4+2) * aux+coef((m-2) * 4+3) * aux * aux + coef((m-2) * 4+4) * aux * aux * aux;
        else
            for j = 1:m-1
                if x_interp(i) < x(j+1)
                    aux = x_interp(i) - x(j);
                    y_interp(i) = coef((j-1) * 4+ 1) + coef((j-1) * 4+2) * aux+coef((j-1) * 4+3) * aux * aux + coef((j-1) * 4+4) * aux * aux * aux;
                    break;
                end
            end
        end
	end
end