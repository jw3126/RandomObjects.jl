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

type C{S}
    ab::Tuple{A, B, S}
end

const TESTTYPES = [Int, String, A, B, C{Int}, Dict{Int, String}, Matrix{Float32}]



@testset "Test random(T)::T" begin
    for T in TESTTYPES
        n = rand(0:5)
        @test typeof(@inferred random(T)) == T
        @test length(@inferred random(T, n)) == n
    end
end
