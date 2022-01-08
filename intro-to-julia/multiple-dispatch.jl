#==========================================================================================================
|	MULTIPLE DISPATCH
==========================================================================================================#
import Base: +
+(lhs::String, rhs::String) = string(lhs, rhs)
#==========================================================================================================
|	duck typing
==========================================================================================================#
f(x) = x.^2

@show f(10)
@show f([1, 2, 3])
#=========================================================================================================#

#==========================================================================================================
|	Specifying the types of our input arguments
==========================================================================================================#
foo(x, y) = x + y
function foo(x::String, y::String)
	println("My inputs x and y are both strings!\n")
	return foo(x, y)
end
foo(x::Int, y::Int) = println("My inputs x ($x) and y ($y) are both integers!"); x + y

@show foo("hello", "hi!")
@show foo(3, 4)
#=========================================================================================================#

#==========================================================================================================
|	Specifying the types of our input arguments
==========================================================================================================#
@show methods(foo)

@which foo(3, 4)

function foo(x::Number, y::Number)
	println("My inputs x and y are both numbers!")
	return x + y
end

@show foo(3, 4)



#=========================================================================================================#


import Base: +


function +(x::String, y::String)
	output=string(x, y)
	println("'$x' + '$y' \t→\t $output")
	return output
end

"Hello " + "world!";
bar(x) = string(x)

foo(x, y) = println("duck-typed foo!\nfoo($x, $y) -> $(bar(x, y))")
foo(x::Int, y::Float64) = println("foo w/ an integer and a float!\nfoo($x, $y) -> an integer and float")
foo(x::Float64, y::Float64) = println("foo($x, $y) -> foo two floats!\n")
foo(x::Int, y::Int) = println("foo($x, $y) -> two integers!")

@show foo(1, 1);
@show foo(1, 1.0);
@show foo(1.0, 1);
@show foo(1.0, 1.0);
@show foo(true, false);