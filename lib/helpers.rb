
#compares two date strings
def is_in_past?(date)
    date_num = date.split('-').join('').to_i
    today = Date.today.to_s.split('-').join('').to_i
    if date_num < today
        return true
    else
        return false
    end
end

#compares two date strings
def is_in_future?(date)
    date_num = date.split('-').join('').to_i
    today = Date.today.to_s.split('-').join('').to_i
    if date_num > today
        return true
    else
        return false
    end
end


