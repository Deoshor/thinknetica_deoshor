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

  def station_delete(station_delete)
    @route.delete(station_delete)
  end

end
