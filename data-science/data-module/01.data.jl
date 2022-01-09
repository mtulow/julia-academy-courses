#========================================================================================
|   1.  Quick Intro, Packages Needed 
========================================================================================#
#= Data
| Being able to easily load and process data is a crucial task that can make
| any data science more pleasant. In this notebook, we will cover most common
| types often encountered in data science tasks, and we will be using this data
| throughout the rest of this tutorial.
=#
using BenchmarkTools
using DataFrames
using DelimitedFiles
using CSV
using XLSX
using Downloads
#========================================================================================
|   2.  Data Science Tasks
========================================================================================#
#=
|       🗃️ Get some Data
|           - Read
|           - Write
|       ⬇️ Importing your data
|           - XLSX
|           - JLD
|           - NPZ
|           - MAT
|           - RDA
|       🔢 Time to process the data from Julia
|           #NOTE: 📝 A note about missing data
|
|
|       
|
========================================================================================#

#= 🗃️ Get some data
| using Downloads to get data within a program
=#
P = download("https://raw.githubusercontent.com/nassarhuda/easy_data/master/programming_languages.csv",
    "data/programming_languages.csv")
@show P
display(P)
#= 📂 Read your data from text files.
| The key question here is to load data from files such as
| csv files, xlsx files, or just raw text files. We will go over some
| Julia packages that will allow us to read such files very easily.
=#
println()

#= DelimitedFiles
| Let's start with the package DelimitedFiles which is in the standard library.
=#
P,H = readdlm(P, ','; header=true);
@show H
display(P[1:10,:])

@show typeof(P)
@show P[1:10,:]

# To write to a text file, you can:
writedlm("data/programminglanguages_dlm.txt", P, '-')

println()


#= CSV
|
| read
|   Usage: CSV.read(<filename>)
|
| write
|   Usage: CSV.write(<filename>)
|
=#

C = CSV.read("data/programming_languages.csv", DataFrame);
CSV.write("programminglanguages_CSV.csv", DataFrame(P, :auto))
@show typeof(C)
@show C[1:10,:]

@show names(C)
@show describe(C)

println()

@btime P,H = readdlm("programming_languages.csv", ','; header=true);
@btime C = CSV.read("programming_languages.csv", DataFrame);

# To write to a *.csv file using the CSV package

T = XLSX.readdata(
    "data/zillow_data_download_april2020.xlsx", #file name
    "Sale_counts_city", #sheet name
    "A1:F9" #cell range
    )
@show T

#= XLSX
| Another type of files that we may
| often need to read is XLSX files.
| Let's try to read a new file.
=#
G = XLSX.readtable("data/zillow_data_download_april2020.xlsx","Sale_counts_city");
@show G
@show G[1]

println()

#========================================================================================
|   3.  Checklist of New Skills
========================================================================================#


#========================================================================================
|   4.  Cool Finding
========================================================================================#
