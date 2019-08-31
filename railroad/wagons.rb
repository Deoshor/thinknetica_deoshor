class Wagons
  attr_reader :number, :type
  def initialize(number, type)
    @number = number
    @type = type
  end
end

class PassengerWagons < Wagons
  def initialize(number, type = 'passenger')
    super
  end
end

class CargoWagons < Wagons
  def initialize(number, type = 'cargo')
    super
  end
end
