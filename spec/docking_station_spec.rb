require 'docking_station'
require_relative 'bike_container_spec'

describe DockingStation do
	let(:bike) {double :bike, broken?: false}
	let(:station) {DockingStation.new([bike])}

	it_behaves_like BikeContainer

	it 'cannot release a broken bike' do
		broken_bike = double :bike, broken?: true
		station = DockingStation.new([broken_bike])
		station.release_bike
		expect(station).to have_bikes
	end

end