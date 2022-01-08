import Base: +

function +(x::String, y::String)
	output=string(x, y)
	println("'$x' + '$y' \t→\t $output")
	return output
end

"Hello " + "world!"


foo(x, y) = println("foo($x, $y) -> duck-typed foo!")
foo(x::Int, y::Float64) = println("foo($x, $y) -> an integer and float")
foo(x::Float64, y::Float64) = println("foo($x, $y) -> two floats!")
foo(x::Int, y::Int) = println("foo($x, $y) -> two integers!")

foo(1, 1)
foo(1, 1.0)
foo(1.0, 1)
foo(1.0, 1.0)
foo(true, false)