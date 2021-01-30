# frozen_string_literal: true

require_relative 'wagon'

# Passenger wagon
class WagonPass < Wagon
  def take_capacity
    super(1)
  end
end
