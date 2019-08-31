class Route
  attr_accessor :route, :first, :last

  def initialize(first, last)
    @first = first
    @last = last
    @route = []
    @route << first
    @route << last
  end

  def station_add(station_add)
    @route.insert(-2, station_add)
  end

  def station_remove(station_remove)
    @route.delete(station_remove)
  end

end
