# frozen_string_literal: true

# Создать модуль InstanceCounter, содержащий следующие методы класса и инстанс-методы, которые подключаются автоматически при вызове include в классе:
# Методы класса:
# - instances, который возвращает кол-во экземпляров данного класса
# Инстанс-методы:
# - register_instance, который увеличивает счетчик кол-ва экземпляров класса и который можно вызвать из конструктора. При этом данный метод не должен быть публичным.
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    @@instances = 0

    def instances
      @@instances
    end
  end

  module InstanceMethods
    protected

    def register_instance
      @@instances += 1
      self.class.instances
    end
  end
end
