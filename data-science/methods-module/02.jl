# some packages we will use
using LinearAlgebra
using SparseArrays
# using Images
# using MAT



A = rand(10,10);    # created a random matrix of size 10-by-10
At = A'             # matrix transpose
A = A*At;           # matrix multiplication

@show A[11] == A[1,2];
;
#= =#
println()
b = rand(10)
x = A \ b
@show norm(A*x - b);
;
#= =#
println()

@show typeof(A)
@show typeof(b)
@show typeof(rand(10,1))
@show typeof(At)
;
println()


@show sizeof(A);
@show sizeof(b);


#=======================================================================================
|                                   FACTORIZATIONS
=======================================================================================#
println("\nFACTORIZATIONS")
#=
| LU Factorizations
=#
println("\nLU Factorizations")
A_lu = lu(A)
P = A_lu.P              # P - permutation matrix
L = A_lu.L              # L - lower triangular matrix
U = A_lu.U              # U - upper triangular matrix
@show norm(L*U - P*A)
#=  L⋅U = P⋅A
|
|   • P - permutation matrix
|   • L - lower triangular matrix
|   • U - upper triangular matrix 
=======================================================================================#
#=
|   QR Factorizations
=#
println("\nQR Factorizations")
A_qr = qr(A)
Q = A_qr.Q
R = A_qr.R
@show norm(Q*R - A)
#= Q⋅R = A
|
|   • Q - permutation matrix
|   • R - lower triangular matrix
=======================================================================================#
#=
|   Cholesky Factorizations
=#
println("\nCholesky Factorization")
@show isposdef(A)
A_chol = cholesky(A)
L = A_chol.L            
U = A_chol.U
@show norm(L*U - A)
#= 
|    L⋅L' = A
|
|   • Q - permutation matrix
|   • R - lower triangular matrix
=======================================================================================#

println("\nSANDBOX\n")
(m, n) = (10, 10);
A = 1 ./ rand(Float64, (m, n))
display(A); println()


factorize(A)