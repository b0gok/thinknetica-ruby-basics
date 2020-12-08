# frozen_string_literal: true

# Маршрут
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    @stations << station
  end

  def remove_station(station)
    @stations.delete(station)
  end

  def stations_list
    stations.each { |station| puts station.name }
  end
end
