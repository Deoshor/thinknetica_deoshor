class PassengerTrain < Train

  def initialize(number)
    @number = number
    @type = 'passenger'
    @wagons = []
    @speed = 0
  end

end
