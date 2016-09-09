__precompile__()
module RandomObjects

export random

random(::Type{String}; l::Integer=rand(2:10)) = randstring(l)
random(T, n::Integer) = T[random(T) for _ in 1:n]
random{T}(::Type{Vector{T}}; l::Integer=rand(0:20)) = random(T,l)
random{T <: Number}(::Type{T}) = rand(T)

function random_impl{T}(::Type{T})
    fieldtypes = T.types
    random_types = [:(random($S)) for S in fieldtypes]
    Expr(:call, T, random_types...)
end

@generated random{T}(::Type{T}) = random_impl(T)


end # module
