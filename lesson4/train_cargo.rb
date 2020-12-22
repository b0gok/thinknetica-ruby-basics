# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_cargo.rb'

# Грузовой поезд
class TrainCargo < Train
  protected

  # Предполагает переопределение
  def can_add_wagon?(wagon)
    wagon.is_a? WagonCargo
  end
end
