# frozen_string_literal: true

# Квадратное уравнение

puts 'Введите коэффициент a'
a = gets.chomp.to_f
puts 'Введите коэффициент b'
b = gets.chomp.to_f
puts 'Введите коэффициент c'
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d.negative?
  puts 'Корней нет'
elsif d.zero?
  puts "Дискриминант: #{d}, корень: #{-b / (2 * a)}"
else
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "Дискриминант: #{d}, корни: #{x1}, #{x2}"
end
