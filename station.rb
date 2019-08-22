class Station
  attr_accessor :train
  attr_reader :trains, :name

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

  def trains_type(train)
    @trains.count(train)
  end

end
