# frozen_string_literal: true

# Идеальный вес

puts 'Как Вас зовут?'
name = gets.chomp.capitalize
puts 'Какой у Вас рост (в см)?'
height = gets.chomp.to_f
ideal_weight = (height - 110) * 1.15
if ideal_weight.negative?
  puts "#{name}, Ваш вес уже оптимальный"
else
  puts "#{name}, Ваш идеальный вес #{ideal_weight} кг"
end
