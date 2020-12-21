# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_cargo.rb'

# Грузовой поезд
class TrainCargo < Train
  def add_wagon
    @wagons << WagonCargo.new
  end
end
