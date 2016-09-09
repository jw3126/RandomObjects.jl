using RandomObjects
using Base.Test

type A
    i::Int
    s::Vector{String}
end

immutable B
    a::A
    f::Float64
    as::Vector{A}
end

@testset "Test random(T)::T" begin
    for T in [Int, String, A, B]
        n = rand(0:5)
        @test typeof(@inferred random(T)) == T
        @test length(@inferred random(T, n)) == n
    end
end
