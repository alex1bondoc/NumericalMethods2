function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0
	

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	n = length(x) - 1;
	si = zeros(4 * n, 4 * n);
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
	for i = 1:n
		si(i, (i-1) * 4 + 1) = 1;
	end
	% TODO 2: s_n-1(xn) = yn
	aux = x(n+1) - x(n);
	si(n+1, (n-1) * 4 +1) = 1;
	si(n+1, (n-1) * 4 +2) = aux;
	si(n+1, (n-1) * 4 +3) = aux * aux;
	si(n+1, (n-1) * 4 +4) = aux * aux * aux;

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	for i = 1:n-1
		aux = x(i+1) - x(i);
		si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 1) = 1;
		si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 2) = aux;
		si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 3) = aux * aux;
		si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 4) = aux * aux * aux;
		si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 5) = -1;
		
		si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 2) = si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 1);
		si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 3) = si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 2) * 2;
		si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 4) = si(n + 1 + 3*(i-1) + 1, (i-1) * 4 + 3) * 3;
		si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 6) = si(n+1+3 * (i-1) + 1, (i-1) * 4 + 5) * 1;

		si(n + 1 + 3*(i-1) + 3, (i-1) * 4 + 3) = si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 2) * 2;
		si(n + 1 + 3*(i-1) + 3, (i-1) * 4 + 4) = si(n + 1 + 3*(i-1) + 2, (i-1) * 4 + 3) * 3;

		si(n + 1 + 3*(i-1) + 3, (i-1) * 4 + 7) = si(n+1+3 * (i-1) + 2, (i-1) * 4 + 6) * 2;

	end
	

	% TODO 6: s0''(x0) = 0
	si(4 * n -1 , 3) = 2;
	% TODO 7: s_n-1''(x_n) = 0
	si(4 * n, 4*(n-1) + 3) = 2;
	si(4 * n, 4*(n-1) + 4) = 6 * (x(n+1)-x(n));
	

	% Solve the system of equations
	sol = zeros(4 * n,1);
	for i= 1:n+1
		sol(i) = y(i);
	end

	coef = linsolve(si, sol);
end
