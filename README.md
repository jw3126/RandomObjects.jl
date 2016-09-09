# RandomObjects
[![Build Status](https://travis-ci.org/jw3126/RandomObjects.jl.svg?branch=master)](https://travis-ci.org/jw3126/RandomObjects.jl)
[![Coverage Status](https://coveralls.io/repos/github/jw3126/RandomObjects.jl/badge.svg?branch=master)](https://coveralls.io/github/jw3126/RandomObjects.jl?branch=master)

## Basic Usage

```julia
using RandomObjects

random(Vector{String})
random(Int, 10)

type Foo
  x::Int
  y::Vector{Float64}
end

random(Foo)
```
