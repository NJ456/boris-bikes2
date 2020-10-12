require 'bike'

describe Bike do
  it 'Responds to the working? method' do
    expect(subject).to respond_to(:working?)
  end
end