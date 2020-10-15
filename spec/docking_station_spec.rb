require 'docking-station'

RSpec.describe DockingStation do
  it {should respond_to(:release_bike)}


  describe "release_bike" do
    it "Expects Bike released to be working" do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("N")
      subject.dock_bike(Bike.new)
      bike = subject.release_bike
      expect(bike.working?).to eq(true)

    end
    it "Returns a Bike object when release_bike is called" do
      subject.dock_bike(Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end

    it "raises error if dock is empty" do
      expect{subject.release_bike}.to raise_error("dock is empty")
    end


  end

  describe "initialize" do
   it "sets default capacity to 20" do
     expect(subject.collection.capacity).to eq 20
   end
   it "takes a given capacity" do
     docking_station = DockingStation.new(40)
     expect(docking_station.collection.capacity).to eq 40
   end
  end

  describe "dock_bike" do
    it "raises error if a bike is docked" do
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("N")
      20.times{subject.dock_bike(Bike.new)}
      expect{subject.dock_bike(Bike.new)}.to raise_error("dock is full")
    end
    it "docking station allows us to dock a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.collection.bikes.include?(bike)).to eq (true)
    end
    it "allows user to report the bike is broken" do
      subject.dock_bike(Bike.new)
      allow(subject).to receive(:puts).and_return(nil)
      allow(subject).to receive(:gets).and_return("Y")
      expect(subject.collection.bikes.last.working?).to eq false
    end


  end
end
