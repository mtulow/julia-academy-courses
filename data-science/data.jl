# Installs
using BenchmarkTools
using DataFrames
using DelimitedFiles
using CSV
using XLSX
using Downloads



P = Downloads.download("https://raw.githubusercontent.com/nassarhuda/easy_data/master/programming_languages.csv",
    "programming_languages.csv")
    