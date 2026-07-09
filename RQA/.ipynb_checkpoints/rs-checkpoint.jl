#rs.jl
using TimeseriesSurrogates
using DelimitedFiles
using Random
rng = MersenneTwister(1234)
x = vec(Float64.(readdlm("stocks")))
method = RandomShuffle()
sg = surrogenerator(x, method, rng)
for i in 1:9
    s = sg();
    writedlm("./surro_index/Random_s/qp_surr_00$i", s)
end

for i in 10:99
    s = sg();
    writedlm("./surro_index/Random_s/qp_surr_0$i", s)
end

println("Random shuffle surrogates generated successfullly")