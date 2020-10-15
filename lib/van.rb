require_relative "collection"

class Van
  attr_reader :collection, :location

  def initialize(capacity = 5, location = "garage")
    @collection = Collection.new(capacity)
    @location = location
  end
  
  def pickup_bikes(pickup_location)
    if @location == "docking station"
      while @collection.broken_bikes.length < @collection.capacity
        if pickup_location.collection.broken_bikes.empty?
          break
        end
        p "test"
        bike = pickup_location.collection.broken_bikes.pop
        @collection.broken_bikes << bike
      end
    end
  end
end
