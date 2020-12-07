# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

array = [0, 1]
index = 1
loop do
  index += 1
  new_value = array[index - 1] + array[index - 2]
  break if new_value > 100

  array.push(new_value)
end

puts array
