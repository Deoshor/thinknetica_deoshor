class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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
