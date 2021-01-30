# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

# Station
class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
  end

  def add_train(train)
    @trains << train
  end

  def trains_count_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) if block_given? }
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
  end
end
