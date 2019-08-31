require_relative './train.rb'
class PassengerTrain < Train

  TRAIN_TYPE = 'passenger'

  def initialize(number)
    @number = number
    @type = TRAIN_TYPE
    @wagons = []
    @speed = 0
  end

end
