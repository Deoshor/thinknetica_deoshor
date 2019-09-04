require_relative './station.rb'
require_relative './route.rb'
require_relative './train.rb'
require_relative './passenger_train.rb'
require_relative './passenger_wagons.rb'
require_relative './cargo_train.rb'
require_relative './cargo_wagons.rb'
require_relative './wagons.rb'
require_relative './railroad.rb'

system('clear')

rr = RailRoad.new
rr.seed

rr.main_menu
