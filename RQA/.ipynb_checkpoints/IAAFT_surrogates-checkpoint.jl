#WIAAFT_surrogates.jl
using TimeseriesSurrogates
using DelimitedFiles
using Random
n = ARGS[1]
x = vec(Float64.(readdlm(n)))
rng = Random.default_rng(1234)
method = IAAFT()
sg = surrogenerator(x, method, rng)
for i in 1:9
    s = sg()
    writedlm("./surro_index/WIAAFT/qp_surr_00$i", s)
end

for i in 10:99
    s = sg()
    writedlm("./surro_index/WIAAFT/qp_surr_0$i", s)
end

for i in 100:999
    s = sg()
    writedlm("./surro_index/WIAAFT/qp_surr_$i", s)
end

println("WIAAFT surrogate datasets generated")