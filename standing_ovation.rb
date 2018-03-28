# Create a class that will process the input depending on the

# Global vars and inputs
# These shall be populated by the input
$s_max = 5
$audience_string = "110011"
# Not ints yet
$chars = $audience_string.split("")
$people_to_invite = 0

# print "#{$chars}\n"

# validations
if $audience_string.length != $s_max + 1
  raise "Invalid input. Invalid length string."
end

if $audience_string[-1].to_i == 0
  raise "Invalid input. String cannot end in 0."
end

=begin
this one is to avoid repeating myself
def calculate_standing_people(index)
  counter = 0
  people_standing = 0

  loop do

  end
end
=end

def enough_people_standing(index)
  counter = 0
  people_standing = 0

  if index == 0
    return true
  end

  loop do
    if counter < index
      people_standing = people_standing + $chars[counter].to_i
      counter = counter + 1
    else
      return people_standing >= index
    end
  end
end

def calculate_people_to_invite(index)
  counter = 0
  people_standing = 0
  loop do
    if counter < index
      people_standing = people_standing + $chars[counter].to_i
      counter = counter + 1
      # print "counter: #{counter} people standing: #{people_standing}\n"
    else
      break
    end
  end

  # print "We are outside the loop.\n"
  people_to_invite = index - (people_standing + $people_to_invite)
  return people_to_invite
end



$chars.each_with_index do |char, index|
  # print "#{index} #{char}\n"
  if char.to_i == 0
    # print "Index #{index} with 0\n"
    next
  end

  if enough_people_standing(index) == true
    # print "Enough people standing for shyness level #{index}\n"
    next
  else
    # print "Not enough people standing for shyness level #{index}\n"
    additional_people_to_invite = calculate_people_to_invite(index)
    # print "#{additional_people_to_invite}\n"
    $people_to_invite = $people_to_invite + additional_people_to_invite
  end
end

print "Persons to be invited: #{$people_to_invite}\n"





=begin

inputs and global vars
Smax
string describing audience
people_to_invite

def there_is_enough_people_standing
  Sum all the digits of the string up to the current index
  if sum < currentIndex
    return false
  else
    return true
end

def calculate_additional_people_needed
  people_needed = currentIndex - sum of previous digits
  return people_needed
end

Lets begin with input validations
1. String not ending in 0
2. String being Smax + 1

for loop to iterate over string
for each element in string
  if string[i] == 0
    next

  if(there_is_enough_people_standing)
    next
  else
    how_many_additional_persons_do_we_need
    next

print people_to_invite
=end
