# frozen_string_literal: true

# Добавляет валидацию
module Validation
  def valid?
    validate!
  rescue StandartError
    false
  end
end
