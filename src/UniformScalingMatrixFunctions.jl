module UniformScalingMatrixFunctions
using LinearAlgebra

# Matrix/operator functions f(A) are defined as either the Taylor
# series of f evaluated using the matrix A, or equivalently, as f(A) =
# Q*f(λ)*Qᴴ, where Q is the matrix of eigenvectors of A and λ the
# associated eigenvalues. UniformScaling represents linear operators
# of the form α*I, where α is a scalar, which simultaneously is the
# only eigenvalue. A matrix/operator function f(α*I) is thus simply
# f(α)*I, which is also valid from the Taylor series perspective,
# since I^k==I.
for f in [:exp,
          :sin, :cos, :tan,
          :asin, :acos, :atan,
          :sinh, :cosh, :tanh,
          :asinh, :acosh, :atanh,
          :log, :sqrt]
    @eval begin
        Base.$f(J::UniformScaling) = UniformScaling($(f)(J.λ))
    end
end

export I

end # module
