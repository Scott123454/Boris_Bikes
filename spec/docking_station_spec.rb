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

	it 'bike returned and nil returned from dock method' do
		station=DockingStation.new
		expect(station.dock(:bike)).to be_nil
	end

	it 'releases a specific bike' do
		expect(station.release(bike)).to eq bike
	end

	context 'releasing broken bikes' do
 
	let(:broken_bike) {double :bike, broken?: true}
	let(:broken_bike_two) {double :bike, broken?: true}
	let(:station) {DockingStation.new([broken_bike, broken_bike_two])}

		it 'can release all broken bikes to a van' do
			van = double :van
			expect(van).to receive(:dock).twice
			station.drop_broken_bikes_into(van)
		end

		it 'has no bikes after releasing the broken bikes' do
			van = double :van, dock: nil
			station.drop_broken_bikes_into(van)
			expect(station).not_to have_bikes
		end

		it 'shows us the broken bikes' do
			expect(station.broken_bikes).to eq [broken_bike, broken_bike_two]
		end	

	end
end