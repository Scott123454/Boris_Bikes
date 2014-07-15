require_relative 'bike_container'

class DockingStation
	include BikeContainer

	def initialize(bikes = [])
		@bikes = bikes
	end	

end