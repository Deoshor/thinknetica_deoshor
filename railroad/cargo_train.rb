class CargoTrain < Train

  TRAIN_TYPE = 'cargo'

  def initialize(number)
    @number = number
    @type = TRAIN_TYPE
    @wagons = []
    @speed = 0
  end

end
