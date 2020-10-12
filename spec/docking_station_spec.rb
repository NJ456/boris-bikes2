require 'docking-station'

describe DockingStation do
  # it "DockingStation has a release method" do
  #   expect(subject).to respond_to(:release_bike)
  # end
  it {expect respond_to(:release_bike)}
end
