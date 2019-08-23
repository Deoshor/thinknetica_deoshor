require_relative 'train.rb'
class Station
  attr_accessor :train, :name, :type
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_add(train)
    @trains << train
  end

  def trains_delete(train)
    @trains.delete(train)
  end

  def trains_type(type)
    @trains.count { |train| train.type == type }
  end

end
