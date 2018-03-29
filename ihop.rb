# We shall place the recursive solution to the problem
# right here

$pancakes_on_diners_dish = [3, 6, 9, 500, 500]
$accumulated_special_minutes = 0
$minutes_spent_eating = 0

# $current_max_value = $pancakes_on_diners_dish.max

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
  print "Dividing max value in #{$pancakes_on_diners_dish}\n"

  max_value = $pancakes_on_diners_dish.max
  index_of_max = $pancakes_on_diners_dish.index(max_value)

  new_value = max_value / 2
  $pancakes_on_diners_dish[index_of_max] = new_value
  $pancakes_on_diners_dish << new_value

  print "New divided array: #{$pancakes_on_diners_dish}\n"
end

def new_max_value(old_max)
  unique_values = $pancakes_on_diners_dish.uniq
  if unique_values.length == 1
    return old_max / 2
  end

  second_largest = unique_values.sort[-2]
  if old_max / 2 > second_largest
    return old_max / 2
  else
     return second_largest
  end
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
    return find_minimum_time_to_finish($pancakes_on_diners_dish)
    # return
  end

  if max_value % 2 != 0 && max_value < 4
    eat_pancakes()
    return find_minimum_time_to_finish($pancakes_on_diners_dish)
  end

  if max_value % 2 == 0
    # new_max_value = max_value / 2 | next highest value in arr
    new_max = new_max_value(max_value)
    # number of times maxValue is repeated
    n = pancakes_on_dishes.count(max_value)
    resulting_time_if_divided = n + $accumulated_special_minutes + new_max + $minutes_spent_eating

    print "current it time: #{$current_iteration_time_to_finish} vs #{resulting_time_if_divided}\n"

    # problem here
    if resulting_time_if_divided < $current_iteration_time_to_finish
      # While max value del array sea igual al max max value
      # anterior, cosntruct new array
      construct_new_array()
      while $pancakes_on_diners_dish.max == max_value
        construct_new_array()
      end

      $current_iteration_time_to_finish = resulting_time_if_divided
      $accumulated_special_minutes = $accumulated_special_minutes + n
      # construct_new_array()
      print "Going for another iteration with #{$pancakes_on_diners_dish}\n"
      return find_minimum_time_to_finish($pancakes_on_diners_dish)
    else
      #total_time = $accumulated_special_minutes + $minutes_spent_eating + max_value
      #print "Time: #{total_time}\n"
      eat_pancakes()
      return find_minimum_time_to_finish($pancakes_on_diners_dish)
    end
  end
end

find_minimum_time_to_finish($pancakes_on_diners_dish)