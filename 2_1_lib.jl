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