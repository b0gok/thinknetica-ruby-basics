# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_pass.rb'

# Пассажирский поезд
class TrainPass < Train
  protected

  # Предполагает переопределение
  def can_add_wagon?(wagon)
    wagon.is_a? WagonPass
  end
end
