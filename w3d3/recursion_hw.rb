def sum_to(n)
    if n == 0
        return 0
    else
        n + sum_to(n-1)
    end
end

def add_numbers(array)
    if array.empty?
        return 0
    else
        array[0] + add_numbers(array[1..-1])
    end
end

def gamma_fnc(n)
    if n == 1
        return 1
    else
        (n-1) * gamma_fnc(n-1)
    end
end

def ice_cream_shop(array, string)
    if array.empty? 
        return false
    elsif array[0] == string
        return true
    else
        ice_cream_shop(array[1..-1], string)
    end
end

def reverse(string)
    if string == ""
        return ""
    else
        string[-1] + reverse(string[0..-2])
    end
end