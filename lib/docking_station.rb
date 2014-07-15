require_relative 'bike_container'

class DockingStation
	include BikeContainer

	def initialize(bikes = [])
		@bikes = bikes
	end	

	def release_bike
		release(available_bikes.pop)
	end

	def dock(bike)
		@bikes << bike
		nil
	end

	def release_broken_bikes
		broken_bikes.map{|bike| release(bike)}
	end

end