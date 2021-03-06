# frozen_string_literal: true

# Поезд
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
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
  attr_reader :number, :type, :wagons_count

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
    @current_station = route.first_station
    @current_station.add_train(self)
  end

  def current_station_index
    stations = @route.stations_list
    stations.index(@current_station)
  end

  def move_forward
    return unless @current_station == @route.last_station

    @current_station.remove_train(self)
    @current_station = stations[current_station_index + 1]
    @current_station.add_train(self)
  end

  def move_back
    return unless @current_station == @route.first_station

    @current_station.remove_train(self)
    @current_station = stations[current_station_index - 1]
    @current_station.add_train(self)
  end
end
