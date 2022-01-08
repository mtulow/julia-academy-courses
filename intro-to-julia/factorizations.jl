using LinearAlgebra


#= Factorizations and other fun 
| Overview:
|   • FACTORIZATIONS
|   • SPECIAL MATRIX STRUCTURES
|   • GENERIC LINEAR ALGEBRA
=#

#==========================================================
| FACTORIZATIONS
==========================================================#
println("\nFACTORIZATIONS\n")

A = randn(3, 3)
print("\nA  "); display(A)
x = fill(1, (3,))
print("\nx  "); display(x)
b = A * x
print("\nb  "); display(b)

#= LU Factorizations =#
println("\nLU Factorizations\n")
A_qr = qr(A)
display(A_qr)

#= QR Factorizations =#
println("\nLU Factorizations\n")
A_lu = lu(A)
l,u,p =  A_lu
display(A_lu)
display(p); display(A_lu.P)

#= Eigendecompositions =#
#TODO: not implemented


#=========================================================#



#==========================================================
| SPECIAL MATRIX STRUCTURES
==========================================================#
println("\nSPECIAL MATRIX STRUCTURES\n")

n = 1000
A = randn(n,n);
#= 
| Julia can often infer special matrix structure
| but sometimes floating point error might get in the way
| Luckily we can declare structure explicitly with:
|   • Diagonal
|   • Triangular
|   • Symmetric
|   • Hermitian
|   • Tridiagonal
|   • SymTridiagonal
=#
Asym = A + A'
Asym_noisy = copy(Asym)
Asym_noisy[1,2] += 5eps()
Asym_explicit = Symmetric(Asym_noisy);
#=
| compare how long it takes Julia to compute the eigenvalues of
|   • Asym
|   • Asym_noisy
|   • Asym_explicit
=#
println("Asymetrical A")
@time eigvals(Asym);
println("\nNoisy Asymetrical A")
@time eigvals(Asym_noisy);
println("\nExplicit Asymetrical A")
@time eigvals(Asym_explicit);
#= A Big Problem
| Using the Tridiagonal and SymTridiagonal types to store
| tridiagonal matrices makes it possible to work with
| potentially very large tridiagonal problems.
| The following problem would not be possible to solve
| on a laptop if the matrix had to be stored as a (dense) Matrix type.
=#
n = 1_000_000;
A = SymTridiagonal(randn(n), randn(n-1));
println("\nSymmetric Tridiagonal A")
@time eigmax(A);
#=========================================================#




#==========================================================
| EXERCISES
==========================================================#
#TODO: not implemented
#=========================================================#
