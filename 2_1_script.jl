include("2_1_lib.jl")

isPrinted = true

A = [3,2,3,1,4,5]
insertionSort(A)


#=6-element Array{Int64,1}:
1
2
3
3
4
5
=#


for i in 1:20
     isPrinted && println("i:$i ", twoSum([1,2,4,6,8,10],i))
end

#=
i:1 false
i:2 false
last element taken: 1
i:3 true
i:4 false
last element taken: 1
i:5 true
last element taken: 2
i:6 true
last element taken: 1
i:7 true
last element taken: 2
i:8 true
last element taken: 1
i:9 true
last element taken: 3
i:10 true
last element taken: 1
i:11 true
last element taken: 3
i:12 true
i:13 false
last element taken: 4
i:14 true
i:15 false
last element taken: 4
i:16 true
i:17 false
last element taken: 5b1 = [1,1,0,0]
b2 = [1,1,1,0]
binarySum(b1,b2)

#=
5-element Array{Integer,1}:
 1
 1
 0
 1
 0
 =#
i:18 true
i:19 false
i:20 false 
=#

isPrinted && insertionSortNonIncreasing([31,41,59,26,41,58])
#=
insertionSortNonIncreasing([31,41,59,26,41,58])
insertionSortNonIncreasing([31,41,59,26,41,58])
6-element Array{Int64,1}:
 59
 58
 41
 41
 31
 26
 =#


linearSearch([31,41,59,26,41,58],4)
#"not in the array"

b1 = [1,1,0,0]
b2 = [1,1,1,0]
binarySum(b1,b2)

#=
5-element Array{Integer,1}:
 1
 1
 0
 1
 0
 =#