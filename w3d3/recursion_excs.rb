def range(start, ending)
    return [] if ending <= start
    [start] + range(start+1, ending)
end

def exp1(base, power)
    return 1 if power == 0
    return base if power == 1
    base * exp1(base, power-1)

#   (2,3) => 2 * exp1(2, 2) => 8
#   (2,2) => 2 * exp1(2, 1) => 4


    # (2,3) => 2 * exp1(2, 2) => 2 * 2 * exp1(2,1) => 2 * 2 * 2 = 2**3
end

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1
    
    if power.even?
        exp1(exp2(base, power / 2), 2)
    else
        base * exp1((exp2(base, (power-1)/2)), 2)
    end
end
        


# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# recursion 2 - exp(2, 4)
    # exp(2,4) => exp(2, 2) ** 2 => exp(2,1) ** 2 ** 2 => 2 ** 2 ** 2
    # exp(2,4) == exp(2,exp(2,2))


class Array
    def deep_dup
        new_arr = []        
        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.deep_dup 
            else
                new_arr << el
            end
        end
        new_arr
    end
    # [1, [2], 3]
    # 
    # def shallow_dup
    #     new_arr = []
    #     self.each {|el| new_arr << el}
    #     new_arr
    # end]
end

def iterative_fib(n)
    fibs = []
    return fibs if n == 0
    return fibs << 1 if n == 1
    return fibs = [1, 1] if n == 2
    fibs = [1,1]
    (3..n).each do |el|
        el = fibs[-1] + fibs[-2]
        fibs << el
    end
    
    fibs
end

def recursive_fib(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    arr = recursive_fib(n-1)
    last_num = arr[-1] + arr[-2] # rf(4) => rf(3) + rf(2) => 
                                                               #         (rf(2) + rf(1)) + (rf(1) + rf(0))
    arr << last_num                             #         [1, 1] + [1]
                                                               #          [1, 1, 2]
end

def binary_search(array, target)
    return 0 if array.empty?
    counter = 0
    middle = array.length/2     
    m = array[middle]           
    l = array[0...middle]
    r = array[middle+1..-1]
    if m == target
        counter += l.length 
    elsif m > target
        counter += binary_search(l, target)
    else
        counter += l.length + 1 + binary_search(r, target)
    end
    
    counter
end

# [1,2,3,4,5,6,7,8,9,10]

# 1st round => counter = 5 + binary_search(r, target) 
# 2nd round => [7, 8, 9, 10] => counter = 

#[1,2,3] target = 1

def merge_sort(array)
    
    middle = array.length/2-1
    left = [0..middle]
    right = [middle+1..[-1]]
    merge_sort(left) + merge_sort(right)
end

def greedy_make_change(amount, denoms)
    change = []
    denoms.each do |denom|
        if amount < denom
            next
        elsif amount % denom == 0
            (amount/denom).times {change << denom} 
            return change
        else
            (amount/denom).times {change << denom}
            change += greedy_make_change(amount%denom, denoms)
        end
    end
    change
end









