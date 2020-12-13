# frozen_string_literal: true

# Железная дорога
class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def menu
    puts 'Введите 1, если хотите создать станцию, поезд, вагон или маршрут'
    puts 'Введите 2, если хотите произвести операцию с созданными объектами'
    puts 'Введите 3, если хотите вывести текущие данные об объектах'
    puts 'Введите 0 или стоп для выхода из меню'
    choise = gets.chomp
  end
end
