# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_pass.rb'

# Пассажирский поезд
class TrainPass < Train
  def add_wagon
    @wagons << WagonPass.new
  end
end
