module BikeContainer

	BROKEN_BIKE_SELECTOR = ->(bike){bike.broken?}

	def capacity
		@capacity
	end

	def full?
		@bikes.count == capacity
	end

	def has_bikes?
		@bikes.any?
	end

	def bikes
		@bikes
	end

	def broken_bikes
		@bikes.select(&BROKEN_BIKE_SELECTOR)
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def dock(bike)
		raise "FULL" if full?
		@bikes << bike 
		nil
	end
	
	def release_bike
		release(available_bikes.pop)
	end

	def available_bikes
		@bikes.reject(&BROKEN_BIKE_SELECTOR)
	end

	def drop_broken_bikes_into(place)
		drop_into(place, broken_bikes)
	end

	def drop_bikes_into(place)
		drop_into(place, available_bikes)
	end

	def drop_into(place, bike_type)
		bike_type.each do |bike|
			place.dock(release(bike))
		end
	end

end
