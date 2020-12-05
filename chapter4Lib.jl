# 4.1 Maximum-subarray problem

function brute_force(A::Array)
    n = length(A)
    n == 0 && return "empty array"
    max = A[1]
    index_left = 1
    index_right = 1
    for i in 1:n
        sum = 0
        for j in i:n
            sum += A[j]
            if sum > max
                max = sum
                index_left = i
                index_right = j
            end
        end
    end
    max, index_left, index_right
end

function find_max_crossing_subarray(A::Array, low::Int, mid::Int, high::Int)
    left_sum = - typemax(Int) ÷ 2
    sum = 0
    max_left = -1
    for i in reverse(low:mid)
        sum += A[i]
        if sum > left_sum
            left_sum = sum
            max_left = i
        end
    end
    right_sum = - typemax(Int) ÷ 2
    sum = 0
    max_right = -1
    for j in mid+1:high
        sum += A[j]
        if sum > right_sum
            right_sum = sum
            max_right = j
        end
    end
    max_left, max_right, left_sum + right_sum
end

function find_max_subarray(A::Array, low::Int, high::Int)
    high==low && return low, high, A[low]
    mid = (low + high) ÷ 2
    left_low, left_high, left_sum = find_max_subarray(A, low, mid)
    right_low, right_high, right_sum = find_max_subarray(A,mid+1, high)
    cross_low, cross_high, cross_sum = find_max_crossing_subarray(A, low, mid, high)
    if left_sum > right_sum && left_sum > cross_sum
        return left_low, left_high, left_sum
    elseif right_sum > left_sum && right_sum > cross_sum
        return right_low, right_high, right_sum
    else
        return cross_low, cross_high, cross_sum
    end
end

