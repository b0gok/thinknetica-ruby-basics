# frozen_string_literal: true

require_relative 'train'
require_relative 'wagon_cargo'

# Cargo train
class TrainCargo < Train
  protected

  def can_add_wagon?(wagon)
    wagon.is_a? WagonCargo
  end
end
