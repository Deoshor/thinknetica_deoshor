require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'

class Ra

  def menu
    puts "Введите 1 чтобы создать станцию"
    puts "Введите 2 чтобы управлять станцией"
    puts "Введите 0 чтобы выйти, да"
    input = gets.chomp.to_i
    case
      when input == 1
        puts "Введите название станции"
        station = gets.chomp
        print station
        x = Station.new(station)
        print x
      when input == 2
        puts "Введите название станции 2"
    end
  end
end
  #создание станции

  #создание поезда
  #создание маршрута и управление станциями в нем
  #назначать маршрут к поезду
  #добавлять вагоны к поезду
  #отцеплять вагоны от поезда
