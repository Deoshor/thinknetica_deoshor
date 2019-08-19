class Route
  attr_accessor :first_station, :last_station
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @route = []
    @route << first_station
    @route << last_station
  end
    def route_add(station_add)
    x = @route[-1]
    @route[-1] = station_add
    @route << x
  end
  def route_delete(station_delete)
    @route.delete(station_delete)
  end
  def route
    @route
  end
end
