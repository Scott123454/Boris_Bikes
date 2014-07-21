require 'garage'
require_relative 'bike_container_spec'

describe Garage do
	it_behaves_like BikeContainer

	it 'fixes bikes' do
		bike = double :bike, broken?: true
		garage = Garage.new([bike])
		expect(bike).to receive(:fix!)
		garage.fix_bikes
	end

	it 'only fixes the broken bikes' do
		bike = double :bike, broken?: false
		broken_bike = double :bike, broken?: true
		expect(bike).not_to receive(:fix!)
		expect(broken_bike).to receive(:fix!)
		garage = Garage.new([bike, broken_bike])
		garage.fix_bikes
	end
end

