require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(bikes=[])
		@bikes = bikes
	end

end
