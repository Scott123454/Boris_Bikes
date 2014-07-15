require_relative 'bike_container'

class Van
	include BikeContainer
	alias :fixed_bikes :available_bikes
	attr_reader :bikes

	def initialize(bikes=[])
		@bikes = bikes
	end

	def pickup_broken_bikes_from(place)
		@bikes.concat(place.release_broken_bikes)
	end

	def drop_broken_bikes_into(place)
		drop_into(place, broken_bikes)
	end

	def drop_bikes_into(place)
		drop_into(place, fixed_bikes)
	end

	def drop_into(place, bike_type)
		bike_type.each do |bike|
			place.dock(release(bike))
		end
	end

end