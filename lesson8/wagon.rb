# frozen_string_literal: true

require_relative 'company'

# Main Wagon
class Wagon
  include Company

  attr_reader :taken_capacity

  def initialize(capacity)
    @capacity = capacity
    @taken_capacity = 0
  end

  def take_capacity(capacity)
    return if capacity > free_capacity

    @taken_capacity += capacity
  end

  def free_capacity
    @capacity - taken_capacity
  end
end
