# This shit is not working yet. Infinite loop.

# This shall be taken as input from the command line
# The array will have to be built
$pancakes_on_diners_dish = [3, 6, 9, 500, 500]
$minutes = 0

def eat_pancakes()
  $pancakes_on_diners_dish.each_with_index do |element, index|
    $pancakes_on_diners_dish[index] = element - 1
  end

  $minutes += 1

  # Filter out 0 from array
  $pancakes_on_diners_dish = $pancakes_on_diners_dish.select do |element|
    element > 0
  end

  print "Cakes: #{$pancakes_on_diners_dish} Minutes: #{$minutes}\n"
end

while $pancakes_on_diners_dish.count > 0
  maxValue = $pancakes_on_diners_dish.max

  # Check if maxValue is duplicated
  maxValueCount = 0
  $pancakes_on_diners_dish.each { |element|
    if element == maxValue
      maxValueCount += 1
      if maxValueCount >= 2
        eat_pancakes()
        next
      end
    end
  }

  if maxValueCount < 2
    # First, we verify if it is divisible by 2
    if maxValue % 2 == 0
      maxIndex = $pancakes_on_diners_dish.index(maxValue)
      $pancakes_on_diners_dish[maxIndex] = maxValue / 2
      $pancakes_on_diners_dish << maxValue / 2
      $minutes += 1
      print "Cakes: #{$pancakes_on_diners_dish} Minutes: #{$minutes}\n"
    else
      eat_pancakes()
    end
  end
end
