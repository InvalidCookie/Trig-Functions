class Trig
	def initialize
		@pi = 3.1415926535897932
	end

	def facto(x) #takes factorial of x
		return x.downto(1).reduce(:*) 
	end

	def degrad(x, c) #degree radian converter
		return x * @pi / 180 if c == 'r'
		return x / @pi * 180 if c == 'd'
	end


	def sin(angle)
		x = degrad(angle, 'r')

		tot = 0
		25.times do |n| #uses taylor series, only accepts radians.
			tot += (x**(2*n+1) / facto(2*n+1)) * (-1)**n
		end

		return degrad(tot, 'd')
	end


	def cos(angle)
		x = degrad(angle, 'r')

		tot = 1 #set to 1 to compensate for 1st skip.
		25.times do |n| #uses taylor series, only accepts radians.
			tot += (x**(2*n) / facto(2*n)) * (-1)**n if n != 0 #skips first one, fix for divide 0 error
		end

		return degrad(tot, 'd')		
	end


	def tan(angle)
		x = degrad(angle, 'r')
		puts degrad(Math::tan(x),'d')

		return atan(sin(angle) / cos(angle)) #tangent inverse
	end


	def asin

	end


	def acos

	end


	def atan

	end


end


re = Trig.new::tan(2)
puts re

#add failsafe, numbers not to be over 360