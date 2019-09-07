class CargoTrain < Train

  def initialize(number)
    @number = number
    @type = 'cargo'
    @wagons = []
    @speed = 0
    @@all_trains[self.number] = self
    register_instance
  end

end
