require_relative 'station.rb'
require_relative 'route.rb'
class Train
  attr_accessor :number, :route
  attr_reader :speed, :wagons, :type, :present

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons.to_i
    @speed = 0
    @present = []
    @x = 0
  end

  def speedup(speed)
    @speed += speed.to_i
  end

  def stop
    @speed = 0
  end

  def in
    if @speed == 0
      @wagons += 1
    else
      puts "Остановите поезд, чтобы прицепить вагоны."
    end
  end

  def out
    if @speed == 0
      @wagons -= 1
    else
      puts "Остановите поезд, чтобы отцепить вагоны."
    end
  end

  def goto(route)
    @route = route
    if @present != @route.last
      @x += 1
      @present = @route.at(0 + @x.to_i)
    else
      puts "Поезд №#{@number} на конечной станции"
    end
  end

  def backto(route)
    @route = route
    if @present != @route.first
      @x -= 1
      @present = @route.at(0 + @x.to_i)
    else
      puts "Поезд №#{@number} на начальной станции"
    end
  end

  def next
    station_index = @route.index(@present)
    @route.at(station_index + 1)
  end

  def last
    station_index = @route.index(@present)
    @route.at(station_index - 1)
  end

end


#@present - это текущая станция
#@x - нужен для счетчика итераций, чтобы передвигаться по маршруту
