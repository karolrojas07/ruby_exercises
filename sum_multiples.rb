=begin
    Determines whether a number is multiple or not of another
=end
def is_multiple(number, multiple_num)
    number % multiple_num == 0
end

=begin
  Returns the sum of all multiples of any of two numbers that are less than a limit number
  Example:
  multiple_1 = 3, multiple_2 = 5, limit = 10
  Then, the sum is 23, since the multiples of both numbers are 3, 5, 6 and 9
=end
def sum_multiples(multiple_1, multiple_2, limit)
    multiples = []
    limit.times do |number|
        multiples << number if is_multiple(number, multiple_1) || is_multiple(number, multiple_2)
    end
    multiples.sum()
end

MULTIPLE_ONE = 3
MULTIPLE_TWO = 5
LIMIT = 1000

sum_result = sum_multiples(MULTIPLE_ONE, MULTIPLE_TWO, LIMIT)
puts "The sum of all the multiples of #{MULTIPLE_ONE} or #{MULTIPLE_TWO} below #{LIMIT} is #{sum_result}"
