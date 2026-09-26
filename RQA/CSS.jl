using TimeseriesSurrogates
using DelimitedFiles
using Random
x = vec(Float64.(readdlm("stocks")))
rng = MersenneTwister(1234)
method = CycleShuffle()
sg = surrogenerator(x, method, rng)
for i in 1:9
    s = sg()
    writedlm("./surro_index/CSS/qp_surr_00$i", s)
end

for i in 10:99
    s = sg()
    writedlm("./surro_index/CSS/qp_surr_0$i", s)
end

for i in 100:999
    s = sg()
    writedlm("./surro_index/CSS/qp_surr_0$i", s)
end

println("CSS surrogate datasets generated")