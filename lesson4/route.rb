# frozen_string_literal: true

# Маршрут
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @transfer_stations = []
  end

  def add_station(station)
    @transfer_stations << station
    @transfer_stations.uniq!
    @transfer_stations
  end

  def remove_station(station)
    @transfer_stations.delete(station)
    @transfer_stations
  end

  def stations_list
    [@first_station, *@transfer_stations, @last_station]
  end

  def show_stations_list
    stations_list.each_with_index { |station, index| puts "#{index} — #{station.name}" }
  end
end
