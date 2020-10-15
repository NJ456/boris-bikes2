class Collection
  attr_reader :capacity
  attr_accessor :bikes, :broken_bikes
  #What happens when a new collection is made, sets the bikes to an empty array
  #and sets capacity to 20
  def initialize(capacity)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end
end
