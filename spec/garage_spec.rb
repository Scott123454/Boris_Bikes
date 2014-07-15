require 'garage'
require_relative 'bike_container_spec'

describe Garage do
	it_behaves_like BikeContainer

	# 'it can be created with bikes' do
	# 	expect(Garage.new([:bike])).to have_bikes
	# end
end

