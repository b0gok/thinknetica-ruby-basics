# frozen_string_literal: true

require_relative 'wagon.rb'

# Поезд
class Train
  attr_accessor :speed
  attr_reader :number

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    @wagons << wagon if can_add_wagon?(wagon)
    @wagons
  end

  def remove_wagon
    @wagons.pop
    @wagons
  end

  def route=(route)
    @route = route
    @current_station = route.first_station
    @current_station.add_train(self)
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

  protected

  # Предполагает переопределение
  def can_add_wagon?(*)
    true
  end

  private

  # В целях инкапсуляции, не предполагает переопределения
  def current_station_index
    stations = @route.stations_list
    stations.index(@current_station)
  end
end
