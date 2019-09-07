require_relative './company.rb'
require_relative './instance_counter.rb'
require_relative './station.rb'
require_relative './route.rb'
require_relative './train.rb'
require_relative './passenger_train.rb'
require_relative './passenger_wagon.rb'
require_relative './cargo_train.rb'
require_relative './cargo_wagon.rb'
require_relative './wagon.rb'
require_relative './railroad.rb'

system('clear')

rr = RailRoad.new
rr.seed

#rr.main_menu

puts
puts "Количество экземпляров:"
puts "Станции: #{Station.instances}"
puts "Маршруты: #{Route.instances}"
puts "Пассажирские поезда: #{PassengerTrain.instances}"
puts "Грузовые поезда: #{CargoTrain.instances}"
puts
Train.find('R457')
Train.find('C584')
puts
Station.all
