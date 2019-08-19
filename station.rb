class Station
  attr_accessor :station_name, :train
  def initialize(station_name)
    @station_name = station_name
    @trains = []
  end
  def trains
    puts @trains
  end
  def trains_add(train, type)
    @trains << train
    @trains << type
  end
  def trains_delete(train)
    d = @trains.index(train)
    @trains.delete(train)
    @trains.delete_at(d)
  end
  def trains_type(train)
    @trains.count(train)
  end
end
