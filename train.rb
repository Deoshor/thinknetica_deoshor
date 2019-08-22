require_relative 'station.rb'
require_relative 'route.rb'
class Train
  attr_accessor :number
  attr_reader :route, :speed, :wagons, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
    @pres_stat = []
    @x = 0
  end

  def speedup(speed)
    @speed += speed.to_i
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

  def train_goto(route)
    @route = route
    if @pres_stat != @route.last
      @x += 1
      @pres_stat = @route.at(0 + @x.to_i)
      @pres_stat
    else
      puts "Поезд №#{@number} на конечной станции"
    end
  end

  def train_backto(route)
    @route = route
    if @pres_stat != @route.first
      @x -= 1
      @pres_stat = @route.at(0 + @x.to_i)
      @pres_stat
    else
      puts "Поезд №#{@number} на начальной станции"
    end
  end

  def station_present
    @pres_stat
  end

  def station_next
    station_index = @route.index(@pres_stat)
    @route.at(station_index + 1)
    @nrt
  end

  def station_last
    station_index = @route.index(@pres_stat)
    @route.at(station_index - 1)
  end

end


#@pres_stat - это текущая станция
#@x - нужен для счетчика итераций, чтобы передвигаться по маршруту
#В конце при вызове методов определяющих следующую и предыдущую
#станцию не может быть в индексе -1. Мы же вызываем сам метод, не 
#не подставляя туда значения индекса. А у метода есть ограничения,
#за которые он не шагнет.
