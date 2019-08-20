require_relative 'station.rb'
require_relative 'route.rb'
class Train
  attr_accessor :number, :type, :wagons
  attr_reader :route
  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @train = []
    @train << number.to_s
    @train << type.to_s
    @train << wagons.to_i
    @rt = []
    @x = 0
  end
  def train_speedup(speed)
    @speed += speed.to_i
  end
  def train_speed
    @speed
  end
  def train_stop
    @speed = 0
  end
  def train_in
    if @speed == 0
      t = @train.at(2)
      t += 1
      @train[2] = t
    else
      puts "Остановите поезд, чтобы прицепить вагоны."
    end
  end
  def train_out
    if @speed == 0
      t = @train.at(2)
      t -= 1
      @train[2] = t
    else
      puts "Остановите поезд, чтобы отцепить вагоны."
    end
  end
  def train_wagons
    @train.at(2)
  end
  def train_route(route)
    @route = route
    puts "#{@train.at(0)} на станции #{@route.first}"
  end
  def train_goto(route)
    @route = route
    if @rt != @route.last
      @x += 1
      @rt = @route.at(0 + @x.to_i)
      @rt
    else
      puts "Поезд №#{@number} на конечной станции"
    end
  end
  def train_backto(route)
    @route = route
    if @rt != @route.first
      @x -= 1
      @rt = @route.at(0 + @x.to_i)
      @rt
    else
      puts "Поезд №#{@number} на начальной станции"
    end
  end
  def station_present
    @rt
  end
  def station_next
    y = @route.index(@rt.to_s)
    @nrt = @route.at(y + 1)
    @nrt
  end
  def station_last
    y = @route.index(@rt.to_s)
    @lrt = @route.at(y - 1)
    @lrt
  end
end
