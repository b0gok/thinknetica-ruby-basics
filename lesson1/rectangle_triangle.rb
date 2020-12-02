# frozen_string_literal: true

# Прямоугольный треугольник

puts 'Введите первую сторону треугольника'
a = gets.chomp.to_f

puts 'Введите вторую сторону треугольника'
b = gets.chomp.to_f

puts 'Введите третью сторону треугольника'
c = gets.chomp.to_f

if a == b && b == c
  puts 'Треугольник равносторонний и равнобедренный'
else
  sides = [a, b, c]
  hypotenuse = sides.max
  sides.delete(hypotenuse)
  catheters = sides

  if hypotenuse**2 == (catheters.first**2 + catheters.last**2)
    puts 'Треугольник прямоугольный'
  else
    puts 'Обычный треугольник'
  end
end
