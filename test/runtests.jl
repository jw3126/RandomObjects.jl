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
        @test typeof(@inferred random(T)) == T
    end
end
