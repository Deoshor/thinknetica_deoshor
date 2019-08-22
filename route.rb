require_relative 'station.rb'
class Route
  attr_reader :route, :first, :last

  def initialize(first, last)
    @route << [first, last]
  end

  def station_add(station_add)
    @route.insert(-2, station_add)
  end

  def station_delete(station_delete)
    @route.delete(station_delete)
  end

end
