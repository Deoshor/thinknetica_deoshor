class Route
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def station_add(station)
    @stations.insert(-2, station)
    puts "Станция #{station.name} добавлена в маршрут"
  end

  def station_remove(station)
    @stations.delete(station)
  end

  def show_route
      puts "Станции на маршруте #{@stations[0]} - #{@stations[-1]}"
      @stations.each_with_index { |stations, i| puts "#{i + 1}. #{stations}" }
      puts
    end

end
