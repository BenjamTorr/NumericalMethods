function bisection(a, b, ntol)
	f(z) = z^3 - z + 1
	x = 0.0
	for n = 1:ntol
		x = a + (b - a)/2
		if f(x) * f(b) < 0
			a = x
		else
			b = x
		end
	end
	return x
end

println(bisection(-5,0, 10))
		
