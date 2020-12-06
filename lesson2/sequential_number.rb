# frozen_string_literal: true

# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: www.adm.yar.ru

# Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка,
# это не високосный год. Однако, если он делится без остатка на 400, это високосный год.
# Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
def leap_year?(year)
  (year % 400).zero? || ((year % 4).zero? && year % 100 != 0)
end

def days_in_february(year)
  leap_year?(year) ? 29 : 28
end

def months_by_year(year)
  [31, days_in_february(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
end

def calc_total(day, month, year)
  return day if month == 1

  months_by_year(year).first(month - 1).sum + day
end

puts 'Введите день'
day = gets.chomp.to_i
puts 'Введите месяц'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i

puts calc_total(day, month, year)
