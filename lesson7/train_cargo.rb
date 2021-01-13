# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_cargo.rb'

# Грузовой поезд
class TrainCargo < Train
  attr_reader :taken_capacity, :free_capacity

  def initialize(number, capacity)
    super(number)
    @capacity = capacity
    @taken_capacity = 0
    @free_capacity = capacity
  end

  def take_capacity(capacity)
    return if capacity > @free_capacity

    @taken_capacity += capacity
    @free_capacity -= capacity
  end

  protected

  # Предполагает переопределение
  def can_add_wagon?(wagon)
    wagon.is_a? WagonCargo
  end
end
