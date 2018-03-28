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
