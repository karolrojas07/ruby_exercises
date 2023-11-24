# frozen_string_literal: true

#   Transform a duration (given as a number of secods) to readable text
#   The function must accept a non-negative integer.
#   If it is zero, it just returns "now".
#   Otherwise, the duration is expressed as a combination of years, days,
#   hours, minutes and seconds
#   A year is 365 days and a day is 24 hours.
#   * The unit of time is used in plural if the integer is greater than 1
#   * The components are separated by a comma and a space (", "). Except
#   the last component, which is separated by " and ".
#   * A component will not appear at all if its value happens to be zero.
#   * A unit of time must be used "as much as possible". It means that the
#   function should not return 61 seconds, but 1 minute and 1 second instead.
#
#   Explanation:
#   - For seconds = 62, print "1 minute and 2 seconds"
#   - For seconds = 3662, print "1 hour, 1 minute and 2 seconds"

TIME = {
  'minute' => 60,
  'hour' => 3600,
  'day' => 86_400,
  'year' => 31_536_000
}.freeze

def calculate_time(seconds)
  years = seconds / TIME['year']
  days = (seconds % TIME['year']) / TIME['day']
  hours = (seconds % TIME['day']) / TIME['hour']
  minutes = (seconds % TIME['hour']) / TIME['minute']
  new_seconds = seconds % TIME['minute']

  [years, days, hours, minutes, new_seconds]
end

def build_message(years, days, hours, minutes, new_seconds)
  response = ''
  response.concat("#{years} #{years > 1 ? 'years' : 'year'}") unless years.zero?
  response.concat(", #{days} #{days > 1 ? 'days' : 'day'}") unless days.zero?
  response.concat(", #{hours} #{hours > 1 ? 'hours' : 'hour'}") unless hours.zero?
  response.concat(", #{minutes} #{minutes > 1 ? 'minutes' : 'minute'}") unless minutes.zero?
  response.concat(" and #{new_seconds} #{new_seconds > 1 ? 'seconds' : 'second'}") unless new_seconds.zero?
  response
end

def solution(seconds)
  return 'now' if seconds.zero?

  years, days, hours, minutes, new_seconds = calculate_time(seconds)
  build_message(years, days, hours, minutes, new_seconds)
end

seconds = gets.to_i

out_ = solution seconds
puts "out_: #{out_}"
