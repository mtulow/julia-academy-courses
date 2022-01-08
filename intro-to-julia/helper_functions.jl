using LinearAlgebra


import Base: display
import LinearAlgebra: LU, SVD, Schur,
                        QRCompactWY,
                        Hessenberg,
                        Eigen


function display(A_qr::QRCompactWY)
    print("\nQ  ∈  "); display(A_qr.Q)
    print("\nR  ∈  "); display(A_qr.R)
    println()
    return typeof(A_qr)
end


function display(A_lu::LU)
    print("\nP  ∈  "); display(A_lu.P)
    print("\nL  ∈  "); display(A_lu.L)
    print("\nU  ∈  "); display(A_lu.U)
    println()
    return typeof(A_lu)
end

function display(A_eig::Eigen)
    print("\neigen-values  ∈  "); display(A_eig.values)
    print("\neigen-vectors  ∈  "); display(A_eig.vectors)
    println()
    return typeof(A_eignen)
end


