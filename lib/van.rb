require_relative "collection"


class Van
  attr_reader :collection, :location
  def initialize(capacity = 5, location = "garage")
   @collection = Collection.new(capacity)
   @location = location
 end

end
