require "van"

describe Van do
  let(:docking_station) { double(:working? => true, :broken => nil) }
  let(:bike) { double(:working? => true, :broken => nil) }
  
  describe "#initialize" do
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
  
  describe "#pickup_bikes" do

    context "At docking station" do
      let(:subject) { Van.new(5, "docking station") }
      before(:each) do
        allow_any_instance_of(DockingStation).to receive(:gets).and_return("N")
      end

      it "picks up as many bikes as can fit" do
        docking_station = DockingStation.new
        10.times { docking_station.dock_bike(Bike.new(false)) }
        subject.pickup_bikes(docking_station)
        expect(subject.collection.broken_bikes.length).to eq(5)
      end

      it "picks up as many bikes as can fit" do
        docking_station = DockingStation.new
        3.times { docking_station.dock_bike(Bike.new(false)) }
        subject.pickup_bikes(docking_station)
        expect(subject.collection.broken_bikes.length).to eq(3)
      end

      it "only picks up broken bikes" do
        docking_station = DockingStation.new
        10.times { docking_station.dock_bike(Bike.new(false)) }
        subject.pickup_bikes(docking_station)
        any_working = false
        subject.collection.broken_bikes.each do |bike|
          if bike.working?
            any_working = true
            return
          end
        end 
        expect(any_working).to eq(false)
      end

      it "doesn't touch working bikes" do
        docking_station = DockingStation.new
        10.times { docking_station.dock_bike(Bike.new) }
        subject.pickup_bikes(docking_station)
        expect(subject.collection.bikes.length).to eq(0)
      end
    end

    context "At garage" do
      let(:subject) { Van.new(5, "garage") }

      it "picks up as many working bikes as can fit" do
      end

      it "doesn't touch broken bikes" do
      end
    end
  end

  # describe "#pickup_bike" do
  #   context "At docking station" do
  #     let(:subject) { Van.new(5, "docking station") }

  #     it "picks up as a broken bike" do
  #     end

  #     it "doesn't touch working bikes" do
  #     end
  #   end

  #   context "At garage" do
  #     let(:subject) { Van.new(5, "garage") }

  #     it "picks up a working bike" do
  #     end

  #     it "doesn't touch broken bikes" do
  #     end
  #   end
  # end
end
