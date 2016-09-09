__precompile__()
module RandomObjects

export random

@inline random(::Type{String}; l::Integer=rand(2:10)) = randstring(l)
@inline random(T, n::Integer) = T[random(T) for _ in 1:n]
@inline random{T}(::Type{Vector{T}}; l::Integer=rand(0:20)) = random(T,l)
@inline random{T <: Number}(::Type{T}) = rand(T)
random{K,V}(D::Type{Dict{K,V}}) = D(random(Vector{Tuple{K, V}}))

function random_from_fields_impl{T}(::Type{T})
    fieldtypes = T.types
    random_types = [:(random($S)) for S in fieldtypes]
    Expr(:call, T, random_types...)
end

function random_tuple_impl{T <: Tuple}(::Type{T})
    fieldtypes = T.parameters
    random_types = [:(random($S)) for S in fieldtypes]
    Expr(:tuple, random_types...)
end


@generated random{T}(::Type{T}) = random_from_fields_impl(T)
@generated random{T <: Tuple}(::Type{T}) = random_tuple_impl(T)

end # module
