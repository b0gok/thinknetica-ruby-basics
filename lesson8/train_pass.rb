# frozen_string_literal: true

require_relative 'train'
require_relative 'wagon_pass'

# Passenger train
class TrainPass < Train
  protected

  def can_add_wagon?(wagon)
    wagon.is_a? WagonPass
  end
end
