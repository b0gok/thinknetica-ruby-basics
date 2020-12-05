# frozen_string_literal: true

# Заполнить массив числами от 10 до 100 с шагом 5

array = []
for el in 10..100
  array.push(el) if (el % 5).zero?
end

puts array
