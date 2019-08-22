class Station
  attr_accessor :name, :train, :type
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_add(train, type)
    @trains = [train, type]
  end

  def trains_delete(train)
    @trains.delete(train)
  end

  def trains_type(train)
    @trains.count(train)
  end

end
