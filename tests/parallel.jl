addprocs(4)

@everywhere begin
function foo(x)
    s = 0
    for v=1:x
        s += v^3 - v^2 + mean(rand(100000))
    end
    return s
end
end

v = 1:100

println("serial")
@time r = map(foo, v) 
@time r = map(foo, v) 

println("parallel")
@time r = pmap(foo, v)
@time r = pmap(foo, v)
