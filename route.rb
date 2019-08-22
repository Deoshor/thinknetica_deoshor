require_relative 'station.rb'
class Route
  attr_reader :station_name, :route

  def initialize(station_name)
    @station_name = station_name
    @route = []
  end

  def route_create(station_name1, station_name2)
    @route << [station_name1, station_name2]
  end

  def station_add(station_add)
    @route.insert(-2, station_add)
  end

  def station_delete(station_delete)
    @route.delete(station_delete)
  end

end
