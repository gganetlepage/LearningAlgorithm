include("C:/Personnel/Programmation/Julia/Algorithm/chapter4Lib.jl")
using Test
# 4.1 Maximum-subarray problem

# 1. when is full of nonpositive values, then find_max_subarray returns only the middle index and its associated value

price1 = [100,113, 110, 85, 105,102, 86, 63, 81, 101, 94, 106, 101, 79, 94, 90, 97]

change1 = [ price1[i]-price1[i-1] for i in 2:length(price1)]

price2 = [10, 11, 7,10, 6]
change2 = [ price2[i]-price2[i-1] for i in 2:length(price2)]


# 2. brute_force method in Θ(n²)
brute_force(change1) # (8, 11, 43), i.e. buy before day 8 starts, sell after day 11 ends
brute_force(change2) # (3, 3, 3), i.e. buy before day 3 starts, sell after day 3 ends

find_max_crossing_subarray(change1, 1, length(change1)÷2, length(change1))
find_max_crossing_subarray(change2, 1, length(change2)÷2, length(change2))

# 3. recursive algorithm
find_max_subarray(change1, 1, length(change1)) # (8, 11, 43)
find_max_subarray(change2, 1, length(change2)) # (3, 3, 3)

