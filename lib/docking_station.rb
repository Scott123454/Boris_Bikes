class DockingStation

	def initialize(bikes = [])
		@bikes = bikes
	end	

	def has_bikes?
		@bikes.any?
	end

	def release_bike
		@bikes.delete(available_bikes.pop)
	end

	def available_bikes
		@bikes.reject {|bike| bike.broken?}
	end

end