# frozen_string_literal: true

# Поезд
# указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  attr_accessor :speed
  attr_reader :type, :wagons_count

  def initialize(number, type, wagons_count)
    @number = number
    @type = type
    @wagons_count = wagons_count
    stop
  end

  def stop
    self.speed = 0
  end

  def add_wagons
    @wagons_count += 1 unless @speed.zero?
  end

  def remove_wagons
    @wagons_count -= 1 unless @speed.zero?
  end

  def route=(route)
    @route = route
    route.first.add_train(self)
  end
end
