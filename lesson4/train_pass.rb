# frozen_string_literal: true

require_relative 'train.rb'

# Пассажирский поезд
class TrainPass < Train
  def initialize(number)
    super(number, 'pass')
  end
end
