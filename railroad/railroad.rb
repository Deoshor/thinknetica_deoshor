#irb -r './railroad/main.rb'
class RailRoad
  attr_accessor :trains, :routes, :stations, :unused_carriages
  attr_reader :station

  def initialize
    @trains = []
    @routes = []
    @stations = []
    @unused_wagons = []
  end

  def train_menu
    all_trains
    puts
    print 'Выберите поезд (порядковый номер) или введите 0 для возврата в главное меню: '
    input = gets.chomp.to_i
    puts
    if input == 0
      main_menu
    else
      @train = @trains[input - 1]
      puts "Выбран поезд #{@train.number}"
      puts
      puts "1. Назначить маршрут"
      puts "2. Добавить вагоны к поезду"
      puts "3. Отцепить вагоны от поезда"
      puts "4. Переместить поезд"
      puts "5. Выбрать другой поезд"
      puts "6. Создать другой поезд"
      puts "0. Главное меню"
      puts
      print "Выберите пункт меню "
      input = gets.chomp.to_i
      case input
        when 1
          all_routes
          print "Выберите маршрут: "
          route = gets.chomp.to_i
          @train.route_set(@routes[route - 1])
          train_menu
        when 2
          all_wagons
          print "Выберите вагон: "
          wagon = gets.chomp.to_i
          @train.wagons_add(@unused_wagons[wagon - 1])
          train_menu
        when 3
          train_wagons
          print "Выберите вагон: "
          wagon = gets.chomp.to_i
          @train.wagons_remove(@train.wagons[wagon - 1])
          train_menu
        when 4
          direction = ''
          until direction == 0
            unless @train.route.nil?
              move_train_menu
              direction = gets.chomp.to_i
              if direction == 1
                @train.move_next
              elsif direction == 2
                @train.move_prev
              end
            else
              puts "Сначала назначьте маршрут"
              train_menu
            end
          end
        when 5
          train_menu
        when 6
          create_train
          train_menu
        when 0
          main_menu
      end
    end
  end

  def station_menu
    input = ''
    until input == 0
      puts "1. Создать станцию"
      puts "2. Посмотреть список всех станций"
      puts "3. Посмотреть поезда на станции"
      puts "0. Главное меню"

      print 'Выберите пункт меню: '
      input = gets.chomp.to_i
      case input
        when 1
          create_station
          station_menu
        when 2
          all_stations
          station_menu
        when 3
          all_stations
          puts
          print "Выберите станцию: "
          station = gets.chomp.to_i
          @stations[station - 1].trains_list
          puts
          station_menu
        end
      end
    main_menu
  end

  def route_menu
    puts "1. Создать маршрут"
    puts "2. Посмотреть список всех маршрутов"
    puts "3. Добавить станцию в маршрут"
    puts "0. Главное меню"
    print 'Выберите пункт меню: '
    input = gets.chomp.to_i
    case input
      when 1
        create_route
        route_menu
      when 2
        all_routes
        route_menu
      when 3
        all_routes
        puts
        print "Выберите маршрут "
        route = gets.chomp.to_i
        all_stations
        puts
        print "Выберите станцию "
        station = gets.chomp.to_i
        @routes[route - 1].station_add(@stations[station - 1])
      when 0
        main_menu
      end
    route_menu
  end


  def create_route
    puts "Введите начальную станцию маршрута:"
    first_station = gets.chomp
    first_station = Station.new(first_station)
    puts "Введите конечную станцию маршрута:"
    last_station = gets.chomp
    last_station = Station.new(last_station)
    @routes << Route.new(first_station, last_station)
    route_menu
  end

  def create_station
    print "Введите название новой станции:"
    input = gets.chomp
    @stations << Station.new(input)
    station_menu
  end

  def create_train
    print "Введите номер поезда: "
    number = gets.chomp
    print "Выберите тип поезда (cargo, passenger):"
    type = gets.chomp
      if type == 'cargo'
        @trains << CargoTrain.new(number)
      elsif type == 'passenger'
        @trains << PassengerTrain.new(number)
      end
    train_menu
  end

  def all_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name}"
    end
  end

  def move_train_menu
    puts "1. Вперед"
    puts "2. Назад"
    puts "0. Главное меню"
    puts
    print "В какую сторону переместить поезд? "
  end

  def all_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. #{train.number} | #{train.type}"
    end
  end

  def all_wagons
    @unused_wagons.each.with_index(1) do |wagon, index|
      puts "#{index}. #{wagon.number} - #{wagon.type}"
    end
  end

  def train_wagons
    @train.wagons.each.with_index(1) do |wagon, index|
      puts "#{index}. #{wagon.number} - #{wagon.type}"
    end
  end

  def all_routes
    @routes.each.with_index(1) do |route, index|
    puts "#{index}. #{route.stations[0].name} - #{route.stations[-1].name}"
    puts "Включает станции: "
    route.stations.each do |station|
      puts "#{station.name}"
    end
      puts
    end
  end

  def main_menu
    puts 'Программа управления железной дорогой'
    puts 'Выберите пункт меню, нажав соответствующую цифру'
    puts '1. Вывести информацию о поездах'
    puts '2. Вывести информацию о станциях'
    puts '3. Вывести информацию о маршрутах'
    puts '0. Выход'
    input = gets.chomp.to_i
    until input == 0
      system('clear')
      if input == 1
        system('clear')
        train_menu
      elsif input == 2
        system('clear')
        station_menu
      elsif input == 3
        system('clear')
        route_menu
      else
        main_menu
      end
    end
    puts "Пока."
    exit
  end

  def seed
    # Moscow - Spb
    @stations << station1 = Station.new('Москва')
    @stations << station2 = Station.new('Тверь')
    @stations << station3 = Station.new('Вышний Волочек')
    @stations << station4 = Station.new('Бологое-Московское')
    @stations << station5 = Station.new('Окуловка')
    @stations << station6 = Station.new('Малая Вишера')
    @stations << station7 = Station.new('Санкт-Петербург')

    # Omsk - Nobosibirsk
    @stations << station8 = Station.new('Омск')
    @stations << station9 = Station.new('Татарская')
    @stations << station10 = Station.new('Озеро-Карачинское')
    @stations << station11 = Station.new('Барабинск')
    @stations << station12 = Station.new('Убинская')
    @stations << station13 = Station.new('Каргат')
    @stations << station14 = Station.new('Чулымская')
    @stations << station15 = Station.new('Обь')
    @stations << station16 = Station.new('Новосибирск')

    @trains << train1 = CargoTrain.new('R457')
    @trains << train2 = CargoTrain.new('F896')
    @trains << train3 = CargoTrain.new('C584')
    @trains << train4 = CargoTrain.new('G210')
    @trains << train5 = CargoTrain.new('N451')
    @trains << train6 = CargoTrain.new('N451')
    @trains << train7 = PassengerTrain.new('L845')
    @trains << train8 = PassengerTrain.new('K654')
    @trains << train9 = PassengerTrain.new('U471')
    @trains << train10 = PassengerTrain.new('P001')
    @trains << train11 = PassengerTrain.new('O624')

    @unused_wagons << wagon1 = CargoWagon.new('c1')
    @unused_wagons << wagon2 = CargoWagon.new('c2')
    @unused_wagons << wagon3 = CargoWagon.new('c3')
    @unused_wagons << wagon4 = CargoWagon.new('c4')
    @unused_wagons << wagon5 = CargoWagon.new('c5')
    @unused_wagons << wagon6 = CargoWagon.new('c6')
    @unused_wagons << wagon7 = PassengerWagon.new('p1')
    @unused_wagons << wagon8 = PassengerWagon.new('p2')
    @unused_wagons << wagon9 = PassengerWagon.new('p3')
    @unused_wagons << wagon10 = PassengerWagon.new('p4')
    @unused_wagons << wagon11 = PassengerWagon.new('p5')
    @unused_wagons << wagon12 = PassengerWagon.new('p6')

    @stations[0].accept_train(trains[0])
    @stations[0].accept_train(trains[1])
    @stations[0].accept_train(trains[2])
    @stations[0].accept_train(trains[3])


    @routes << route1 = Route.new(station1, station7)
    route1.station_add(station5)
    route1.station_add(station3)
    route1.station_add(station4)
    @routes << route2 = Route.new(station8, station16)
    route2.station_add(station9)
    route2.station_add(station11)
    route2.station_add(station15)
  end

end
