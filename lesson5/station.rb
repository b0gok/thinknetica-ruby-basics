# frozen_string_literal: true

# Станция
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
class Station
  attr_reader :name, :trains

  @@stations = []

  # В классе Station (жд станция) создать метод класса all, который возвращает все станции (объекты), созданные на данный момент
  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
  end

  def add_train(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train.number }
  end

  def trains_count_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def remove_train(train)
    @trains.delete(train)
  end
end
