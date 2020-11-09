function AIC(x,y)
    N, k = size(x)
    @assert N == length(y)
    return N*log(RSS(x,y)/N) + 2k
end

function BIC(x,y)
    N,k = size(x)
    @assert N == length(y)
    return N*log(RSS(x,y)/N) + k*log(N)    
end

function AIC_min(x,y)
    _,p = size(x)
    aic_min = Array{Float64}(undef,p)
    aic_min_com = Array{Any}(undef,p)
    for i in 1:p
        combi = combinations(1:p,i) |> collect
        aic_min[i],aic_index = [AIC(x[:,c],y) for c in combi] |> findmin
        aic_min_com[i] = combi[aic_index]
    end
    return aic_min, aic_min_com
end

function BIC_min(x,y)
    _,p = size(x)
    bic_min = Array{Float64}(undef,p)
    bic_min_com = Array{Any}(undef,p)
    for i in 1:p
        combi = combinations(1:p,i) |> collect
        bic_min[i],bic_index = [BIC(x[:,c],y) for c in combi] |> findmin
        bic_min_com[i] = combi[bic_index]
    end
    return bic_min, bic_min_com
end