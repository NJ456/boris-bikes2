require 'docking-station'

describe DockingStation do
  it "DockingStation has a release method" do
    expect(subject).to respond_to(:release_bike)
  end
  # it {expect respond_to(:release_bike)}

  it "Returns a Bike object when release_bike is called" do
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it "Expects Bike released to be working" do
    bike = subject.release_bike
    expect(bike.working?).to eq(true)
  end
end
