# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

array = [0, 1]
loop do
  new_value = array[-1] + array[-2]
  break if new_value > 100

  array.push(new_value)
end

puts array
