require 'bike_container'

shared_examples BikeContainer do
	let(:container){described_class.new}
	let(:bike) {double :bike, broken?: false}
	let(:filled_container){described_class.new([bike])}

	it 'is not full' do
		expect(container).not_to be_full
	end

	it 'can only be filled up to capacity' do
		times = container.capacity + 1
		expect{times.times {container.dock(:bike)}}.to raise_error "FULL"
	end

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

	it 'bike returned and nil returned from dock method' do
		expect(container.dock(:bike)).to be_nil
	end

	it 'releases a specific bike' do
		expect(filled_container.release(bike)).to eq bike
	end

	it 'shows us the bikes it has' do
		expect(described_class.new([:bike]).bikes).to eq [:bike]
	end

	it 'drops broken bikes at a place' do
		place = double :place
		bike = double :bike, broken?: true
		container = described_class.new([bike])
		expect(place).to receive(:dock)
		container.drop_broken_bikes_into(place)
	end

	it 'drops fixed bikes into a place' do
		place = double :place
		bike = double :bike, broken?: false
		container = described_class.new([bike])
		expect(place).to receive(:dock)
		container.drop_bikes_into(place)
	end

	context 'releasing broken bikes' do
 
		let(:broken_bike) {double :bike, broken?: true}
		let(:broken_bike_two) {double :bike, broken?: true}
		let(:container_with_two) {described_class.new([broken_bike, broken_bike_two])}

		it 'can release all broken bikes to a van' do
			van = double :van
			expect(van).to receive(:dock).twice
			container_with_two.drop_broken_bikes_into(van)
		end

		it 'has no bikes after releasing the broken bikes' do
			van = double :van, dock: nil
			container_with_two.drop_broken_bikes_into(van)
			expect(container_with_two).not_to have_bikes
		end

		it 'shows us the broken bikes' do
			expect(container_with_two.broken_bikes).to eq [broken_bike, broken_bike_two]
		end	

	end


end