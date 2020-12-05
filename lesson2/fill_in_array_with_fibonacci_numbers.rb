# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

array = [0, 1]
index = 1
while index < 99
  index += 1
  new_value = array[index - 1] + array[index - 2]
  array.push(new_value)
end

puts array
puts "Array length: #{array.length}"
