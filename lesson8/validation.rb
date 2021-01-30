# frozen_string_literal: true

# Add validation to classes
module Validation
  def valid?
    validate!
  rescue StandartError
    false
  end
end
