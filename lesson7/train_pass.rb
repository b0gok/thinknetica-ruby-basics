# frozen_string_literal: true

require_relative 'train.rb'
require_relative 'wagon_pass.rb'

# Пассажирский поезд
class TrainPass < Train
  attr_reader :taken_seats, :free_seats

  def initialize(number, seats)
    super(number)
    @seats = seats
    @taken_seats = 0
    @free_seats = seats
  end

  def take_seat
    return if @free_seats.zero?

    @taken_seats += 1
    @free_seats -= 1
  end

  protected

  # Предполагает переопределение
  def can_add_wagon?(wagon)
    wagon.is_a? WagonPass
  end
end
