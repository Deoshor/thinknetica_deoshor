require_relative './wagon.rb'
class CargoWagon < Wagon
  NUMBER_FORMAT = /\w{3}-?{1}\w{2}$/

  def initialize(number)
    super(number, 'cargo')
  end

  def validate!
    raise "Number can't be nil" unless number
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
  end

  def valid?
    validate!
    true
  rescue
    false
  end

end
