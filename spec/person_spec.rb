require 'person'

describe Person do

	let(:person) {Person.new}

	it 'has no bike when created' do
		expect(person).not_to have_bike
	end

	it 'can have a bike' do
		person = Person.new(:bike)
		expect(person).to have_bike
	end

	it 'can have a bike accident' do
		bike = double :bike
		person = Person.new(bike)
		expect(bike).to receive(:break!)
		person.fall_down
	end

	it 'can rent a bike from a docking station' do
		station = double :station
		expect(station).to receive(:release_bike)
		person.rent_bike_from(station)
	end

	it 'has a bike after renting one from the station' do
		station = double :station, release_bike: :bike
		expect(person.rent_bike_from(station)).to have_bike
	end

	it 'returns a bike to a station' do
		station = double :station
		expect(station).to receive(:dock)
		person.return_bike_to(station)

	end

end