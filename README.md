# IndentWrappers

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
[![CI](https://github.com/tpapp/IndentWrappers.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/tpapp/IndentWrappers.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/github/tpapp/IndentWrappers.jl/graph/badge.svg?token=NHtZfMmkmp)](https://codecov.io/github/tpapp/IndentWrappers.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Usage

`indent(io, n)` returns an `::IO` object that writes `n` spaces after each `\n`.

`indent`s can be chained, use in a functional way. It is recommended that implementations of `Base.show` using this package never close with a newline.

Example:

```julia
struct Foo
    contents
end

function Base.show(io::IO, foo::Foo)
    print(io, "This is a Foo with the following contents:")
    let inner_io = indent(io, 4)
        for elt in foo.contents
            print(inner_io, '\n', elt)
        end
    end
end
```

then

```julia
julia> Foo(['a', 42, "string"])
This is a Foo with the following contents:
    a
    42
    string
```

## Similar packages

- [IOIndents.jl](https://github.com/KristofferC/IOIndents.jl), which inspired part of the implementation
