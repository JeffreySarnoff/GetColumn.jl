# GetColumn.jl
### Get a column from a Vector, Matrix, 3D Array, DataFrame, or TimeSeries.
#### Copyright © 2017-2018 by Jeffrey Sarnoff.  Released under the MIT License.

-----

[![Build Status](https://travis-ci.org/JeffreySarnoff/GetColumn.jl.svg?branch=master)](https://travis-ci.org/JeffreySarnoff/GetColumn.jl)
-----

### Exports
`getcolumn`

### Examples

```julia
julia> using Dates, DataFrames, TimeSeries, GetColumn

julia> colA = [4,3,2,1];
julia> colB = [7,8,9,10];

julia> colsAB = hcat(colA, colB);

julia> df = DataFrame(ColA = colA, ColB = colB);

julia> dates = collect((Date(Dates.now())-Day(3)):Day(1):Date(Dates.now()));
julia> ta = TimeArray(dates, colsAB, ["ColA","ColB"]);

julia> getcolumn(colA, 1) == colA
true

julia> getcolumn(colsAB, 2) == colB
true

julia> getcolumn(df, "ColA") == colA
true

julia> # shows deprecation warnings until TimeSeries.jl is v0.7.0- compat
julia> getcolumn(ta, "ColB") == colB
true
```
