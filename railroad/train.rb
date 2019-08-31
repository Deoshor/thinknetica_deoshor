#load './railroad/train.rb'
require_relative './cargo_train.rb'
require_relative './passenger_train.rb'
class Train
  attr_accessor :wagons, :route, :speed, :current_station
  attr_reader :number, :type

  def route_set(route)
    @route = route
    @current_station = @route.stations.first
    @station_index = @route.stations.index(@current_station)
  end

  def speedup
    @speed += 10
    puts "Поезд №#{@number}. Текущая скорость #{@speed} км/ч"
  end

  def stop
    @speed = 0
    puts "Поезд №#{@number}. Текущая скорость #{@speed} км/ч"
  end

  def train_length
    puts "Количество вагонов в поезде: #{@wagons.size}"
  end

  def wagons_add(wagon)
    if @type != wagon.type
      puts "Тип вагона не совпадает с типом поезда"
    elsif @speed > 0
      puts "Остановите поезд, чтобы прицепить вагоны"
    else
      @wagons << wagon
      puts "Вагон прицеплен!"
      train_length
    end
  end

  def wagons_remove(wagon)
    if @speed > 0
      puts "Остановите поезд, чтобы отцепить вагоны"
    elsif @wagons.include? wagon
      @wagons.delete(wagon)
      puts @wagons
      puts "Вагон отцеплен!"
      train_length
    else
      puts "Такого вагона не существует"
    end
  end

  def station_first?
    @current_station == @route.station.first
  end

  def station_last?
    @current_station == @route.station.last
  end

  def station_next
    if station_last?
      puts "Поезд №#{@number} находится на конечной станции"
    else
      @station_next = @route.route[@station_index + 1]
    end
  end

  def station_prev
    if station_first?
      puts "Поезд №#{@number} находится на конечной станции"
    else
      @station_prev = @route.route[@station_index - 1]
    end
  end


  def move_next
    if last_station?
      puts "Поезд №#{@number} находится на конечной станции маршрута"
    else
      @station_index += 1
      @next_station = @route.route[@station_index]
      puts "Поезд № #{@number} был отправлен со станции
      '#{@current_station.name}' в сторону станции '#{@next_station.name}' "
    end
  end

end
