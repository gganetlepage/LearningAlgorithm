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


function mergeSort(A,p,r)
    if p<r
        q = fld((p+r),2)
        mergeSort(A,p,q)
        mergeSort(A,q+1,r)
        merge(A,p,q,r)
    end
end


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