# frozen_string_literal: true

#   Returns the sum of all multiples of any of two numbers that are less than a limit number
#   Example:
#   multiple_1 = 3, multiple_2 = 5, limit = 10
#   Then, the sum is 23, since the multiples of both numbers are 3, 5, 6 and 9

#  Determines whether a number is multiple or not of another
def multiple?(number, multiple_num)
  (number % multiple_num).zero?
end

def sum_multiples(multiple1, multiple2, limit)
  multiples = []
  limit.times do |number|
    multiples << number if multiple?(number, multiple1) || multiple?(number, multiple2)
  end
  multiples.sum
end

MULTIPLE_ONE = 3
MULTIPLE_TWO = 5
LIMIT = 1000

sum_result = sum_multiples(MULTIPLE_ONE, MULTIPLE_TWO, LIMIT)
puts "The sum of all the multiples of #{MULTIPLE_ONE} or #{MULTIPLE_TWO} below #{LIMIT} is #{sum_result}"
