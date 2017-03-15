#card_number = "4929735477250543"
#Valid: 5541808923795240, 4024007136512380, 6011797668867828
#Invalid: 5541801923795240, 4024007106512380, 6011797668868728

#valid = false

# Your Luhn Algorithm Here

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"

class CreditCheck
  def check(card_number)
    num_array = clean_data(card_number)

    if num_array.length != 16
      puts "Number is invalid"
      return
    end
    
    num_array = num_array.reverse #reverse so that we can start from the 'right'
    doubled_array = double_array(num_array)
    validity = validate(doubled_array)
    return validity
  end
  
  def clean_data(number)
    if number.class == Fixnum
      return number.to_s.chars.map {|num| num.to_i}
    elsif number.class == String
      return number.chars.map {|num| num.to_i}
    else
      puts "Number is invalid."
    end
  end

  def double_array(array)
    doubled_array = []
    array.each_with_index {|num, index|
      if index % 2 == 0 #double digits
        num = num * 2
        if num > 9
          remainder = num % 10
          doubled_array << (1 + remainder)
        else
          doubled_array << num
        end
      else
        doubled_array << num
      end
    }
    return doubled_array
  end

  def validate(num_array)
    #sum array and check to equal 70
    sum = num_array.reduce(:+)
  
    if sum == 70
      return true
    else
      return false
    end
  end
  
end
