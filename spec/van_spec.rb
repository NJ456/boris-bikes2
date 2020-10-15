require "van"

describe Van do
  context "At docking station" do
 end
  describe "initialize" do
   it "sets default capacity to 5" do
     expect(subject.collection.capacity).to eq 5
   end
   it "takes a given capacity" do
     van = Van.new(40)
     expect(van.collection.capacity).to eq 40
   end
    it "starts at the garage" do
      expect(subject.location).to eq "garage"
    end
  end 
end
