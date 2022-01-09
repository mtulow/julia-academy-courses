# Data Module

After finishing this module, you should be able to:

- [x] dowload a data file from the web given a url
  - Downloads package: `Downloads.download`
- [X] load data from a file from a text file via DelimitedFiles or CSV
  - CSV: `CSV.read`
  - DelimmittedFiles: `DelimittedFile.readdlm`
- [ ] write your data to a text file or csv file
  - TEXT: `DelimittedFiles.writedlm`
  - CSV: `CSV.write`
- [ ] load data from file types `xlsx`, `jld`, `npz`, `mat`, `rda`
  - XLSX: `XLSX.readdata`
  - JLD: `JLD.load`
  - NPZ: `NPZ.npzread`
  - MAT: `MAT.matread`
  - RDA: `RData.load`
- [ ] write your data to an `xlsx` file, `jld`, `npz`, `mat`, `rda`
  - XLSX: `XLSX.readdata(<filename>, <sheetname>, <cell range>)`
  - JLD: `save(<filename>, "A", data)`
  - NPZ: `NPZ.npzwrite(<filename>, data)`
  - MAT: `MAT.matwrite`
  - RDA:

      ```julia
      using RCall
      @rput R_data
      R"save(R_data, file=<filename>)"
      ```

- [ ] store data in a `Matrix`, `DataFrame` or `Dict`
  - `Matrix`: pass
  - `DataFrame`: pass
  - `Dict`: pass
- [ ] write functions to perform basic lookups on `Matrix`, `DataFrame`, and `Dict` types
  - `Matrix`: pass
  - `DataFrame`: pass
  - `Dict`: pass
- [ ] use some of the basic functions on DataFrames such as: dropmissing, describe by, and join
