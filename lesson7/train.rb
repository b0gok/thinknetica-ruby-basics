# frozen_string_literal: true

require_relative 'wagon.rb'
require_relative 'company.rb'
require_relative 'instance_counter.rb'
require_relative 'validation.rb'

# Поезд
class Train
  include Company
  include InstanceCounter
  include Validation

  attr_accessor :speed, :wagons
  attr_reader :number

  # три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет)
  # и еще 2 буквы или цифры после дефиса.
  NUMBER_FORMAT = /^([а-я]|\d){3}-?([а-я]|\d){2}$/i

  # В классе Train создать метод класса find, который принимает номер поезда (указанный при его создании)
  # и возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.
  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    validate!
    @@trains[number] = self
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    @wagons << wagon if can_add_wagon?(wagon)
    wagons
  end

  def remove_wagon
    @wagons.pop
    wagons
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

  def wagons_count
    wagons.size
  end

  def each_wagon
    wagons.each_with_index { |wagon, index| yield(wagon, index) if block_given? }
  end

  protected

  # Предполагает переопределение
  def can_add_wagon?(*)
    true
  end

  def validate!
    raise "Number can't be nil" if number.nil?
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
  end

  private

  # В целях инкапсуляции, не предполагает переопределения
  def current_station_index
    stations = @route.stations_list
    stations.index(@current_station)
  end
end
