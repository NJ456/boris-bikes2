class DockingStation
  attr_reader :collection
  #This is what happens when you make a new docking station
  #Sets the collection attribute to a new collection object
  #to a new collection object with a given capacity
  #Takes a capacity argument which defaults to 20
  def initialize(capacity = 20)
    @collection = Collection.new(capacity)
  end

#Docs a bike
#If statement checks if dock is full, if full docks a bike if not
#raises an error
  def dock_bike(bike)
    raise "dock is full" if full? 
    puts "Is this bike broken y/n"
    input = gets.chomp
    case input.upcase
    when "Y"
      bike.broken
    end
    if bike.working?
      @collection.bikes << bike
    else
      @collection.broken_bikes << bike
    end
  end

#Releases a bike
#If statement checks if dock is empty, if empty raises an error if not
#releases a bike
  def release_bike
    if empty?
      raise "dock is empty"
    else
      @collection.bikes.pop
    end
  end


  private
    def full?
     @collection.bikes.length == @collection.capacity
   end

   def empty?
     @collection.bikes.empty?
   end
 end

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
