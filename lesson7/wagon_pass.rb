# frozen_string_literal: true

require_relative 'wagon.rb'

# Пассажирский вагон
class WagonPass < Wagon
  attr_reader :taken_seats

  def initialize(number, seats)
    super(number)
    @seats = seats
    @taken_seats = 0
  end

  def take_seat
    return if free_seats.zero?

    @taken_seats += 1
  end

  def free_seats
    @seats - taken_seats
  end
end
