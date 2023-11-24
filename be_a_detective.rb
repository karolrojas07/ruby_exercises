# frozen_string_literal: true

# Given a PIN, find all the possible convinations variating each digit for its adjacent digits
# (horizontally or vertically, but not diagonally). E.g. instead of the 1, it could also be the 2 or 4.

# The output should contain all possible PINs ordered in ascending value.

# The keypad has the following layout:
# -----------------
# | 1 | | 2 | | 3 |
# -----------------
# | 4 | | 5 | | 6 |
# -----------------
# | 7 | | 8 | | 9 |
# -----------------
#       | 0 |
# -----------------

# Input: PIN in string format
# Output: Array of strings (the observed pint itself shoul be included in the array)
# Example:
#   * "8"  => ["0", "5", "7", "8", "9"]
#   * "11" => ["11", "12", "14", "21", "22", "24", "41", "42", "44"]

ADJACENT_DIGIT = {
  '1' => %w[1 2 4],
  '2' => %w[1 2 3 5],
  '3' => %w[2 3 6],
  '4' => %w[1 4 5 7],
  '5' => %w[2 4 5 6 8],
  '6' => %w[3 5 6 9],
  '7' => %w[4 7 8],
  '8' => %w[0 5 7 8 9],
  '9' => %w[6 8 9]
}.freeze

def generate_combinations(pin)
  pin.chars.map { |digit| ADJACENT_DIGIT[digit] }
end

def cartesian_product(arrays)
  arrays.reduce { |acc, array| acc.product(array) }.map(&:flatten)
end

def solution(pin)
  # You must complete the logic for the function that is provided
  # before compiling or submitting to avoid an error.
  # Write your code here
  return ADJACENT_DIGIT[pin] if pin.length == 1

  combinations = generate_combinations(pin)
  cartesian_product(combinations).map(&:join).sort
end

pin = gets.chomp

out_ = solution pin
puts out_
