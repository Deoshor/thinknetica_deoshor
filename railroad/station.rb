class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_list
    puts "На станции #{name} в данный момент: "
    puts

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
