include("2_3_lib.jl")

#2.3-2
Amerge1 = [2,4,5,7,1,2,3,6]
merge(Amerge1,1,4,8)

#=
8-element Array{Int64,1}:
 1
 2
 2
 3
 4
 5
 6
 7
=#

mergeSort([2,3,4,5,1,2,3,4],1,8)
#=
8-element Array{Int64,1}:
 1
 2
 2
 3
 3
 4
 4
 5
 =#


#2.3.5
orderedA = [1,2,3,4,5,7,8,9]
binarySearchRecursive(orderedA,6)
#false

#2.3.5bis
binarySearchIterative(orderedA,7)
# 6


#2.3.6
Abinary = map(x->x*2,1:6)
αBin = 10
posBin = binarySearchIndex(Abinary,αBin)
[Abinary[1:posBin-1];αBin;Abinary[posBin:end]]
#=
7-element Array{Int64,1}:
  2
  4
  6
  8
 10
 10
 12
 =#

Ainsert = [5,4,1,3,2,1]
insertionSortWithBinarySearch(Ainsert)
#=
6-element Array{Int64,1}:
 1
 1
 2
 3
 4
 5
=#


#2.3-7
@time HornerPolynomial(1:1000000,12345) # 0.000000 seconds
@time naivePolynomial(1:1000000,12345)  # 0.048531 seconds
