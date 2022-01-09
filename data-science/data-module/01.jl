using CSV
using XLSX
using DataFrames
using BenchmarkTools
using LinearAlgebra


data_dir = "julia-academy-courses/data-science/data/"

files = [
"ESL.mixture.rda",
"stock_prices.xlsx",
"srbct.npy.npz",
"randsens.npz",
"zillow_data_download_april2020.xlsx",
"zip.npy.npz",
"orange.npz",
"14cancer.npy.npz",
"california_counties.json",
"sat.npy",
"programming_languages.csv",
"california_shape.json"]

dfiles = Dict();

for file in files
    dfiles[file] = data_dir * file
end


println("Using RDA");
using RData
mixture = RData.load(dfiles["ESL.mixture.rda"])["ESL.mixture"]
k = map(x -> Symbol(x), collect(keys(mixture))); vals = map(x -> Vector{Any}(x), values(mixture))
display(k); println();
display(vals); println();
@show typeof(vals)

df = DataFrame((vals, k)...)
# @show df
display(df); println()
# @show keys(mixture); println()
# @show df; println()

# @show "Using NPZ";
# using NPZ
# cancer_data = NPZ.npzread(dfiles["14cancer.npy.npz"])
# cancer_df = DataFrame(cancer_data)
# orange = NPZ.npzread(dfiles["orange.npz"])
# orange_df = DataFrame(orange)

# @show size(cancer_df)
# @show size(orange_df)


# @show 


;