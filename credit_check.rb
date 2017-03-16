class CreditCheck
  def check(card_number)
    numbers = clean_data(card_number)
    if numbers.length == 15
      #need to make a check digit
      numbers = add_check_digit(numbers)
    elsif numbers.length != 16
      puts "Number is invalid"
      return
    end
    
    numbers = numbers.reverse #reverse so that we can start from the 'right'
    doubled_nums = double_array(numbers)
    return validate(doubled_nums)
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
    doubled_nums = []
    array.each_with_index {|num, index|
      if index % 2 == 1 #double digits
        num = num * 2
        if num > 9
          remainder = num % 10
          doubled_nums << (1 + remainder)
        else
          doubled_nums << num
        end
      else
        doubled_nums << num
      end
    }
    return doubled_nums
  end

  def validate(numbers)
    #sum array and check to equal to modulo 10 = 0
    sum = numbers.reduce(:+)
    if sum % 10 == 0
      puts "The number is valid!"
      return true
    else
      puts "The number is invalid!"
      return false
    end
  end
  
  def add_check_digit(numbers)
    numbers = numbers * 10 #adds zero at end to fix length at 16 digits
    doubled_numbers = double_array(numbers)
    sum = doubled_numbers.reduce(:+)
    if sum % 10 == 0
      return numbers
    else
      check_digit = sum % 10
      numbers.pop()
      numbers.push(check_digit)
    end
    return numbers
  end
  
end

checker = CreditCheck.new
checker.check(4929735477250543)
checker.check(6011797668867828) #valid
checker.check(4024007136512380) #valid
checker.check(5541808923795240) #valid
checker.check(6011797668868728) #invalid
checker.check(4024007106512380) #invalid
checker.check(5541801923795240) #invalid

puts "Testing American Express numbers"
checker.check(342804633855673) #valid
checker.check(342801633855673) #invalid