require 'garage'
require_relative 'bike_container_spec'

describe Garage do
	it_behaves_like BikeContainer

	it 'fixes bikes' do
		bike = double :bike
		garage = Garage.new([bike])
		expect(bike).to receive(:fix!)
		garage.fix_bikes
	end
end

