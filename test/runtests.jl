using UniformScalingMatrixFunctions
using Test

@testset "UniformScalingMatrixFunctions.jl" begin
    @test exp(0I) === 1.0I
    @test exp(-im*π/2*I) ≈ -im*I
    @test exp(-im*π/4*I) ≈ (1-im)/√(2)*I

    @test sin(0I) === 0.0I # This assumes iszero(sin(0)), always true?
    @test sin(π/2*I) ≈ I
    @test cos(0I) === 1.0I # This assumes isone(cos(0)), always true?
    @test cos(π/2*I) ≈ 0I atol=1e-14
    @test tan(π/4*I) ≈ I

    @test asin(I) ≈ π/2*I
    @test acos(I) ≈ 0*I atol=1e-14
    @test atan(I) ≈ π/4*I

    # Test hyperbolics + inverses

    @test log(I) === 0.0I
    @test log(exp(I)) === 1.0I

    @test √(4I) === 2.0I
    @test √(4I) == 2I
    @test √(4.0I) === 2.0I
end
