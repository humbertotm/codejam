# We shall place the recursive solution to the problem
# right here

$pancakes_on_diners_dish = [3, 6, 9]
$accumulated_special_minutes = 0
$minutes_spent_eating = 0

$current_iteration_time_to_finish = $pancakes_on_diners_dish.max

print "Inital array: #{$pancakes_on_diners_dish}/n Time to finish: #{$current_iteration_time_to_finish}\n"

def eat_pancakes()
  $pancakes_on_diners_dish.each_with_index do |element, index|
    $pancakes_on_diners_dish[index] = element - 1
  end

  $minutes_spent_eating = $minutes_spent_eating + 1

  # Filter out 0s from array
  $pancakes_on_diners_dish = $pancakes_on_diners_dish.select do |element|
    element > 0
  end

  print "Cakes: #{$pancakes_on_diners_dish} Minutes spent eating: #{$minutes_spent_eating}\n"
end

def construct_new_array()
  # Take max value and divide it by two
  # n = number of times maxValue is repeated
  # add n elements equal to maxValue divided by two
  print "Dividing max value in #{$pancakes_on_diners_dish}\n"

  max_value = $pancakes_on_diners_dish.max
  n = $pancakes_on_diners_dish.count(max_value)
  index_of_max = $pancakes_on_diners_dish.index(max_value)

  new_value = max_value / 2
  $pancakes_on_diners_dish[index_of_max] = new_value

  counter = 1
  loop do
    if counter <= n
      $pancakes_on_diners_dish << new_value
      counter = counter + 1
    else
      break
    end
  end

  print "New divided array: #{$pancakes_on_diners_dish}\n"
end

def find_minimum_time_to_finish(pancakes_on_dishes)
  if pancakes_on_dishes.length == 0
    total_time = $minutes_spent_eating + $accumulated_special_minutes
    print "Time to finish: #{total_time}\n"
    return
  end


  max_value = pancakes_on_dishes.max

  if max_value % 2 != 0 && max_value > 4
    eat_pancakes()
    find_minimum_time_to_finish($pancakes_on_diners_dish)
    return
  end

  # number of times maxValue is repeated
  n = pancakes_on_dishes.count(max_value)
  resulting_time_if_divided = n + $accumulated_special_minutes + max_value / 2 + $minutes_spent_eating

  if resulting_time_if_divided < $current_iteration_time_to_finish
    $current_iteration_time_to_finish = resulting_time_if_divided
    $accumulated_special_minutes = $accumulated_special_minutes + n
    construct_new_array()
    print "Going for another iteration with #{$pancakes_on_diners_dish}\n"
    find_minimum_time_to_finish($pancakes_on_diners_dish)
  else
    #total_time = $accumulated_special_minutes + $minutes_spent_eating + max_value
    #print "Time: #{total_time}\n"
    eat_pancakes()
    find_minimum_time_to_finish($pancakes_on_diners_dish)
  end
end

find_minimum_time_to_finish($pancakes_on_diners_dish)
