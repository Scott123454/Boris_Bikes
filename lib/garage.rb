require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(bikes=[])
		@bikes = bikes
	end

	def fix_bikes
		@bikes.first.fix!
	end

end
