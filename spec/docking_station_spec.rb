require 'docking-station'

RSpec.describe DockingStation do
  before(:each) do
    allow(subject).to receive(:gets).and_return("N")
  end

  let(:bike) { double(:working? => true, :broken => nil) }

  it {should respond_to(:release_bike)}


  describe "release_bike" do
    it "Expects Bike released to be working" do
      subject.dock_bike(bike)
      bike = subject.release_bike
      expect(bike.working?).to eq(true)
    end

    it "Returns an object from the bike array when release_bike is called" do
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it "raises error if dock is empty" do
      expect{subject.release_bike}.to raise_error("dock is empty")
    end

    it "won't release a broken bike" do
      allow(subject).to receive(:gets).and_return("Y")
      allow(bike).to receive(:working?).and_return(false)
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error("dock is empty")
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
    it "raises error if a bike is docked while docking station is full" do
      allow(subject).to receive(:puts).and_return(nil)
      20.times{subject.dock_bike(bike)}
      expect{subject.dock_bike(bike)}.to raise_error("dock is full")
    end
    it "docking station allows us to dock a bike" do
      subject.dock_bike(bike)
      expect(subject.collection.bikes.include?(bike)).to eq(true)
    end
    it "allows user to report the bike is broken" do
      allow(subject).to receive(:gets).and_return("Y")
      allow(bike).to receive(:working?).and_return(false)
      subject.dock_bike(bike)
      expect(subject.collection.broken_bikes.last.working?).to eq(false)
    end
    it "adds working bikes to the bikes array" do
      subject.dock_bike(bike)
      expect(subject.collection.bikes.include?(bike)).to eq(true)
    end

    it "adds broken bikes to the broken_bikes array" do
      allow(subject).to receive(:gets).and_return("Y")
      allow(bike).to receive(:working?).and_return(false)
      subject.dock_bike(bike)
      expect(subject.collection.broken_bikes.include?(bike)).to eq(true)
    end
  end
end
