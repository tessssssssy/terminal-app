

#compares two date strings
def compare_dates(d1, d2)
    num_1 = d1.split('-').join('').to_i
    num_2 = d2.split('-').join('').to_i
    if num_1 > num_2
        return num_1
    else
        return num_2
    end
end

