# Linear Algebra

---

## Factorizations

---

### QR

### LU

### SVD

### Cholesky

### Bunch-Kaufman

### LDLt

### Diagonal

### BiDiagonal

### TriDiagonal

### SymTridiagonal

---

## _Factorization Table_

---

Compute a convenient factorization of A, based upon the type of the input matrix. factorize checks A to see if it is symmetric/triangular/etc. if A is passed as a generic matrix. factorize checks every element of A to verify/rule out each property. It will short-circuit as soon as it can rule out symmetry/triangular structure. The return value can be reused for efficient solving of multiple systems.

For example:

```julia
A=factorize(A); x=A\b; y=A\C
```

If `factorize` is called on a Hermitian positive-definite matrix, for instance, then `factorize` will return a Cholesky factorization.

Properties of A | type of factorization
|:---------|:---------|
 positive-definite | Cholesky (see [cholesky](#cholesky))
 Dense Symmetric/Hermitian | Bunch-Kaufman (see [bunch-kaufman](#bunch-kaufman))
 Sparse Symmetric/Hermitian | LDLt (see [ldlt](#ldlt))
 Triangular | Triangular (see [tridiagonal](#tridiagonal))
 Diagonal | Diagonal (see [diagonal](#diagonal))
 BiDiagonal | Bidiagonal (see [bidiagonal](#bidiagonal))
 TriDiagonal | LU (see [lu](#lu))
 Symmetric real TriDiagonal | LDLt (see [ldlt](#sym))
 General Square | LU (see [lu](#lu))
 General Non-Square | QR (see [qr](#qr))

---

## _Linear-Algebra:_ __Notes__

- `A` is a `Matrix` type, and `b` is a `Vector` type.
- The transpose function creates a matrix of type `Adjoint`.
- `\` is always the recommended way to solve a linear system. You almost never want to call the `inv` function

### Matrix Division

```julia
\(A, B)
```

Matrix division using a polyalgorithm. For input matrices $\text{A}$ and $\text{B}$, the result $\text{X}$ is such that $\text{A}*\text{X} = \text{B}$ when $\text{A}$ is square. The solver that is used depends upon the structure of $\text{A}$. If $\text{A}$ is upper or lower triangular (or diagonal), no factorization of $\text{A}$ is required and the system is solved with either forward or backward substitution. For non-triangular square matrices, an `LU` factorization is used.

For rectangular $\text{A}$ the result is the minimum-norm least squares solution computed by a pivoted `QR` factorization of $\text{A}$ and a rank estimate of $\text{A}$ based on the $\text{R}$ factor.

When `A` is sparse, a similar polyalgorithm is used. For indefinite matrices, the `LDLt` factorization does not use pivoting during the numerical factorization and therefore the procedure can fail even for invertible matrices.

```julia
(\)(F::QRSparse, B::StridedVecOrMat)
```

Solve the least squares problem $\min \|\mathbf{A}\text{x} - \text{b}\|^2$ or the linear system of equations $\mathbf{A}\text{x} - \text{b}$ when `F` is the sparse QR factorization of $\mathbf{A}$. A basic solution is returned when the problem is underdetermined.

---

## _Skills Checklist_

---

- [X] reshape and vectorize a matrix
- [ ] apply basic linear algebra operations such as transpose, matrix-matrix product, and solve a linear systerm
- [ ] call a linear algebra factorization on your matrix
- [ ] use SVD to created a compressed version of an image
- [ ] solve the face recognition problem via a least square approach
- [ ] create a sparse matrix, and call the components of the Compressed Sparse Column storage
- [ ] list a few types of matrices Julia uses (diagonal, upper triangular, ...)
- [ ] (unrelated to linear algebra): load an image, convert it to grayscale, and extract the RGB layers
