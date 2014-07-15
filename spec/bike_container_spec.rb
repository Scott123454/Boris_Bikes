require 'bike_container'

shared_examples BikeContainer do
	let(:container){described_class.new}
	let(:bike) {double :bike, broken?: false}
	let(:filled_container){described_class.new([bike])}

	it 'has no bikes' do
		expect(container).not_to have_bikes
	end				

	it 'can be created with bikes' do
		expect(filled_container).to have_bikes
	end

	it 'can release a bike' do
		filled_container.release_bike
		expect(filled_container).not_to have_bikes
	end

	it 'has available bikes' do
		expect(filled_container.available_bikes).to eq [bike]
	end

	it 'can dock a bike' do
		container.dock(:bike)
		expect(container).to have_bikes
	end


end