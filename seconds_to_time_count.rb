=begin
  Transform a duration (given as a number of secods) to readable text
  The function must accept a non-negative integer.
  If it is zero, it just returns "now".
  Otherwise, the duration is expressed as a combination of years, days,
  hours, minutes and seconds
  A year is 365 days and a day is 24 hours.
  * The unit of time is used in plural if the integer is greater than 1
  * The components are separated by a comma and a space (", "). Except 
  the last component, which is separated by " and ".
  * A component will not appear at all if its value happens to be zero.
  * A unit of time must be used "as much as possible". It means that the
  function should not return 61 seconds, but 1 minute and 1 second instead.

  Explanation:
  - For seconds = 62, print "1 minute and 2 seconds"
  - For seconds = 3662, print "1 hour, 1 minute and 2 seconds"
=end