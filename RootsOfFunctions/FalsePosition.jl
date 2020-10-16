function FalsePosition(a, b)
	f(x) = exp(-x) - x
	fa = f(a)
	fb = f(b)
	x = a - ((a - b) * fa) / (fa - fb)

	while abs(x - a) > eps() && abs(b - x) > eps()
		fx = f(x)
		if fx * fa > 0
			a = x
			fa = fx
		else
			b = x
			fb = fx
		end
		x = a -((a - b) * fa) /(fa - fb)
	end
	return x
end

println(FalsePosition(0,1))
