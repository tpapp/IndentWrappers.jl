using IndentWrappers, Test

@testset "indent" begin
    io = IOBuffer()
    print(io, "toplevel")
    let io = indent(io, 4)
        print(io, '\n', "- level1")
        let io = indent(io, 4)
            print(io, '\n', "- level 2")
            println(io)
            println(io, "test")
            print(io, "closing")
        end
    end
    buffer = String(take!(io))
    expected = "toplevel\n    - level1\n        - level 2\n        test\n        closing"
    @test buffer == expected
end
