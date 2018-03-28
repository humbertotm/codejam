# This shit is not working yet. Infinite loop. 

# This shall be taken as input from the command line
# The array will have to be built
$cakes = [3, 6, 9]
$minutes = 0

def eatCakes()
  $cakes.each do |cake|
    cake -= 1
  end

  $minutes += 1

  # Filter out 0 from array
  $cakes = $cakes.select do |cake|
    cake > 0
  end

  print "Cakes: #{$cakes} Minutes: #{$minutes}"
end

while $cakes.count > 0
  maxValue = $cakes.max

  # Check if maxValue is duplicated
  duplicatedCakes = 0
  $cakes.each { |cake|
    if cake == maxValue
      duplicatedCakes += 1
      if duplicatedCakes >= 2
        eatCakes()
        next
      end
    end
  }

  if duplicatedCakes < 2
    # First, we verify if it is divisible by 2
    if maxValue % 2 == 0
      maxIndex = $cakes.index(maxValue)
      $cakes[maxIndex] = maxValue / 2
      $cakes << maxValue / 2
      $minutes += 1
      print "Cakes: #{$cakes} Minutes: #{$minutes}"
    else
      eatCakes()
    end
  end
end
