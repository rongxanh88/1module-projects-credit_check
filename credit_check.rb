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
    number array = clean_data(card_number)

    
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
  
end
