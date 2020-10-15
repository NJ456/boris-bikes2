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
    if !full?
     @collection.bikes << bike
    else
     raise "dock is full"
    end
    puts "Is this bike broken y/n"
    input = gets.chomp
    case input.upcase
    when "Y"
      @collection.bikes.last.broken
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
     if @collection.bikes.length == @collection.capacity
       return true
     else
       return false
     end
   end

   def empty?
     if @collection.bikes.empty?
       return true
     else
       return false
     end
   end
 end

class Collection
  attr_reader :capacity
  attr_accessor :bikes
  #What happens when a new collection is made, sets the bikes to an empty array
  #and sets capacity to 20
  def initialize(capacity)
    @bikes = []
    @capacity = capacity
  end
end
