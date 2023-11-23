=begin
  A restaurant has launched an app for their food delivery. N reviews about various of their menu items 
  have been submitted a rating out of 5 (1 being worst and 5 being best) The manager wants to know the 
  most loved dish in the restaurant.
  Find out the dish with the highest average rating and in case there are more than one with the same average
  return the one with the smallest ID value
  Input:
    * ratings: (Array with Arrays with 2 dimention [:id, :rate]) Represents the reviews of each dish
  Output:
    Print a single integer, representing the ID of the highest-rated dish
  Explanation:
    Given
    ratings = [[512, 3], [123, 3], [987, 4], [123, 5]]
    Output: 123
=end

def food_ratings (ratings)
  dish_ratings = Hash.new { |hash, key| hash[key] = [] }

  # Organize ratings by dish ID
  ratings.each { |id, rate| dish_ratings[id] << rate }

  # Calculate average ratings for each dish
  average_ratings = dish_ratings.transform_values { |rates| rates.sum.to_f / rates.length }

  # Find the dish with the highest average rating and the smallest ID value in case of a tie
  max_average = average_ratings.values.max
  highest_rated_dishes = average_ratings.select { |_, avg| avg == max_average }
  dish_with_smallest_id = highest_rated_dishes.min_by { |id, _| id }
end

ratings = [[512, 3], [123, 3], [987, 4], [123, 5]]

out_ = food_ratings ratings
puts out_