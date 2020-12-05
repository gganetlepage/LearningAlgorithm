function insertionSort(array)
    for j in 2:length(array)
        #loop invariant: insert array[j] into the sorted sequence array[1:j-1]
        keyToPlace = array[j]
        i = j - 1
        while i ≥ 1 && array[i] > keyToPlace
            #loop invariant: keyToPlace is not at its correct place
            array[i+1] = array[i]
            i -=1
        end
        array[i+1] = keyToPlace
    end
    array
end

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

function fact(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 1
    n * fact(n-1)
end


function insertionSortNonIncreasing(array)
    for j in 2:length(array)
        #loop invariant: insert array[j] into the sorted sequence array[1:j-1]
        keyToPlace = array[j]
        i = j - 1
        while i ≥ 1 && array[i] < keyToPlace
            #loop invariant: keyToPlace is not at its correct place
            array[i+1] = array[i]
            i -=1
        end
        array[i+1] = keyToPlace
    end
    array
end


insertionSortNonIncreasing([31,41,59,26,41,58])
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

 #2.1-3
function linearSearch(array,value)
    i = 1
    #loop invariant: value is not in array[1:i-1]
    while i ≤ length(array)
        array[i]==value && return i
        i +=1
    end
    "not in the array"
end

linearSearch([31,41,59,26,41,58],4)
#"not in the array"

#2.1-4
function binarySum(B1, B2)
    L = length(B1)
    L == length(B2) || error("arrays don't share the same length")
    remainder =  Array{Integer}(undef,L)
    sum = Array{Integer}(undef,L+1)
    # compute remainder and sum
    remainder[end] = (B1[end]+B2[end]) ÷ 2
    sum[end] = (B1[end]+B2[end]) % 2
    for i in reverse(1:L-1)
        remainder[i] = (B1[i] + B2[i] + remainder[i+1]) ÷ 2
        sum[i+1] = (B1[i] + B2[i] + remainder[i+1]) % 2
    end
    sum[1] = remainder[1]
    sum    
end


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

#2.3-2
function merge(A,p,q,r)
    left = A[p:q]
    right = A[q+1:r]
    i = 1 #left
    j = 1 #Right
    for k in p:r
        if i≤q-p+1 && j ≤ r-q
            if left[i]≤ right[j]
                A[k] = left[i]
                i += 1
            else
                A[k] = right[j]
                j += 1
            end
        elseif i ≥ q-p+2
            #add only left elements of right
            A[k] = right[j]
            j += 1
        else
            #add only left elements of left
            A[k] = left[i]
            i += 1
        end
    end
    A
end

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

function mergeSort(A,p,r)
    if p<r
        q = fld((p+r),2)
        mergeSort(A,p,q)
        mergeSort(A,q+1,r)
        merge(A,p,q,r)
    end
end

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
function binarySearchRecursive(A,value)
    L = length(A)
    L==1 && return A[1]==value
    α = A[fld(L,2)]
    if α ==value
        return true
    elseif α < value
        return binarySearchRecursive(A[cld(L,2):end],value)
    else
        # α > value
        return binarySearchRecursive(A[1:fld(L,2)],value)
    end
end

orderedA = [1,2,3,4,5,7,8,9]
binarySearchRecursive(orderedA,6)
#false

#2.3.5bis
function binarySearchIterative(A,target)
    left = 1
    right = length(A)
    #loop invariant: target not found, still some elements to explore between index left and index right
    while left ≤ right
        middle = fld(left + right, 2)
        if A[middle]==target
            return middle
        elseif A[middle] < target
            left = middle + 1
        else
            right = middle - 1
        end
    end
    # if the algo leaves the while loop, then the target is not in the array A
    false
end
    
binarySearchIterative(orderedA,7)
# 6

#2.3.6
"""insertion sort with binary search
1st: do a binary search algo returning the index where the key should be inserted
2nd: do insertion sort algo using the previous info
"""
#assume A is sorted, due to the loop invariant property of insertion sort
function binarySearchIndex(A,key)
    left = 1
    right = length(A)
    while right ≥ left
        # search for the correct position of the key
        middle = fld(right+left, 2)
        if A[middle] ≥ key
            right = middle -1
        else
            left = middle + 1
        end
    end
    left # position of the key in the sorted array made of A ∪ {key}
end

Abinary = map(x->x*2,1:6)
αBin = 10
posBin = binarySearchIndex(Abinary,αBin)
#[Abinary[1:posBin-1];α;Abinary[posBin:end]]
    
function insertionSortWithBinarySearch(array)
    for j in 2:length(array)
        #loop invariant: insert array[j] into the sorted sequence array[1:j-1]
        key = array[j]
        B = array[1:j-1]
        position = binarySearchIndex(B,key)
        # array[1:position-1] unchanged
        # array[position+1:j] = B[position:j-1]
        # array[position] = key
        array[position+1:j] = B[position:j-1]
        array[position] = key
    end
    array
end

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
"""2-element subset sum problem"""
function twoSum(A, target)
    function q(i,j,x)
        if j==0 && x==0
            println("last element taken: $(i+1)")
            return true
        elseif i==0 || j==0 && x!=0  #no more element to test
            return false
        else
            q(i-1,j,x) || q(i-1,j-1, x - A[i])
        end
    end
    q(length(A),2,target)
end

for i in 1:20
    println("i:$i ", twoSum([1,2,4,6,8,10],i))
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
last element taken: 5
i:18 true
i:19 false
i:20 false 
=#

#b.
function naivePolynomial(A,x)
    y = 0
    for i in 1:length(A)
        y += A[i]*x^(i-1)
    end
    y
end

function HornerPolynomial(A,x)
    y = 0
    for i in reverse(1:length(A))
        #loop invariant: at the end of an iteration i, the polynomial is:
        # sum_{j=i}^{n} a_j* x^(j-i)
        # at the beginning of an iteration i, it is:
        # sum_{j=i+1}^{n} a_j* x^(j-i-1)
        y = A[i] + x*y 
    end
    y
end

#@time HornerPolynomial(1:1000000,12345) # 0.000000 seconds
#@time naivePolynomial(1:1000000,12345)  # 0.048531 seconds
