# frozen_string_literal: true

# Сумма покупок
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

cart = {}

loop do
  puts 'Введите название товара. Если вы закончили, введите стоп вместо названия.'
  name = gets.chomp
  break if name == 'стоп'

  puts 'Введите цену за единицу'
  price = gets.chomp.to_f
  puts 'Введите кол-во'
  amount = gets.chomp.to_f

  cart[name] = { price: price, amount: amount, total: price * amount }
end

total = 0

cart.each do |name, props|
  puts "#{name}: #{props[:amount]} x #{props[:price]} = #{props[:total]}"
  total += props[:total]
end

puts "Итого: #{total}"
