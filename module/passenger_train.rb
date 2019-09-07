class PassengerTrain < Train

  def initialize(number)
    @number = number
    @type = 'passenger'
    @wagons = []
    @speed = 0
    @@all_trains[self.number] = self
    register_instance
  end

end
