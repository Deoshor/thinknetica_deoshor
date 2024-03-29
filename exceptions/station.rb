class Station
  include InstanceCounter
  attr_reader :name, :trains
  @@all_station = []
  NAME_FORMAT = /^[A-ZА-Я][a-zа-я]*/

  def self.all
    puts @@all_station
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_station << self
    validate!
    register_instance
  end

  def validate!
    raise "Name can't be nil" unless name
    raise "Name should be at least 3 symbols" if name.length < 3
    raise "Name has invalid format" if name !~ NAME_FORMAT
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def accept_train(train)
      @trains << train unless @trains.include?(train)
      puts "Поезд № #{train.number} прибыл на станцию '#{@name}'"
      puts
  end

  def trains_list
    puts "На станции #{@name} в данный момент: "
    puts
    @trains.each do |train|
      puts "№ поезда: #{train.number} - тип поезда: '#{train.type}' - количество вагонов: #{train.wagons.size}"
    end
  end

  def trains_add(train)
    @trains << train
  end

  def trains_remove(train)
    @trains.delete(train)
  end

  def trains_type(type)
    @trains.count { |train| train.type == type }
  end

end
