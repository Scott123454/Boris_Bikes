module BikeContainer

	BROKEN_BIKE_SELECTOR = ->(bike){bike.broken?}

	def has_bikes?
		@bikes.any?
	end

	def broken_bikes
		@bikes.select(&BROKEN_BIKE_SELECTOR)
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def available_bikes
		@bikes.reject(&BROKEN_BIKE_SELECTOR)
	end

end
