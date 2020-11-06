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
