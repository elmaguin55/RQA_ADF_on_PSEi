#PP.jl
using TimeseriesSurrogates
using DelimitedFiles
using Random
ρ = parse(Float64, ARGS[1])
d = parse(Int, ARGS[2])
rng = MersenneTwister(1234)
x = vec(Float64.(readdlm("stocks")))
method = PseudoPeriodic(d, 6, ρ, true)
sg = surrogenerator(x, method, rng)

for i in 1:9
    s = sg();
    writedlm("./surro_index/PP/qp_surr_00$i", s)
end

for i in 10:99
    s = sg();
    writedlm("./surro_index/PP/qp_surr_0$i", s)
end

println("Pseudo-periodic surrogates generated successfullly")