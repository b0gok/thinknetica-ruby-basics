# frozen_string_literal: true

require_relative 'train.rb'

# Грузовой поезд
class TrainCargo < Train
  def initialize(number)
    super(number, 'cargo')
  end
end
