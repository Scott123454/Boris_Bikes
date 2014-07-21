require_relative 'bike_container'

class DockingStation
	include BikeContainer

	def initialize(bikes = [], capacity = 20)
		@bikes = bikes
		@capacity = capacity
	end	

end