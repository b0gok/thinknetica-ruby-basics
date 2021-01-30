# frozen_string_literal: true

# Add counter param
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
