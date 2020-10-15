class Bike
  def initialize(working = true)
    @working = working
  end

  def working?
    return @working
  end

  def broken
    @working = false
  end 
end
