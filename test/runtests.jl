using Dates, DataFrames, TimeSeries, GetColumn
using Test

colA = [4,3,2,1]
colB = [7,8,9,10]

colsAB = hcat(colA, colB)

colsABC = reshape(colsAB, (2,2,2))


df = DataFrame(ColA = colA, ColB = colB)

dates = collect((Date(Dates.now())-Day(3)):Day(1):Date(Dates.now()))
ta = TimeArray(dates, colsAB, ["ColA","ColB"])

@test getcolumn(colA, 1)    == colA
@test getcolumn(colB, 1)    == colB
@test getcolumn(colsAB, 1)  == colA
@test getcolumn(colsAB, 2)  == colB
@test getcolumn(colsABC, (1,2,0)) == colsABC[1,2,:]
@test getcolumn(colsABC, (2,0,1)) == colsABC[2,:,1]
@test getcolumn(df, "ColA") == colA
@test getcolumn(df, "ColB") == colB
@test getcolumn(ta, "ColA") == colA
@test getcolumn(ta, "ColB") == colB

