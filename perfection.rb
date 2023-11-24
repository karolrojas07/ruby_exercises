# frozen_string_literal: true

#   Determine whether a number N is equal to the sum of its proper positive divisors
#   (excluding the number itself)
#   Output:
#   Print YES, if NN is equal to the sum of its proper positive divisors else print NO
#   Explanation:
#   6 =  1 + 2 + 3, so it is perfect => print YES
#   5 != 1, so it is not perfect => print NO
#   28 = 1 + 2 + 4 + 7 + 14, so it is perfect => print YES

def find_divisor(number)
  sum = 1 # Start with 1 since every number is divisible by 1
  (2..Math.sqrt(number)).each do |divisor|
    if (number % divisor).zero?
      sum += divisor
      sum += number / divisor unless divisor == number / divisor
    end
  end
  sum
end

def determine_perfection(number)
  sum = find_divisor(number)
  puts sum == number ? 'YES' : 'NO'
end

number = gets.chomp
determine_perfection(number.to_i)
