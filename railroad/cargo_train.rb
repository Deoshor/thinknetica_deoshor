class CargoTrain < Train

  def initialize(number)
    @number = number
    @type = 'cargo'
    @wagons = []
    @speed = 0
  end

end
