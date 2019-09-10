class Route
  include InstanceCounter
  attr_reader :stations, :first, :last

  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
    register_instance
    validate!
  end

  def validate!
    raise "First name can't be nil" unless first
    raise "Last name can't be nil" unless last
  end

  def valid?
    validate!
    true
  rescue
    false
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
